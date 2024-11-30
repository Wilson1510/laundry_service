package laundry

import grails.gorm.transactions.Transactional

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

@Transactional
class OrderService {
    def springSecurityService
    def showData(String user, parameter = ""){
        def data = ""
        switch (user){
            case 'admin_dashboard':
                data = Order.list()
                break
            case 'admin_detail':
                data = Order.findById(parameter as int)
                break
            case 'customer':
                data = Order.findAllByPhoneNumber(parameter)
                break
            case 'filter_payment':
                data = Order.findAllByPayment(parameter)
                break
            case 'filter_status':
                data = Order.findAllByStatusInList(parameter)
                break
            case 'filter_phone_number':
                def keyword =  parameter ?: ""
                keyword = "%${keyword}%"
                data = Order.findAllByPhoneNumberLike(keyword)
                break
            case 'filter_name':
                def keyword =  parameter ?: ""
                keyword = "%${keyword}%"
                data = Order.findAllByNameLike(keyword)
                break
            case 'filter_order_type':
                data = Order.findAllByOrderTypeInList(parameter)
                break
            default:
                return "Tidak ada data"
        }

        def price = [
                laundry_kiloan: 10000,
                laundry_express_24: 12000,
                laundry_express_3: 16000,
                bed_cover: 30000,
                setelan: 25000,
                sepatu_tas: 30000
        ]
        def formatter = DateTimeFormatter.ofPattern("d MMMM yyyy HH:mm:ss", Locale.forLanguageTag("id"))
        def formattedData = data.collect{datum ->
            [
                    id: datum.id,
                    name: datum.name,
                    orderType: datum.orderType,
                    quantity: datum.quantity,
                    address: datum.address,
                    phoneNumber: datum.phoneNumber,
                    status: datum.status,
                    payment: datum.payment,
                    total: price[datum.orderType] * datum.quantity,
                    formattedDate: datum.orderDate.format(formatter),
                    washedDate: datum.washedDate.format(formatter),
                    ironedDate: datum.ironedDate.format(formatter),
                    deliveredDate: datum.deliveredDate.format(formatter),
                    finishedDate: datum.finishedDate.format(formatter),
                    paidDate: datum.paidDate.format(formatter),
                    finishDate: datum.orderDate.plusDays(3).format(formatter),
                    finishDate24: datum.orderDate.plusDays(1).format(formatter),
                    finishDate3: datum.orderDate.plusHours(3).format(formatter)
            ]
        }
        return formattedData
    }

    def saveOrder(Map params){
        def order = new Order(params)
        def message = ""
        if (!order.validate()) {
            if (!(order.name || order.orderType || order.quantity || order.address || order.phoneNumber)){
                message = "Isi form"
            }
            else if(!order.name){
                message = "Isi nama"
            }
            else if(!order.orderType){
                message = "Pilih layanan"
            }
            else if(!order.quantity){
                message = "Tentukan jumlah pesanan"
            }
            else if(!order.address){
                message = "Isi alamat"
            }
            else{
                message = "Isi nomor telepon"
            }
            return [isBlank: true, message: message]
        }
        order.save(flush: true)

        def user = new User(username: order.phoneNumber, password: '123')
        if(user.save(flush:true)){
            UserRole.create(user, Role.findByAuthority('ROLE_CUSTOMER'), true)
            message = order.name+"'s new order is added and 's account is created"
        }
        else{
            message = order.name+"'s new order is added"
        }
        return [isBlank: false, message: message]
    }

    def updateData(Map params){
        def newOrder = Order.get(params.orderId)
        newOrder.name = params.name
        newOrder.orderType = params.orderType
        newOrder.quantity = params.quantity as Integer
        newOrder.address = params.address
        newOrder.phoneNumber = params.phoneNumber
        newOrder.save(flush: true)
        return newOrder.name +"'s order is updated"
    }

    def deleteData(Map params){
        def deleteOrder = Order.findById(params.orderId as int)
        def message = deleteOrder.name + "'s order is deleted"
        if (deleteOrder){
            deleteOrder.delete(flush: true)
        }
        return message
    }

    def changeStatus(Map params){
        def statusList = ["Diambil", "Dicuci", "Disetrika", "Diantar", "Selesai"]
        def date = [Dicuci: 'washedDate', Disetrika: 'ironedDate', Diantar: 'deliveredDate', Selesai: 'finishedDate']
        def dateProgress = ""
        def message = ""
        Order.withTransaction { status ->
            def order = Order.findById(params.orderId as int)
            if(order){
                if(params.statusButton == "Update"){
                    order.status = statusList[statusList.indexOf(params.status) + 1]
                    dateProgress = date[order.status]
                    order."$dateProgress" = LocalDateTime.now()
                }
                else{
                    dateProgress = date[order.status]
                    order."$dateProgress" = order.orderDate
                    order.status = statusList[statusList.indexOf(params.status) - 1]
                }
                order.save()
                Order.withSession {
                    it.flush()
                }
                message = order.status
            }
            else{
                message = "Gagal"
            }
        }
        return message
    }

    def changePayment(Map params){
        def orderId = params.orderId as Long
        def message = ""
        Order.withTransaction {status ->
            def order = Order.findById(orderId)
            if (order){
                order.payment = params.payment
                if(order.payment == 'Lunas'){
                    order.paidDate = LocalDateTime.now()
                }
                else{
                    order.paidDate = order.orderDate
                }
                order.save(flush: true)
                message = order.payment
            }
            else{
                message = "Gagal"
            }
        }
        return message
    }

    def orderStatus(){
        def currentUsername = springSecurityService.currentUser.username
        def formattedData = showData('customer', currentUsername)
        return formattedData
    }
}
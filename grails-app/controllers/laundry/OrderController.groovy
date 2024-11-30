package laundry
import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class OrderController {
    def orderService
    def index(){
        render(view: 'index')
    }

    def order(){
        render(view: "order")
    }

    def saveOrder() {
        try {
            def order = orderService.saveOrder(params)
            if(order.isBlank){
                flash.message = order.message
                redirect(action:'order')
                return
            }
            flash.message = order.message
            redirect(action: 'admin')
        }

        catch (ValidationException e) {
            flash.message = "Failed to submit order: ${e.message}"
            redirect(action: "admin")
        }
    }

    def admin() {
        def formattedData = orderService.showData('admin_dashboard')
        render(view: "admin", model: [orders: formattedData, complaints: Complaint.list()])
    }

    def editData(){
        def order = Order.findById(params.orderId as int)
        render(view: "edit-page", model: [orders: order])
    }

    def updateData(){
        flash.message = orderService.updateData(params)
        redirect(action: 'admin')
    }

    def deleteData(){
        flash.message = orderService.deleteData(params)
        redirect(action: 'admin')
    }

    def changeStatus(){
        flash.message = orderService.changeStatus(params)
        redirect(action: "detailOrder", params: [orderId: params.orderId])
    }

    def changePayment(){
        flash.message = orderService.changePayment(params)
        redirect(action: "detailOrder", params: [orderId: params.orderId])
    }

    def orderStatus(){
        render(view: 'status', model: [orders:orderService.orderStatus()])
    }

    def detailOrder(){
        def order = orderService.showData('admin_detail', params.orderId)[0]
        render(view: 'detail', model: [order: order, from: params.from])
    }

    def filterPayment(){
        def order = orderService.showData('filter_payment', params.payment)
        render(view: 'admin', model: [orders: order])
    }

    def filterStatus(){
        def order = orderService.showData('filter_status', params.list('status'))
        render(view: 'admin', model: [orders: order])
    }

    def filterPhoneNumber(){
        def order = orderService.showData('filter_phone_number', params.phoneNumber)
        render(view: 'admin', model: [orders: order])
    }

    def filterName(){
        def order = orderService.showData('filter_name', params.name)
        render(view: 'admin', model: [orders: order])
    }

    def filterOrderType(){
        def order = orderService.showData('filter_order_type', params.list('orderType'))
        render(view: 'admin', model: [orders: order])
    }
}
package laundry

import grails.gorm.transactions.Transactional

@Transactional
class ComplaintService {
    def springSecurityService
    def sendComplaint(Map params) {
        def username = springSecurityService.currentUser.username
        def complaint = new Complaint(name:params.name, orderType: params.orderType,  phoneNumber: username, message: params.complaintMessage, orderId: params.orderId as int)
        if(!complaint.validate()){
            return[isBlank: true, message: "Isi keluhan"]
        }
        complaint.save(flush: true)
        return [isBlank: false, message: "Keluhan telah dikirim. Silahkan tunggu admin menghubungi anda."]
    }

    def complaintStatus(Map params){
        def complaint = Complaint.findById(params.complaintId as int)
        def message = ""
        if (complaint){
            complaint.status = "Selesai"
            complaint.save(flush: true)
            message = complaint.status
        }
        else{
            message = "Gagal"
        }
        return message

    }

    def deleteComplaint(Map params){
        def deleteOrder = Complaint.findById(params.orderId as int)
        def message = ""
        if (deleteOrder){
            message = "Complaint with phone number "+deleteOrder.phoneNumber+" is deleted"
            deleteOrder.delete(flush: true)
        }
        return message
    }
}
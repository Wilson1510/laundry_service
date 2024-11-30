package laundry

import grails.gorm.transactions.Transactional

@Transactional
class ComplaintController {
    def complaintService
    def index() {
        def senderInfo = [orderId:params.orderId, name: params.name, orderType: params.orderType]
        render(view: 'complaint', model: [complaints: senderInfo])
    }

    def sendComplaint(){
        def complaint = complaintService.sendComplaint(params)
        if(complaint.isBlank){
            flash.message = complaint.message
            redirect(action: 'index')
            return
        }
        flash.message = complaint.message
        redirect(controller: 'order', action:'orderStatus')
    }

    def showComplaint(){
        render(view: "complaintList", model: [complaints: Complaint.list()])
    }

    def complaintStatus(){
        flash.message = complaintService.complaintStatus(params)
        redirect(action: "showComplaint")
    }
    def deleteComplaint(){
        flash.message = complaintService.deleteComplaint(params)
        redirect(action: 'showComplaint')
    }
}
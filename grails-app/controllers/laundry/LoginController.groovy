package laundry

import grails.gorm.transactions.Transactional

@Transactional
class LoginController {
    def loginService
    def index(){
        if(params.error){
            flash.message = "Masukkan username atau password yang benar"
        }
        render(view: 'index')
    }

    def logout(){
        session.invalidate()
        redirect(action: 'index')
    }

    def changePassword(){
        render(view: 'changePassword')
    }

    def updatePassword(){
        def newPassword = loginService.updatePassword(params)
        if(!newPassword.isMatched){
            flash.message = newPassword.message
            redirect(action: 'changePassword')
            return
        }
        flash.message = newPassword.message
        redirect(controller: 'order', action: 'orderStatus')
    }
}
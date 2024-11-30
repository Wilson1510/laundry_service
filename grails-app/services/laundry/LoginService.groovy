package laundry

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {
    def springSecurityService
    def updatePassword(Map params) {
        def currentUser = User.findByUsername(springSecurityService.currentUser.username)
        def newPassword = params.newPassword
        if(!newPassword){
            return [isMatched: false, message: "Password tidak boleh kosong"]
        }
        else if(springSecurityService.passwordEncoder.matches(newPassword, currentUser.password)){
            return [isMatched: false, message: "Password tidak boleh sama dengan sebelumnya"]
        }
        currentUser.password = newPassword
        currentUser.save(flush: true)
        return [isMatched: true, message: "Password berhasil diubah"]
    }
}
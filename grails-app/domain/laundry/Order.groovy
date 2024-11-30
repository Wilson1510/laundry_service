package laundry

import grails.validation.Validateable

import java.time.LocalDateTime

class Order implements Validateable{
    String name
    String orderType
    Integer quantity
    String address
    String phoneNumber
    String status = "Diambil"
    LocalDateTime orderDate = LocalDateTime.now()
    LocalDateTime washedDate = orderDate
    LocalDateTime ironedDate = orderDate
    LocalDateTime deliveredDate = orderDate
    LocalDateTime finishedDate = orderDate
    LocalDateTime paidDate = orderDate
    String payment = "Belum Lunas"
    static constraints = {
        name nullable: false, blank: false
        orderType nullable: false, blank: false
        quantity nullable: false, min: 1
        address nullable: false, blank: false
        phoneNumber nullable: false, blank: false, matches: /\d+/
        status nullable: false
        orderDate nullable: false
        washedDate nullable: false
        ironedDate nullable: false
        deliveredDate nullable: false
        finishedDate nullable: false
        paidDate nullable: false
        payment nullable: false
    }
    static mapping = {
        table "`order`"
    }
}
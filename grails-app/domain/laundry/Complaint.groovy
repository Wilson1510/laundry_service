package laundry

class Complaint {
    String name
    String phoneNumber
    String orderType
    String message
    String status = "Belum ditangani"
    Integer orderId
    static constraints = {
        name nullable: false, blank: false
        phoneNumber nullable: false, blank: false
        orderType nullable: false, blank: false
        message nullable: false, blank: false
        status nullable: false, blank: false
        orderId nullable: false, blank: false
    }
    static mapping = {
        table: 'complaint'
    }
}
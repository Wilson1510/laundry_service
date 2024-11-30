package laundry

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ComplaintSpec extends Specification implements DomainUnitTest<Complaint> {

     void "test domain constraints"() {
        when:
        Complaint domain = new Complaint()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}

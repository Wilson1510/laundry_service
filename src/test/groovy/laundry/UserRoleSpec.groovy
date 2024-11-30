package laundry

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class UserRoleSpec extends Specification implements DomainUnitTest<UserRole> {

     void "test domain constraints"() {
        when:
        UserRole domain = new UserRole()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}

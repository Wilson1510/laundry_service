package laundry

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class CustomerControllerSpec extends Specification implements ControllerUnitTest<CustomerController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}

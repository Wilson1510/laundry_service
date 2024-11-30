package laundry

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ComplaintControllerSpec extends Specification implements ControllerUnitTest<ComplaintController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}

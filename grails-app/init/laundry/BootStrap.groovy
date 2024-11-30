package laundry

import java.sql.Time
import java.text.SimpleDateFormat

class BootStrap {

    def init = { servletContext ->
        // Buat organizer

        Role.withTransaction {
            // Buat roles jika belum ada
            def customerRole = Role.findByAuthority('ROLE_CUSTOMER') ?: new Role(authority: 'ROLE_CUSTOMER').save(failOnError: true)
            def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

            // Buat akun User
            def customer = User.findByUsername('customer') ?: new User(
                    username: 'customer',
                    password: 'password',
                    email: "customer@gmail.com"
            ).save(failOnError: true)

            // Buat akun Organizer
            def admin = User.findByUsername('admin') ?: new User(
                    username: 'admin',
                    password: 'password',
                    email: 'admin@gmail.com',
            ).save(failOnError: true)

            if (!customer.authorities.contains(customerRole)) {
                UserRole.create(customer, customerRole, true)
            }
            if (!admin.authorities.contains(adminRole)) {
                UserRole.create(admin, adminRole, true)
            }
        }
    }

    def destroy = {
    }
}
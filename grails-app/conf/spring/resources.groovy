import laundry.UserPasswordEncoderListener
import laundry.CustomAuthenticationSuccessHandler
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    authenticationSuccessHandler(CustomAuthenticationSuccessHandler)
}

package laundry

import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler

import javax.servlet.ServletException
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class CustomAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{

    @Override
    void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String redirectUrl = determineTargetUrl(authentication)
        redirectUrl = redirectUrl ?: "/order"

        response.sendRedirect(redirectUrl)
    }

    protected String determineTargetUrl(Authentication authentication) {
        def roles = authentication.authorities*.authority

        if (roles.contains("ROLE_ADMIN")){
            return "/order/admin"
        } else if (roles.contains("ROLE_CUSTOMER")) {
            return "/order/orderStatus"
        }
        return null
    }
}

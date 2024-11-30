

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'laundry.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'laundry.UserRole'
grails.plugin.springsecurity.authority.className = 'laundry.Role'
grails.plugin.springsecurity.auth.loginFormUrl = "/login/authenticate"
grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/login/index?error=true'
//grails.plugin.springsecurity.auth.authenticationFailureUrl = "/login/index"
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/order/index', access: ['permitAll']],
	[pattern: '/order/**', access: ['ROLE_ADMIN']],
	[pattern: '/order/orderStatus', access: ['ROLE_CUSTOMER']],
	[pattern: '/complaint/showComplaint', access: ['ROLE_ADMIN']],
	[pattern: '/complaint/deleteComplaint', access: ['ROLE_ADMIN']],
	[pattern: '/complaint/detailComplaint', access: ['ROLE_ADMIN']],
	[pattern: '/complaint/complaintStatus', access: ['ROLE_ADMIN']],
	[pattern: '/complaint/index', access: ['ROLE_CUSTOMER']],
	[pattern: '/complaint/sendComplaint', access: ['ROLE_CUSTOMER']],

]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]


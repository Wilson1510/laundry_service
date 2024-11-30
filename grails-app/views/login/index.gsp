%{--<%----}%
%{--  Created by IntelliJ IDEA.--}%
%{--  User: wilson--}%
%{--  Date: 31/10/24--}%
%{--  Time: 17.03--}%
%{----%>--}%

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
%{--        <meta name="layout" content="${gspLayout ?: 'main'}"/>--}%
        <title><g:message code='springSecurity.login.title'/></title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                background-color: #f7f7f7;
            }

            #login {
                width: 340px;
                margin: 60px auto;
                padding: 0;
                background-color: #f0f0fa;
                border: 1px solid #aab;
                box-shadow: 2px 2px 2px #eee;
            }

            .fheader {
                padding: 18px 26px 14px;
                background-color: #f7f7ff;
                color: #2e3741;
                font-size: 18px;
                font-weight: bold;
                text-align: center;
            }

            .login_message {
                padding: 6px 25px 20px;
                color: #c33;
                text-align: center;
            }

            .cssform {
                padding: 0 25px 20px;
            }

            .cssform p {
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                justify-content: flex-start;
            }

            .cssform label {
                /*width: 100px;*/
                font-weight: bold;
                text-align: right;
                margin-right: 10px;
            }

            .cssform input[type="text"], .cssform input[type="password"] {
                flex: 1;
                padding: 8px;
                font-size: 16px;
            }

            #submit {
                width: 100%;
                padding: 10px;
                background-color: #0072ce;
                color: #fff;
                border: none;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            #submit:hover {
                background-color: #005999;
            }

            #remember_me_holder {
                text-align: center;
                gap:10px;
            }

            #passwordToggler {
                padding: 3px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div id="login">
            <div class="fheader">
                <g:message code="springSecurity.login.header"/>
            </div>
            <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                <p>
                    <label for="username"><g:message code="springSecurity.login.username.label"/>:</label>
                    <input type="text" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none"/>
                </p>
                <p>
                    <label for="password"><g:message code="springSecurity.login.password.label"/>:</label>
                    <input type="password" name="${passwordParameter ?: 'password'}" id="password"/>
                    <i id="passwordToggler" title="Toggle password display" onclick="passwordDisplayToggle()">&#128065;</i>
                </p>
                <p id="remember_me_holder">
                    <input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test="${hasCookie}">checked="checked"</g:if>/>
                    <label for="remember_me"><g:message code="springSecurity.login.remember.me.label"/></label>
                </p>
                <p>
                    <input type="submit" id="submit" value="<g:message code='springSecurity.login.button'/>"/>
                </p>
                <p class="login_message">${flash.message}</p>
            </form>
        </div>

        <script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function() {
                document.forms['loginForm'].elements['username'].focus();
            });

            function passwordDisplayToggle() {
                const passwordInput = document.getElementById("password");
                const toggler = document.getElementById("passwordToggler");
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    toggler.innerHTML = '\u{2715}';
                } else {
                    passwordInput.type = "password";
                    toggler.innerHTML = '&#128065;';
                }
            }
        </script>
    </body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Login Form</title>
    </head>
    <body>
        <div id="logreg-forms">
            <form name = "myform" class="form-signin" action="login" method="get">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
<%--                <p style="color: red">${mess}</p>--%>
                <input name="user"  type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="" onkeyup="ValidateSignIn()">
                <p id = "errorname" style="color: red"></p>
                <input name="pass"  type="password" id="inputPassword" class="form-control" placeholder="Password" required="" onkeyup="ValidateSignIn()">
                <p id = "errorpass" style="color: red"></p>

                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                </div>

                <button class="btn btn-success btn-block" type="submit" onclick="ValidateSignIn()"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <hr>
                <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button>
            </form>

            <form name="myform1" action="signup" method="get" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign up</h1>
                <input name="user" type="text" id="username12" class="form-control" placeholder="User name" required autofocus="" onkeyup="ValidateSignUp()">
                <p id = "errorusername" style="color: red"></p>
                <input name="pass" type="password" id="userpass" class="form-control" placeholder="Password" required autofocus="" onkeyup="ValidateSignUp()">
                <p id = "erroruserpass" style="color: red"></p>
                <input name="repass" type="password" id="userrepeatpass" class="form-control" placeholder="Repeat Password" required autofocus="" onkeyup="ValidateSignUp()">
                <p id = "erroruserrepeatpass" style="color: red"></p>

                <button class="btn btn-primary btn-block" type="submit" onclick="ValidateSignUp()"><i class="fas fa-user-plus"></i> Sign Up</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
                <p id = "error" style="color: red"></p>
            </form>
            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>

            function ValidateSignIn() {
                var username = document.myform.inputEmail.value;
                var passname = document.myform.inputPassword.value;

                if (username == "") {
                    document.getElementById("errorname").innerHTML = "Không để trống username";
                } else {
                    document.getElementById("errorname").innerHTML = "";
                }

                if (passname == "") {
                    document.getElementById("errorpass").innerHTML = "Không để trống password";
                } else {
                    document.getElementById("errorpass").innerHTML = "";
                    if (passname.length < 6) {
                        document.getElementById("errorpass").innerHTML = "Độ dài password phải lớn hơn 5";
                    } else {
                        document.getElementById("errorpass").innerHTML = "";
                    }
                }
            }
            function ValidateSignUp() {
                var username1 = document.myform1.username12.value;
                var passname1 = document.myform1.userpass.value;
                var repassname1 = document.myform1.userrepeatpass.value;

                if (username1 == "") {
                    document.getElementById("errorusername").innerHTML = "Không để trống username";
                } else {
                    document.getElementById("errorusername").innerHTML = "";
                }

                if (passname1 == "") {
                    document.getElementById("erroruserpass").innerHTML = "Không để trống password";
                } else {
                    document.getElementById("erroruserpass").innerHTML = "";
                    if (passname1.length < 6) {
                        document.getElementById("erroruserpass").innerHTML = "Độ dài password phải lớn hơn 5";
                    } else {
                        document.getElementById("erroruserpass").innerHTML = "";
                    }
                }
                if (repassname1 == "") {
                    document.getElementById("erroruserrepeatpass").innerHTML = "Không để trống repassword";
                } else {
                    document.getElementById("erroruserrepeatpass").innerHTML = "";
                    if (repassname1.length < 6) {
                        document.getElementById("erroruserrepeatpass").innerHTML = "Độ dài password phải lớn hơn 5";
                    } else {
                        document.getElementById("erroruserrepeatpass").innerHTML = "";
                    }
                }
            }



            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() // display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
    </body>
</html>
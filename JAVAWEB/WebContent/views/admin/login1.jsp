<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
<%@include file="css/login1.css" %>
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="/style.css">
    <title>Đăng nhập</title>
</head>
<body>
        <div id="logreg-forms" class="form-control emty" >
            <form class="form-signin empty" action="${pageContext.request.contextPath}/LoginControl" method="post">
            
                <h1 style="text-align: center" > Đăng nhập</h1>
             
             	  <p class="text-danger">${mess}</p>
                
                <input  name="username" type="text" id="inputEmail" class="form-control" placeholder="tài khoản" required="" autofocus="">
                <br>
                <input name="password"  type="password" id="inputPassword" class="form-control" placeholder="mật khẩu" required="">

                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu</label>
                </div>

                <button class="btn btn-6 btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhâp</button>
                <hr>
                <button class="btn btn-6 btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Đăng ký</button>
            </form>

            <form action="${pageContext.request.contextPath}/SignUpControl" method="post" class="form-signup empty" class="form-control emty">
                <h1  style="text-align: center"> Đăng ký</h1>
                  
                <input name="user" type="text" id="user-name" class="form-control" placeholder="tài khoản" required="" autofocus="">
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="mật khẩu" required autofocus="">
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="nhập lại mật khẩu" required autofocus="">
                

                <button class="btn btn-6 btn-block" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> trở về</a>
            </form>
            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
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
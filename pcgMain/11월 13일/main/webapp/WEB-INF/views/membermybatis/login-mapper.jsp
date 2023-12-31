<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<style>

* {
    margin: 0;
    padding: 0;
}

html{
    width: 100%;
    height: 100vh;
}

body {
    background: #e5e5e5;
    width: 100%;
    text-align: center;
    font-family: 'Open Sans', sans-serif;
    font-weight: 600;
    letter-spacing: 1px;
}


 /* 뒷 배경임 나중에 바꾸고 싶으면 바꾸삼 */
.panel{
    width: 450px;
    max-width: 90%;
    height: 700px;
     background:url('https://picsum.photos/1000/1500?image=827')  #fff;
    background-repeat:no-repeat;
    background-position: top center;
    background-size: cover;
    margin:5% auto 0px;
}




.shadow1{
  -webkit-box-shadow:  0 20px 15px -15px rgba(119, 119, 119, 0.85);
     -moz-box-shadow:  0 20px 15px -15px rgba(119, 119, 119, 0.85);
          box-shadow:  0 40px 30px -30px rgba(119, 119, 119, 0.85);
}


form{
    height: 700px;
    padding: 50px;
}

.panel-switch{
    text-align: center;
    margin-top: 30px;
}

.panel-switch button{
    display: inline-block;
    width: 100px;
    height: 40px;
    background: #f03699;
    margin: 0px 10px 50px;
    border: none;
    color: #fff;
    font-family: 'Open Sans', sans-serif;
    text-transform: uppercase;
    font-weight: 600;
    letter-spacing: 2px;
    font-size: 0.8em;
    
	transition: background-color 0.2s, color 0.2s, opacity 0.2s;
}

.panel-switch button:active{
    background: #b52773;
    color: #c9c9c9;
}

.active-button{
    opacity: 0.5;
}

button , .button , a {
    cursor: pointer;
}

form h1{
    color: #fff;
    font-family: 'Open Sans', sans-serif;
    text-transform: uppercase;
    font-weight: 600;
    letter-spacing: 4px;
    margin: 50px 0;
    font-size: 1.7em;
}

fieldset{
    border: none;
}

.animate1 , .animate2 , .animate3 , .animate4{
    -webkit-animation-duration: 2s;
    -moz-animation-duration: 2s;
}

.animate1
{
    -webkit-animation-delay: 0.2s;
    -moz-animation-delay: 0.2s;
}

.animate2
{
    -webkit-animation-delay: 0.7s;
    -moz-animation-delay: 0.7s;
}

.animate3
{
    -webkit-animation-delay: 1.1s;
    -moz-animation-delay: 1.1s;
}

.animate4
{
    -webkit-animation-delay: 1.5s;
    -moz-animation-delay: 1.5s;
}

.animate5
{
    -webkit-animation-delay: 2.2s;
    -moz-animation-delay: 2.2s;
}

@-webkit-keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }
}

fieldset input{
    background: rgba(255, 255, 255, 0.2);
    border: none;
    border-radius: 5em;
    height: 20px;
    width: 80%;
    margin: 10px 0;
    padding: 5px;
    text-indent: 10px;
    color: #fff;
    font-weight: 600;
}

fieldset input::placeholder {
    color: #c7c6c6;
}


fieldset input:focus {
   
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 5em;
    margin: 9px 0;
}

.login_form{
    position: relative;
    bottom:0;
    width: 70%;
    height: 4em;
    margin-top: 150px;
    border: none;
    border-radius: 10em;
    background: #f03699;
    color: #fff;
    font-family: 'Open Sans', sans-serif;
    text-transform: uppercase;
    font-weight: 600;
    letter-spacing: 2px;
    z-index: 1;
    
    transition: background-color 0.2s , color 0.2s;
}

#login-form-submit:active{
    background: #b52773;
    color: #c9c9c9;
}

p , a{
    margin: 0;
    padding: 0;
}

a{
    color: #898787;
    font-size: 0.7em;
    text-decoration: none;
}

.hidden{
    display: none;
}




</style>












<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      
        <!-- Font online-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
      
<!--        Animate.css-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
                
                                
     
        
        <!-- Google JQuery CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
     

    </head>
    <body>
        <div>
           <div class="panel shadow1">
                <form class="login-form">
                    <div class="panel-switch animated fadeIn">
                        <button type="button" id="sign_up" class="active-button">Sign Up</button>
                        <button type="button" id="log_in" class="" disabled>Log in</button>
                    </div>
                    <h1 class="animated fadeInUp animate1" id="title-login">Welcome Back !</h1>
                    <h1 class="animated fadeInUp animate1 hidden" id="title-signup">Welcome !</h1>
                    <fieldset id="login-fieldset">
                        <input class="login animated fadeInUp animate2"  name="username" type="textbox"  required   placeholder="아이디를 적어주쇼"  >
                        <input class="login animated fadeInUp animate3"  name="password" type="password" required placeholder="이번엔 비밀번호를..." >
                    </fieldset>
                    <fieldset id="signup-fieldset" class="hidden">
                        <input class="login animated fadeInUp animate2"  name="username" type="textbox"  required   placeholder="Username"  >
                        <input class="login animated fadeInUp animate3"   name="password" type="password" placeholder="Choose password"  required >
                    </fieldset>
                    <input type="submit" id="login-form-submit" class="login_form button animated fadeInUp animate4" value="Log in">
                    <input type="submit" id="signup-form-submit" class="login_form button animated fadeInUp animate4 hidden" value="Sign up">
                    <p><a id="lost-password-link" href="javascript:void(0);" onclick="idfind();" class="animated fadeIn animate5">I forgot my  user_id (!)</a>
                    <a id="lost-password-link" href="javascript:void(0);" onclick="pwfind();" class="animated fadeIn animate5">I forgot my  password (!)</a></p>
                </form>
            </div>
        </div>
        <script >
        $(document).ready(function(){
        	//--------- change color value of the form text/password inputs -----

        	  const textInputs =  $("input[type='textbox']");
        	  const passwordsInputs =  $("input[type='password']");
        	  //--------- Login screen swicth -----

        	    $("button").click(function(event){  //  prevent buttons in form to reload
        	        event.preventDefault();
        	    });
        	  
        	   
        	    
        	    $("#sign_up").click(function(){ // when click Sign Up button, hide the Log In elements, and display the Sign Up elements
        	        $("#title-login").toggleClass("hidden",true);
        	        $("#login-fieldset").toggleClass("hidden",true);
        	        $("#login-form-submit").toggleClass("hidden",true);
        	        $("#lost-password-link").toggleClass("hidden",true);
        	        $("#sign_up").toggleClass("active-button",false);
        	        $("#log_in").removeAttr("disabled");
        	        
        	        $("#title-signup").toggleClass("hidden",false);
        	        $("#signup-fieldset").toggleClass("hidden",false);
        	        $("#signup-form-submit").toggleClass("hidden",false);
        	        $("#log_in").toggleClass("active-button",true);
        	        $("#sign_up").prop('disabled', true);
        	    });
        	    
        	    $("#log_in").click(function(){ // when click Log In button, hide the Sign Up elements, and display the Log In elements
        	        $("#title-login").toggleClass("hidden",false);
        	        $("#login-fieldset").toggleClass("hidden",false);
        	        $("#login-form-submit").toggleClass("hidden",false);
        	        $("#lost-password-link").toggleClass("hidden",false);
        	        $("#sign_up").toggleClass("active-button",true);
        	        $("#log_in").prop('disabled', true);
        	        
        	        $("#title-signup").toggleClass("hidden",true);
        	        $("#signup-fieldset").toggleClass("hidden",true);
        	        $("#signup-form-submit").toggleClass("hidden",true);
        	        $("#log_in").toggleClass("active-button",false);
        	        $("#sign_up").removeAttr("disabled");
        	        
        	    });
        		
        	    $("#login-form-submit").click(function(){
        	    	console.log("이거 되야 혀");
        			console.log("확인이얌 " + $(".login.animated.fadeInUp.animate2").val());
        			$.ajax({
        				url : "../membermybatis/loginP",
        				type : "POST",
        				 dataType: "json",
        				data : {
        					user_id : $(".login.animated.fadeInUp.animate2").val(),
        					pw : $(".login.animated.fadeInUp.animate3").val()
        				},
        				success : function(result) {
        					
        					console.log(result);
        					
        					if (result === 1){
        					window.location.href = "main-mapper";        					
        						
        					}else if(result === 0){
        							alert("다시 적으렴");
        						
        					}
        					
        				},
        			})
        		});
        	})	
        
    			var newWindow;
        	    function idfind() {
        	     newWindow = window.open("idfind", "하위", "width=500,height=500");
        	    	console.log(newWindow);
        	    };
        	    
        	    
        	    function pwfind() {
        	    	console.log("newWindow");
        	     newWindow = window.open("pwfind", "하위", "width=500,height=500");
        	    	console.log(newWindow);
        	     
        	    
        	    };
        
        
        
        
        
        </script>
    </body>
</html>












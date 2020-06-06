<%-- 
    Document   : index
    Created on : 6 Jun, 2020, 4:27:58 AM
    Author     : umesh
--%>

<%@page import="dto.User"%>
<%@page import="java.util.List"%>
<%@page import="db.MyDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login System</title>
    <link rel="stylesheet" href="./myCss.css">
    
    <link rel="stylesheet" href="bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="topnav" id="myTopnav">
            <a href="index.jsp" class="active"><i class="fa fa-home"></i>Home</a>
            <a href="users.jsp">Users</a>
            <a href="registration.html">Registration</a>
            <a href="login.html">Login</a>
            <a href="javascript:void(0)" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
        </div>

        <div class="container mt-5">
      
    <%
        int id = (int)session.getAttribute("id");
        User user = MyDb.getUser(id);
        
    %>
        <div class="form-row">
          <div class="col-md-4 mb-3">
            <label for="validationTooltip01">First name</label>
            <input type="text" class="form-control" id="fname"  placeholder="First name" value="<%=user.getFirstName()%>" required>
          </div>
          <div class="col-md-4 mb-3">
            <label for="validationTooltip02">Last name</label>
            <input type="text" class="form-control" id="lname" placeholder="Last name" value="<%=user.getLastName()%>" required>
          </div>
          <div class="col-md-4 mb-3">
            <label for="validationTooltipUsername">Username</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
              </div>
              <input type="text" class="form-control" id="username" placeholder="Username" aria-describedby="validationTooltipUsernamePrepend" value="<%=user.getUsername()%>" required>
            </div>
          </div>
        </div>
        <div class="form-row">
           <div class="col-md-6 mb-3">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Password"  required>
          </div>
            <div class="col-md-6 mb-3">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password"  required>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3">
            <label for="validationTooltip03">City</label>
            <input type="text" class="form-control" id="city" placeholder="City" value="<%=user.getCity()%>" required>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationTooltip04">State</label>
            <input type="text" class="form-control" id="state" placeholder="State" value="<%=user.getState()%>" required>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationTooltip05">Zip</label>
            <input type="number" class="form-control" id="zip" placeholder="Zip" value="<%=user.getZip()%>" required>
          </div>
        </div>
        <input type="submit" class="btn btn-primary" value="Submit Form" id="submitBtn" />
    </div>


        <script src="./myJs.js"></script>
        <script src="./jqueryCdn.js"></script>

        <script>
         $(document).ready(()=>{
        $("#submitBtn").click(()=>{
            let fname=$("#fname").val();
            let lname=$("#lname").val();
            let username=$("#username").val();
            let password=$("#password").val();
            let confirmPassword=$("#confirmPassword").val();
            let city=$("#city").val();
            let state=$("#state").val();
            let zip=$("#zip").val();

          $.ajax({
            method:"POST",
            url:"UpdateChecker",
            data:{
                fname:fname,
                lname:lname,
                username:username,
                password:password,
                confirmPassword:confirmPassword,
                city:city,
                state:state,
                zip:zip
            },
            success:function(data){
              if(data == "Success"){
                alert("Update Successful");
              }
              else{
                alert("Updation Failed You can Try again...");
              }
            }
          });
        });
      });
        </script>
    <script src="jquery1.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="jquery2.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    </body>
</html>

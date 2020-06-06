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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./myCss.css">
    
    <link rel="stylesheet" href="bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="topnav" id="myTopnav">
            <a href="index.jsp"><i class="fa fa-home"></i>Home</a>
            <a href="users.html" class="active">Users</a>
            <a href="registration.html">Registration</a>
            <a href="login.html">Login</a>
            <a href="javascript:void(0)" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
        </div>
        <div class="container">
        
      <input class="form-control mt-5" type="search" placeholder="Search" id="search" aria-label="Search"  />

        <div class="table-responsive mt-3">
        <table class="table table-hover table-striped" id="tbl">
        <caption>List Of Users</caption>
            <tr>
                <th>Sr. No.</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
                <th>City</th>
                <th>State</th> 
                <th>Zip</th>
            </tr>
            <%
                List<User> list = MyDb.getAllUsers();
                for(int i = 0;i <list.size();i++){
            %>
                    
            <tr>
                <td><%=(i+1)%></td>
                <td><%=list.get(i).getFirstName()%></td>
                <td><%=list.get(i).getLastName()%></td>
                <td><%=list.get(i).getUsername()%></td>
                <td><%=list.get(i).getCity()%></td>
                <td><%=list.get(i).getState()%></td>
                <td><%=list.get(i).getZip()%></td>
                
            </tr>
            <%  }
            %>
            
            
        </table>
        </div>
        </div>

        <script src="./jqueryCdn.js"></script>

        <script type="text/javascript">
        $("#search").keyup(myFunction);
        function myFunction(){
            let tr = document.getElementsByTagName("tr");
            let searchText = $("#search").val().toUpperCase();

            let len = tr.length;
            let i;
            for(i = 1; i < len;i++){
                let td = tr[i].getElementsByTagName("td");
                let a = td[1].innerHTML+" "+td[2].innerHTML;
                console.log(a.toUpperCase().indexOf(searchText));
                if(a.toUpperCase().indexOf(searchText) >-1){
                    tr[i].style.display="";
                }
                else{
                    tr[i].style.display="none";
                }
            }
        }

        </script>


        <script src="./myJs.js"></script>
    <script src="jquery1.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="jquery2.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    </body>
</html>

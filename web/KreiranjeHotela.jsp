<%-- 
    Document   : Hoteli
    Created on : 16-Dec-2018, 19:26:44
    Author     : andreja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("UlogovanaRola")!=null){
       if(!(request.getSession().getAttribute("UlogovanaRola").equals("2")))
              response.sendRedirect("index.jsp");
    }
    else
        response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kreiranje novog hotela</title>
    </head>
    <body>
         <%@ include file="navbar.jsp" %> 
         <form action = "KreiranjeHotela" method="post" enctype="multipart/form-data" style=" margin: 2% 37%; width: 25rem; background: rgba(0,0,0,0.5); color: white" align="center">
             <h2>Kreiranje hotela</h2>
             <table cellpadding="7px">
                 <tr>
                     <td> Naziv:</td>
                     <td><input type="text" class="form-control" name="Naziv"></td>
                 </tr>
                 <tr>
                     <td>Država:</td>
                     <td><input type="text" class="form-control" name="Drzava"></td>
                 </tr>
                 <tr>
                     <td>Grad:</td>
                     <td><input type="text" class="form-control" name="Grad"></td>
                 </tr>
                 <tr>
                     <td>Adresa:</td>
                     <td><input type="text" class="form-control" name="Adresa"></td>
                 </tr>
                 <tr>
                     <td>Broj zvezdica:</td>
                     <td><input type="text" class="form-control" name="Zvezdice"></td>
                 </tr>
                 <tr>
                     <td>Opis:</td>
                     <td><input type="text" class="form-control" name="Opis"></td>
                 </tr>
                 <tr>
                     <td>Fotografija:</td>
                     <td><input type="file" name="file"></td>
                 </tr>
             </table><br>
             <input type="submit" value="Kreiraj" class="btn btn-success" style="width: 23rem; margin-bottom: 1rem; background-color: #002db3">
         </form>
    </body>
</html>

<%-- 
    Document   : KreiranjeSoba
    Created on : 19-Dec-2018, 22:24:38
    Author     : andreja
--%>

<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>
<%@page import="Models.TipSobe"%>
<%@page import="RepoPattern.TipSobeRepo"%>
<%@page import="Models.Soba"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kreiranje sobe</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
         <% 
            String HotelID = request.getParameter("Hotel_Id");
            ArrayList<TipSobe> tipoviSoba = new TipSobeRepo().lista(HotelID);             
            Hotel hotel = new HotelRepo().select(HotelID);
         %>
         <form action = "KreiranjeSoba" method="post" enctype="multipart/form-data" style=" margin: 2% 37%; width: 25rem; background: rgba(0,0,0,0.5); color: white" align="center">
             <input value="<%=hotel.getHotelId()%>" name="Hotel_Id" type="hidden">
             <h1><%=hotel.getNaziv() %></h1>
             <table cellpadding="7px">
                 <tr>
                     <td>Broj Sobe:</td>
                     <td><input type="text" class="form-control" name="BrojSobe"></td>
                 </tr>
                 <tr>
                     <td>Tip Sobe:</td>
                 <td> 
             <select name="TipSobe" class="form-control">
                 <%
                    for(TipSobe tipSobe:tipoviSoba){
                        {%> 
                            <option value="<%=tipSobe.getTipSobeId()%>"><%=tipSobe.getNaziv() %></option>
                        <%}
                    }
                 %> 
             </select>
             </td>
              </tr>
             <br> </br>
                 <tr>
                     <td>Opis:</td>
                     <td><input type="text" class="form-control" name="Opis"></td>
                 </tr>
                 <tr>
                     <td>Kratki opis:</td>
                     <td><input type="text" class="form-control" name="KratkiOpis"></td>
                 </tr>
                 <tr>
                     <td>Cena:</td>
                     <td> <input type="text" class="form-control" name="Cena"></td>
                 </tr>
                 <tr>
                     <td>Cena u poenima:</td>
                     <td><input type="text" class="form-control" name="CenaUPoenima"></td>
                 </tr>
                 <tr>
                     <td>Kapacitet:</td>
                     <td><input type="text" class="form-control" name="Kapacitet"></td>
                 </tr>
                 <tr>
                     <td>Poeni:</td>
                     <td><input type="text" class="form-control" name="Poeni"></td>
                 </tr>
                 <tr>
                     <td>Fotografija:</td>
                     <td><input type="file" name="file"></td>
                 </tr>
             </table><br>
             <input type="submit" value="Kreiraj sobu" class="btn btn-success" style="width: 23rem; margin-bottom: 1rem; background-color: #002db3">
         </form>
    </body>
</html>

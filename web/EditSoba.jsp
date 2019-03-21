<%-- 
    Document   : EditSoba
    Created on : 19-Dec-2018, 23:46:26
    Author     : andreja
--%>

<%@page import="RepoPattern.TipSobeRepo"%>
<%@page import="Models.TipSobe"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page import="Models.Soba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izmena podataka o sobi</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <% 
            Soba soba = new SobeRepo().select(request.getParameter("Soba_Id"));
        %>
         <form action="EditSoba" method="post" enctype="multipart/form-data" style=" margin: 2% 37%; width: 30rem; background: rgba(0,0,0,0.5); color: white" align="center">
           <input value="<%=request.getParameter("Soba_Id")%>" name="Soba_Id" type="hidden">
           <input value="<%=request.getParameter("Hotel_Id")%>" name="Hotel_Id" type="hidden">
           <div style="padding-left:5%">
              <table text-align: right>
               <tr>
                 <div class="form-inline">
                  <td style="padding-top:2%"><label>Broj sobe: </label></td>
                  <td style="padding-left:2%"><input type="text" class="form-control" placeholder="Broj sobe" value="<%=soba.getBrojSobe()%>" name="BrojSobe"></td>
                 </div>
               </tr>
      
               <tr>
                <div class="form-inline">
                    <td>
                        Tip Sobe: 
                    </td>
                    <td style="padding-top:6%; padding-left:2%">
                       <select name="TipSobe" class="form-control">
                            <option value="<%=soba.getTipSobeID() %>"><%=soba.TipSobe.getNaziv() %></option> 
                            <%
                               for(TipSobe tipSobe: new TipSobeRepo().lista(Integer.toString(soba.getHotelID()))){ 
                                   if(!(soba.TipSobe.getNaziv().equals(tipSobe.getNaziv())))   
                                    {%> <option value="<%=tipSobe.getTipSobeId() %>"><%=tipSobe.getNaziv() %></option> <%}
                               }
                            %> 
                         </select>                        
                    </td>                 
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Opis: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Opis" value="<%= soba.getOpis()  %>"  name="Opis"></td>
                </div>
               </tr>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Kratak opis: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="KratkiOpis" value="<%= soba.getKratkiOpis() %>"  name="KratkiOpis"></td>
                </div>
               </tr>
                <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Cena: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Cena" value="<%= soba.getCena()%>"  name="Cena"></td>
                </div>
               </tr>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Cena sa poenima: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Cena sa poenima" value="<%= soba.getCenaUPoenima()%>"  name="CenaUPoenima"></td>
                </div>
               </tr>
                <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Poeni: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Poeni" value="<%= soba.getPoeni()%>"  name="Poeni"></td>
                </div>
               </tr>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Kapacitet: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Kapacitet" value="<%= soba.getKapacitet()%>"  name="Kapacitet"></td>
                </div>
               </tr>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Fotografija: </label></td>
                    <td style="padding-top:6%; padding-left:2%">
                        <img height="180px" width="286px" src="FotografijeSoba.jsp?SobaId=<%=request.getParameter("Soba_Id")%>" /> 
                        <input type="file" class="form-control-file" placeholder="Fotografija" value="<%= soba.getFotografija()%>"  name="file"></td>
                </div>
               </tr>
               <br>
               <tr>
             
              </table> <br>
               <input type="submit" value ="Izmeni" class="btn btn-success" style="margin-left: 13%">
               <form action="BrisanjeHotela" method="post">
                  <a class="delete_link btn btn-danger btn-large"  
                                    href="${pageContext.request.contextPath}/BrisanjeSoba?Soba_Id=<%=request.getParameter("Soba_Id")%>" >
                                   <i class="fa fa-trash"> Obriši</i>                                  
                  </a>
               </form>
           </div>
        </form>
               
    </body>
</html>

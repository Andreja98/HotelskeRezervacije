<%-- 
    Document   : Placanje
    Created on : 22-Dec-2018, 18:56:56
    Author     : andreja
--%>

<%@page import="Models.Soba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plaćanje</title>
    </head>
    <%@ include file="navbar.jsp" %> 
    <body>
        
        <form action="Naplacivanje" method="post" style=" margin: 2% 37%; width: 25rem; background: rgba(0,0,0,0.5); color: white" align="center">
                    <input type="hidden" name="BrojPoena" value="<%=request.getAttribute("BrojPoena")%>">
            <h2> Plaćanje </h2>  <h1 class="fas fa-money-bill-wave"></h1>
             <hr style="height:6px; border:none; background-color: #3399ff">
                    
                   <br>
                   <h4> Vrsta kreditne kartice: </h4>
                   <center> <select name="VrstaKartice" class="form-control" style="width: 8rem;">
                       <option value="Visa"> Visa </option>
                       <option value="Maestro"> Maestro </option>    
                       <option value="MasterCard"> MasterCard </option>
                   </select>
                   </center>
                   <br> <br>
                   <h4> Broj kreditne kartice: </h4><input style="width: 23rem; margin-left: 1rem" class="form-control" type="number" name="BrojKartice" placeholder="XXXX-XXXX-XXXX-XXXX"> <br>
                   <h4>Datum  isteka: (Mesec) </h4>
                   <center> <select name="DatumIstekaMesec" class="form-control" style="width: 8rem;">
                       <%
                           for(int i = 1; i<=12; i++) {
                               {%>
                               <option value="<%=i%>"> <%=i%> </option>
                               <%}
                           }
                       %>
                   <input type="hidden" value="<%=request.getAttribute("CenaUPoenima")%>" name="CenaUPoenima">   
                   </select> <br> <br>
                   <h4>Datum  isteka: (Godina) </h4>
                    <select name="DatumIstekaGodina" class="form-control" style="width: 8rem;">
                       <%
                           for(int i = 2018; i<=2030; i++) {
                               {%>
                               <option value="<%=i%>"> <%=i%> </option>
                               <%}
                           }
                       %>
                   </select>
                   </center>
                     <br> <br>  
                     <% if(request.getAttribute("Racun")!=null){ 
                         {%>
                         <h2>Račun: <%=request.getAttribute("Racun")%> <i class="fas fa-euro-sign fa-1x"></i>  </h2> 
                          <%}
                        }
                     %>

                   <input  type="submit" name="NaplacivanjeNovcem" value="Potvrdi plaćanje"  style="background-color: #002db3" class="btn btn-success"> <br>
                   
                   <hr style="height:6px; border:none; background-color: #33ffff">
                   <% 
                       if(request.getAttribute("CenaUPoenima")!=null)
                       if((Integer)request.getSession().getAttribute("BrojPoenaKlijenta") >= (Integer)request.getAttribute("CenaUPoenima")){ 
                        {%>
                           <h4>Placanje Starling poenima</h4>
                           <h4>Trenutan  broj poena: <%=request.getSession().getAttribute("BrojPoenaKlijenta")%></h4>
                         
                           <input type="submit" value="Plati sa <%=request.getAttribute("CenaUPoenima")%> poena" class="button btn-warning"> <br> <br>  
                       <%}
                      }
                      else { 
                        {%> 
                            <h4>Plaćanje Starling poenima</h4>
                            <h4>Nemate dovoljno poena, potrebno <%=request.getAttribute("CenaUPoenima")%> poena</h4>
                            <h4>Trenutan  broj poena: <%=request.getSession().getAttribute("BrojPoenaKlijenta")%></h4>
                        <%}
                      }
                   %>
              
                       
           <%  if(request.getAttribute("poruka")!=null){
                if (request.getAttribute("poruka").equals("True")){ 
                    {%> 
           <script type="text/javascript">
                         swal("Dobar  posao", "Rezervacija uspela", "success")
                         .then(function() {
                             window.location = "index.jsp";
                         });
                     <%}
                } 
                    else if(request.getAttribute("poruka").equals("False")){
                         {%> 
                             <script type="text/javascript">
                         swal("Dobar  posao", "Rezervacija uspešna", "success")
                         .then(function() {
                             window.location = "index.jsp";
                         });
                     <%}
                    }
              }
            %>
           </script>
        </form>
      
    </body>
</html>

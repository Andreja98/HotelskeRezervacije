<%-- 
    Document   : Rezervisi
    Created on : 22-Dec-2018, 16:17:57
    Author     : andreja
--%>

<%@page import="RepoPattern.RezervacijaRepo"%>
<%@page import="Models.Rezervacija"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Soba"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rezervisanje sobe</title>
        </head>
    <body>
        <%
            ArrayList<Rezervacija> aktivneRezervacije = new RezervacijaRepo().aktivneRezervacije(request.getParameter("Soba_Id"));
        %>
        
         <%@ include file="navbar.jsp" %> 
        <% int sobaMaxKapacitet = new SobeRepo().maxKapacitetSobe(request.getParameter("Soba_Id"));%>
       
         <form action = "KreiranjeRezervacije" method="post" >
             <div style=" margin-left:5%">
             <div class="row">
                 <div class="span6" style="margin-top: 7%">
             <div class="list-group" style="width: 300px">
                <button type="button" class="list-group-item list-group-item-action" style="background-color: #cc9900">
                  Trenutne rezervacije:
                </button>
                 <% 
                     int brojac = 1;
                     for(Rezervacija rezervacija: aktivneRezervacije){ 
                        int godinaDolaska =Integer.parseInt(rezervacija.getDatumDolaska().substring(0, 4));
                        int mesecDolaska =Integer.parseInt( rezervacija.getDatumDolaska().substring(5, 7));
                        int danDolaska = Integer.parseInt(rezervacija.getDatumDolaska().substring(8, 10));

                        int godinaOdlaska =Integer.parseInt( rezervacija.getDatumOdlaska().substring(0, 4));
                        int mesecOdlaska = Integer.parseInt(rezervacija.getDatumOdlaska().substring(5, 7));
                        int danOdlaska =Integer.parseInt( rezervacija.getDatumOdlaska().substring(8, 10));
                        {%> 
                        
                            <button type="button" class="list-group-item list-group-item-action"> <%=brojac++%>.
                               <%=danDolaska%>.<%=mesecDolaska%>.<%=godinaDolaska%> - <%=danOdlaska%>.<%=mesecOdlaska%>.<%=godinaOdlaska%> : <%=rezervacija.getVremeOdlaska()%> </button>
                        <%}                        
                     }
                 %>
                
               
              </div>
             </div>
                 <div class="span6" style="margin-left:5%; margin-top:4.5% ;  padding:2%; margin-bottom:30%; background: rgba(0,0,0,0.5); color: white">
                    Datum dolaska:  
                     <input type="date" name="DatumDolaska" class="form-control" style="width:250px" onkeydown="return false">                      
                     Datum odlaska:  
                     <input type="date" name="DatumOdlaska" class="form-control" style="width:250px" onkeydown="return false">  
                      <br>
                    Vreme odlaska:
                    <input type="time" name="VremeOdlaska" class="form-control" style="width:250px" onkeydown="return false">  <br> 
                    <input type="hidden" value="<%=request.getParameter("Soba_Id")%>" name="Soba_Id">
                    Broj dece: 
                   <select name="BrojDece" class="custom-select" style="width:50px">

                       <% for(int i = 0; i <= sobaMaxKapacitet; i++){
                           {%>
                              <option value="<%=i%>"> <%=i%> </option>
                           <%}  
                          }
                       %>
                    </select>
                    <br> </br>


                    Broj odraslih:
                       <select name="BrojOdraslih" class="custom-select" style="width:50px">

                          <% for(int i = 1; i <= sobaMaxKapacitet; i++){
                              {%>
                                 <option value="<%=i%>"> <%=i%> </option>
                              <%}  
                             }
                          %>
                       </select>
                       <br> </br> <br>
                        <input type="submit" value="Idi na plaćanje" class="btn btn-success" style="background-color: #002db3"></a>
                       </div>
                        <div class="jumbotron" style="margin-bottom:  30%; border-radius: 0px; margin-top: 4.5%; background: rgba(0,0,0,0.5); ">
                            <div class="span6" style="margin-bottom:  30%">
                                <% 
                              String IDk = "";
                              //Integer HoteliId = new SobeRepo().hoteliIdSobe(request.getParameter("Soba_Id"));

                              Soba soba = new SobeRepo().select(request.getParameter("Soba_Id"));
                              if(request.getSession().getAttribute("UlogovanaRola")!=null)
                               IDk = (String)request.getSession().getAttribute("UlogovanaRola");

                                    {%>
                                    <h5 style="color:darkblue; font-weight: bold"> Izabrana soba</h5>
                                     <div class="card" style="width: 18rem; float:left; margin:7.5px; background: rgba(0,0,0,0.5); color: white">              
                                        <img height="180px" width="286px" src="FotografijeSoba.jsp?SobaId=<%=soba.getSobaId()%>" />  
                                        <div class="card-body">
                                             <p class="card-text">Broj sobe: <%=soba.getBrojSobe()%></p>
                                             <p class="card-text">Hotel: <%=soba.getHotel().getNaziv()%> </p>
                                             <p class="card-text">Tip sobe: <%=soba.getTipSobe().getNaziv()%> </p>
                                             <p class="card-text">Opis: <%=soba.getOpis()%> </p>
                                             <p class="card-text">Kratak opis: <%=soba.getKratkiOpis()%> </p>
                                             <p class="card-text">Cena: <%=soba.getCena()%> € </p>
                                             <p class="card-text">Kapacitet: <%=soba.getKapacitet()%> </p>
                                             <input type="hidden" value="<%=soba.getCena()%>" name="CenaSobe"> 
                                         </div>   
                                     </div>  
                                    <%}
                                  
                               %>
                            </div>
                        </div>
                </div>
             </div>
                           
         </form>
    </body>
</html>
 <%
            String rezultat =(String) request.getAttribute("Greska");
            
            if(rezultat!=null)
            if(rezultat.equals("False")){%>
            <script type="text/javascript">
                    swal("Neispravno popunjeni podaci rezervacije", "Rezervacija nije uspela", "error")
                    .then(function() {
                       
                    });

            </script> <%}       
  %>
            
<%-- 
    Document   : Rezervacije
    Created on : Dec 24, 2018, 5:47:12 PM
    Author     : andreja
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="RepoPattern.KlijentRepo"%>
<%@page import="Models.Klijent"%>
<%@page import="RepoPattern.RezervacijaRepo"%>
<%@page import="Models.Rezervacija"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pregled svih rezervacija</title>
        <%@ include file="navbar.jsp" %>  
        <script src="jQuery.min.js"> </script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"> </script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"> </script>
        <script type="text/javascript">
                $(document).ready( function () {
                 $('#Tabela').DataTable();
             } );
        </script>
    </head>
    <body>
        <form method="post" action="BrisanjeRezervacije">
            <div style="width:94%; margin-left:3%">
                <table id="Tabela" class="table table-hover table-dark" style="background-color: #7300e6; color:black;  font-family: Roboto;">
                    <thead style="font-size: 13px;">
                        <tr>
                            <th class="align-middle text-center" scope="col">Rb</th> scope="col">Rb</th>
                            <th class="align-middle text-center" scope="col">Hotel</th>
                            <th class="align-middle text-center" scope="col">Datum dolaska</th>
                            <th class="align-middle text-center" scope="col">Datum odlaska</th>
                            <th class="align-middle text-center" scope="col">Novac</th>
                            <th class="align-middle text-center" scope="col">Broj odraslih</th>
                            <th class="align-middle text-center" scope="col">Broj dece</th>
                            <th class="align-middle text-center" scope="col">Broj sobe</th>
                            <th class="align-middle text-center" scope="col">Ime klijenta</th>
                            <th class="align-middle text-center" scope="col">Prezime klijenta</th>
                            <th class="align-middle text-center" scope="col">Vreme odlaska</th>
                            <th class="align-middle text-center" scope="col">Plaćena</th>
                            <th class="align-middle text-center" scope="col">Cena u poenima</th>
                            <th class="align-middle text-center" scope="col">Status</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Klijent klijent = new KlijentRepo().selectByUsername(""+ request.getSession().getAttribute("ulogovan"));

                            int i = 1;
                            ArrayList<Rezervacija> rezervacije;
                            if (klijent.getRola().equals("2")) {
                                rezervacije = new RezervacijaRepo().lista();
                            } else {
                                rezervacije = new RezervacijaRepo().rezervacijeMenadzerovihHotela(klijent.getKlijentId());
                            }

                            for (Rezervacija rezervacija : rezervacije) {
                                if (klijent.getRola().equals("2") || klijent.getRola().equals("3")) {
                                    {%>
                        <tr>
                            <td class="align-middle text-center"> <%=i++%>  </td>
                            <td class="align-middle text-center"><%=rezervacija.soba.Hotel.getNaziv()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getDatumDolaska()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getDatumOdlaska()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getNovac()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getBrojOdraslih()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getBrojDece()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.soba.getBrojSobe()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.klijent.getIme()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.klijent.getPrezime()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getVremeOdlaska()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getStatusRezervacije()%> </td>
                            <td class="align-middle text-center"><%=rezervacija.getPoeni()%> </td>
                            <td class="align-middle text-center"> 
                                <%
                                    if (new RezervacijaRepo().aktivnaRezervacija(rezervacija.getRezervacijaId())) {
                                %>
                                <button disabled="true" class="btn btn-success"> Aktivna </button>
                                <% } else if (new RezervacijaRepo().isteklaRezervacija(rezervacija.getRezervacijaId())) {
                                %>
                                <button disabled="true" class="btn btn-warning"> Istekla </button>

                                <%} else {
                                %>
                                <a class="delete_link" style="color:red"
                                   href="${pageContext.request.contextPath}/BrisanjeRezervacije?Rezervacije_Id=<%= rezervacija.getRezervacijaId()%>&Novac=<%=rezervacija.getNovac()%>&Poeni=<%=rezervacija.getPoeni()%>&Profil=False">
                                    <i class="fa fa-trash"> Obriši</i>                                  
                                </a>
                                <%} %>
                            </td>
                        </tr>

                        <%}
                        } else if (klijent.getRola().equals("1")) {
                            if (klijent.getKlijentId() == rezervacija.getKlijentID()) {
                                {%>
                        <tr>
                            <td> <%= klijent.getRola()%>  </td>
                            <td><%=rezervacija.getDatumDolaska()%> </td>
                            <td><%=rezervacija.getDatumOdlaska()%> </td>
                            <td><%=rezervacija.getNovac()%> </td>
                            <td><%=rezervacija.getBrojOdraslih()%> </td>
                            <td><%=rezervacija.getBrojDece()%> </td>
                            <td><%=rezervacija.soba.getBrojSobe()%> </td>
                            <td><%=rezervacija.klijent.getIme()%> </td>
                            <td><%=rezervacija.klijent.getPrezime()%> </td>
                            <td><%=rezervacija.getVremeOdlaska()%> </td>
                            <td><%=rezervacija.getStatusRezervacije()%> </td>
                            <td><%=rezervacija.getPoeni()%> </td>
                            <td> 
                                <%
                                    if (new RezervacijaRepo().aktivnaRezervacija(rezervacija.getRezervacijaId())) {
                                %>
                                <button disabled="true" class="btn btn-success"> Aktivna </button>
                                <% } else if (new RezervacijaRepo().isteklaRezervacija(rezervacija.getRezervacijaId())) {
                                %>
                                <button disabled="true" class="btn btn-warning"> Istekla </button>

                                <%} else {
                                %>
                                <a class="delete_link" style="color:red"
                                   href="${pageContext.request.contextPath}/BrisanjeRezervacije?Rezervacije_Id=<%= rezervacija.getRezervacijaId()%>&Novac=<%=rezervacija.getNovac()%>&Poeni=<%=rezervacija.getPoeni()%>&Profil=False">
                                    <i class="fa fa-trash"> Obriši</i>                                  
                                </a>
                                <%} %>
                            </td>
                        </tr>

                        <%}
                                    }
                                }
                            }
                        %>

                        <%
                            String rezultat = (String) request.getAttribute("rezultat");

                            if (rezultat != null)
                                if (rezultat.equals("true")) {%>
                    <script type="text/javascript">
                        swal("Dobar  posao", "Uspesno brisanje", "success");



                    </script>

                    <%   } else if (rezultat.equals("false")) {%>

                    <script type="text/javascript">
                        swal("Greska", "Pokusajte ponovo", "warning");
                    </script>

                    <% }%>
                    </tbody>

                </table>
            </div>
        </form>
    </body>
</html>

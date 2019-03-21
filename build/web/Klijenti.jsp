<%-- 
    Document   : Klijenti
    Created on : 14-Dec-2018, 21:37:19
    Author     : andreja
--%>

<%@page import="RepoPattern.KlijentRepo"%>
<%@page import="Models.Klijent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pregled klijenata</title>
         <%@ include file="navbar.jsp" %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jQuery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#Tabela').DataTable();
            });
        </script>

    </head>
    <style>
        .table-hover thead tr:hover th, .table-hover tbody tr:hover td {
            color: black;
            background-color: lightgrey;

        }      
    </style>
    <body>

        <%
            if (request.getSession().getAttribute("UlogovanaRola") != null) {
                if (!request.getSession().getAttribute("UlogovanaRola").equals("2")) {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }


        %>



        <div>
            <table id="Tabela" class="display" style="width:90%; background-color: #7300e6; color:black;  font-family: Roboto;">
                <thead>
                    <tr>
                        <th class="align-middle text-center" scope="col">Rb</th>
                        <th class="align-middle text-center" scope="col">Ime</th>
                        <th class="align-middle text-center" scope="col">Prezime</th>
                        <th class="align-middle text-center" scope="col">Korisničko ime</th>
                        <th class="align-middle text-center" scope="col">E-mail</th>
                        <th class="align-middle text-center" scope="col">Telefon</th>
                        <th class="align-middle text-center" scope="col">Adresa</th>
                        <th class="align-middle text-center" scope="col">Država</th>
                        <th class="align-middle text-center"scope="col">Grad</th>
                        <th class="align-middle text-center"scope="col">Rola</th> 
                        <th class="align-middle text-center"scope="col">Poeni</th>                      
                        <th class="align-middle text-center"scope="col">Postanski Broj</th>
                        <th class="align-middle text-center"scope="col">Opcije</th>
                    </tr>
                </thead>
                <tbody>
                    <%             int i = 1;
                        for (Klijent klijent : new KlijentRepo().lista()) {
                            String Rola = "";
                            if (klijent.getRola().equals("1")) {
                                Rola = "Klijent";
                            } else if (klijent.getRola().equals("2")) {
                                Rola = "Administrator";
                            } else {
                                Rola = "Menadžer hotela";
                                }
                                {%>


                    <tr>
                        <td class="align-middle text-center"> <%= i++%> </td>
                        <td class="align-middle text-center"><%=klijent.getIme()%> </td>
                        <td class="align-middle text-center"><%=klijent.getPrezime()%> </td>
                        <td class="align-middle text-center"><%=klijent.getKIme()%> </td>
                        <td class="align-middle text-center"><%=klijent.getEmail()%> </td>
                        <td class="align-middle text-center"><%=klijent.getTelefon()%> </td>
                        <td class="align-middle text-center"><%=klijent.getAdresa()%> </td>
                        <td class="align-middle text-center"><%=klijent.getDrzava()%> </td>
                        <td class="align-middle text-center"><%=klijent.getGrad()%> </td>
                        <td class="align-middle text-center"><%=Rola%> </td>
                        <td class="align-middle text-center"><%=klijent.getPoeni()%> </td>
                        <td class="align-middle text-center"><%=klijent.getPostanskiBroj()%> </td>
                        <td class="align-middle text-center"> 

                            <a class="delete_link"
                               href="${pageContext.request.contextPath}/EditKlijent.jsp?Klijent_Id=<%= klijent.getKlijentId()%>" >
                                <i class="fa fa-address-card"> Izmeni</i>                                  
                            </a>
                            <a class="delete_link" style="color:red"
                               href="${pageContext.request.contextPath}/Klijenti?Klijent_Id=<%= klijent.getKlijentId()%>" >
                                <i class="fa fa-trash"> Obriši</i>                                  
                            </a>
                        </td>
                    </tr>

                    <%}
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>

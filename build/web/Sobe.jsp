<%-- 
    Document   : Sobe
    Created on : 19-Dec-2018, 19:49:54
    Author     : andreja
--%>

<%@page import="RepoPattern.SobeRepo"%>
<%@page import="Models.Soba"%>
<%@page import="Models.Soba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pregled soba hotela</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <%
            HttpSession sesija = request.getSession();

            String hotelIdSesija = "" + sesija.getAttribute("HotelId");

            String Hotel_Id = request.getParameter("Hotel_Id");

            if (Hotel_Id == null) {
                response.sendRedirect("Hoteli.jsp");
            }
        %>
        <center>
            <input type="text" id="myInput" onkeyup="myFunction()" style="width:250px;" placeholder="Pretraga soba.." class="form-control">
        </center>
        <%
            String ulogovanaRola = "";
            if ((String) request.getSession().getAttribute("UlogovanaRola") != null) {
                ulogovanaRola = (String) request.getSession().getAttribute("UlogovanaRola");
            }
            if (ulogovanaRola.equals("2") || Hotel_Id.equals(hotelIdSesija)) {
        %>
        <a style="margin-top:20px; margin-left:40px; background-color: #002db3" href="${pageContext.request.contextPath}/KreiranjeSoba.jsp?Hotel_Id=<%=Hotel_Id%>" class="btn btn-success">Dodaj novu sobu</a>
        <br>
        
            <% }
                String IDk = "";

                if (request.getSession().getAttribute("UlogovanaRola") != null) {
                    IDk = (String) request.getSession().getAttribute("UlogovanaRola");
                }
           
             {%><ul id="myUL" class="list-unstyled"> <%}
           
                for (Soba soba : new SobeRepo().listaSobaSelektovanogHotela(Hotel_Id)) {
                    {%>
                    <li>
                        <div class="card" style="width: 18rem; float:left; margin:7.5px; background: rgba(0,0,0,0.5); color: white">              
                            <img height="180px" width="286px" src="FotografijeSoba.jsp?SobaId=<%=soba.getSobaId()%>" />  
                            <div class="card-body">
                                <a>
                                    <p class="card-text">Broj sobe: <%=soba.getBrojSobe()%></p>
                                    <p class="card-text">Hotel: <%=soba.getHotel().getNaziv()%> </p>
                                    <p class="card-text">Tip sobe: <%=soba.getTipSobe().getNaziv()%> </p>
                                    <p class="card-text">Opis: <%=soba.getOpis()%> </p>
                                    <p class="card-text">Kratak opis: <%=soba.getKratkiOpis()%> </p>
                                    <p class="card-text">Cena: <%=soba.getCena()%> € </p>
                                    <p class="card-text">Cena u poenima: <%=soba.getCenaUPoenima()%> </p>
                                    <p class="card-text">Vredi poena: <%=soba.getPoeni()%> </p>
                                    <p class="card-text">Kapacitet: <%=soba.getKapacitet()%> </p>
                                </a><br>
                                <% if (!IDk.isEmpty()) {%>
                                <a href="${pageContext.request.contextPath}/Rezervisi.jsp?Soba_Id=<%=soba.getSobaId()%>" class="btn btn-primary">Rezerviši</a>
                                <%} %>
                                <% if (IDk.equals("2") || Hotel_Id.equals(hotelIdSesija)) {%> 
                                <a href="${pageContext.request.contextPath}/EditSoba.jsp?Soba_Id=<%=soba.getSobaId()%>" class="btn btn-success">Izmeni</a>
                                <%}
                                %>
                            </div>   
                        </div>  
                    </li>
                    <%}
                }
            %>
        </ul>

    </body>
</html>
<script>
    function myFunction() {
        // Declare variables
        var input, filter, ul, li, a, i, txtValue;
        input = document.getElementById('myInput');
        filter = input.value.toUpperCase();
        ul = document.getElementById("myUL");
        li = ul.getElementsByTagName('li');

        // Loop through all list items, and hide those who don't match the search query
        for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("a")[0];
            txtValue = a.textContent || a.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } else {
                li[i].style.display = "none";
            }
        }
    }
</script>
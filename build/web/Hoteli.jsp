<%-- 
    Document   : Hoteli
    Created on : 16-Dec-2018, 21:52:48
    Author     : andreja
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteli</title>
    </head>

    <body>
        <%@ include file="navbar.jsp" %> 
    <center>
        <input type="text" id="myInput" onkeyup="myFunction()" style="width:250px;" placeholder="Pretraga hotela.." class="form-control">
    </center>
    <ul id="myUL" class="list-unstyled">
        <%
            String UlogovanaRola = "";
            if (request.getSession().getAttribute("UlogovanaRola") != null) {
                UlogovanaRola = ""+(request.getSession().getAttribute("UlogovanaRola"));
            }
            for (Hotel hotel : new HotelRepo().lista()) {
                {%>
                    <li>
                        <div  class="card" style="width: 18rem; float:left; margin:7.5px; background: rgba(0,0,0,0.5); color: white">              
                            <img height="180px" width="286px" src="FotografijeHotela.jsp?hotelID=<%=hotel.getHotelId()%>" /> 
                            <div id="myUL" class="card-body" style="display:inline-table;">
                                <a>
                                    <h5 class="card-title"> <%=hotel.getNaziv()%> </h5>
                                    <p class="card-text">Država: <%=hotel.getDrzava()%> </p>
                                    <p class="card-text">Grad:  <%=hotel.getGrad()%> </p>
                                    <p class="card-text">Adresa: <%=hotel.getAdresa()%> </p>
                                    <p class="card-text">Opis: <%=hotel.getOpis()%> </p>
                                    <p class="card-text">Broj zvezdica: <%=hotel.getBrojZvezdica()%> </p>

                                </a>        
                                
                                <%}
                                %>
                            </div>   
                                 <div class="card-footer">
                                    <a href="${pageContext.request.contextPath}/Sobe.jsp?Hotel_Id=<%=hotel.getHotelId()%>" class="btn btn-primary">Pogledaj sobe</a>
                                    <% if (UlogovanaRola.equals("2")) {%> 
                                    <a href="${pageContext.request.contextPath}/EditHotel.jsp?Hotel_Id=<%=hotel.getHotelId()%>" class="btn btn-success">Izmeni</a>
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
<%-- 
    Document   : Registracija
    Created on : 10-Dec-2018, 21:41:48
    Author     : andreja
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="sr">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <% 
            HttpSession sesija = request.getSession();
            
            if(sesija.getAttribute("ulogovan")!=null)
                response.sendRedirect("index.jsp");
        %>
        
        
        <%@ include file="navbar.jsp" %>
        <%
            String rezultat =(String) request.getAttribute("rezultat");
            
            if(rezultat!=null)
            if(rezultat.equals("True")){%>
            <script type="text/javascript">
                    swal("Dobar  posao", "Registracija uspela", "success")
                    .then(function() {
                        window.location = "index.jsp";
                    });

            </script>
             
                     <%   }
            
            else if (rezultat.equals("False"))  {%>

                   <script type="text/javascript">
                        swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error")
                       .then(function() {
                           window.location = "Registracija.jsp";
                       });
                   </script>

            <% }%>
            
        
    <center>
        <form action="KlijentController"  style=" margin: 2% 2%; width: 25rem; background: rgba(0,0,0,0.5); color: white" align="center" >
            <h2>Registracija</h2>
            <table cellspacing="20px" >
                <tr>
                    <td style="margin: 10px; padding: 10px;"> Korisničko ime:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodno popuniti polje za korisničko ime. Min dužina 3 karaktera')" class="form-control" required minLength="3" type="text" name="KIme"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;"> Lozinka:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodna lozinka. Min dužina 3 karaktera')" class="form-control" required minLength="3" type="password" type="text" name="Lozinka"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Ime:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodno polje za ime. Min dužina 2 karaktera)" class="form-control" required minLength="2" type="text" name="Ime"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Prezime:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodno popuniti polje za prezime. Min dužina 2 karaktera')" class="form-control" required minLength="3" type="text" name="Prezime"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Email:</td>
                    <td style="margin: 10px; padding: 10px;"><input class="form-control" name="Email"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Telefon:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodno popuniti polje za telefon.(06xxxxxxx)')" class="form-control" required minLength="3" type="text" name="Telefon"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Adresa:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodno popuniti polje za adresu')" class="form-control" required minLength="6" type="text" name="Adresa"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Država:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodno popuniti polje za državu')" class="form-control" required minLength="3" type="text" name="Drzava"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Grad:</td>
                    <td style="margin: 10px; padding: 10px;"><input oninvalid="this.setCustomValidity('Neophodno popuniti polje za grad')" class="form-control" required minLength="3" type="text" name="Grad"></td>
                </tr>
                <tr>
                    <td style="margin: 10px; padding: 10px;">Poštanski broj:</td>
                    <td style="margin: 10px; padding: 10px;"><input  oninvalid="this.setCustomValidity('Neophodno popuniti polje za poštanski broj')" class="form-control" required minLength="5" maxlength="5" type="text" name="PostanskiBroj"></td>
                </tr>
            </table><br>
            <input id ="button-a" type="submit" style="background-color: #002db3; width: 23rem; margin-bottom: 1rem" value="Registruj se" class="btn btn-success" >
        </form>
    </center>
    </body>
</html>


<%-- 
    Document   : index
    Created on : 10-Dec-2018, 20:09:22
    Author     : andreja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotelske rezervacije</title>
    </head>
         <%@ include file="navbar.jsp" %>
        <form action="Klijenti">
        <%
            String Ime =(String) request.getSession().getAttribute("ulogovan");
            if(request.getAttribute("prvoLogovanje")!=null)
            if(request.getAttribute("prvoLogovanje").equals("True")){%>
            <script type="text/javascript">
                swal("Dobrodošli  <%=Ime %>!", "Uspešno ste se ulogovali! ", "success")
                    .then(function() {
                        window.location = "index.jsp";
                    });

            </script>
             <%   }
            
             if(request.getAttribute("prvoLogovanje")!=null)
             if(request.getAttribute("prvoLogovanje").equals("False")) {%>
                <script type="text/javascript">
                    $(window).on('load',function(){
                        $('#exampleModal').modal('show');
                    });
                </script>
            <%}

            %>
            
        </form>
    </body>
</html>

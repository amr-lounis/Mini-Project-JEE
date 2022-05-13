<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            public int nombreMot(String s) {
                return new StringTokenizer(s).countTokens();
            }
        %>
        <%
            String mot = "";
           if (request.getParameter("mot") != null) {
                mot = request.getParameter("mot");
            }
        %>
        <form method="POST">
            <label> Donnez une chaine </label>
            <input type="text" name="mot" value="" />
            <input type="submit" value="Nombre de mots" /><br>
            <%
                if (!mot.equals("")) {
            %>
            <label name="nbr" ><%= nombreMot(mot)%>   </label>
            <%
                }
            %>
        </form>
    </body>
</html>

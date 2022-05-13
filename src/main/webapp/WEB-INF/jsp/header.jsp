<%
if(request.getParameter("logout") != null) {
	request.getSession().setAttribute("sessionLogin", null);
	request.getRequestDispatcher("/index.jsp").forward(request, response);
}
%>

<%
if(request.getSession().getAttribute("sessionLogin") != null) {
%>
<FORM METHOD="POST">
    <input type="submit" NAME="logout" value="logout" />
</FORM>
<%}%>


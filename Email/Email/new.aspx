<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="Email._new" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" type="text/css" href="StyleSheet1.css" />
</head>
<body>
	<%
		if (Session["username"] == null) {
			Response.Redirect("Login.aspx");
		}
	%>
	<%
        Response.Write("<div id = \"myNav\">");
        Response.Write("<table id = \"navTable\">");
        Response.Write("<tr>");
        Response.Write($"<td style=\"text-align:left;\" class=\"shrink\">{DateTime.Now.ToString("d/M/yyyy")}</td>");
        Response.Write($"<td style=\"text-align:center;\" class=\"expand\">{Session["username"].ToString().Trim()}</td>");
        Response.Write($"<td style=\"text-align:right;\" class=\"shrink\" id = \"logout\" onclick=\"location.href= 'logout.aspx'\">logout</td>");
        Response.Write("</tr>");
        Response.Write("</table>");
        Response.Write("</div>");
    %>
    <hr />
	<div id="sideMenuContainer">
        <table id="sideMenu">
            <tr>
                <th onclick = "location.href = 'new.aspx'">New</th>
            </tr>
            <tr>
                <th onclick = "location.gref = 'email.aspx'">Inbox</th>
            </tr>
            <tr>
                <th>Unread</th>
            </tr>
            <tr>
                <th>read</th>
            </tr>
        </table>
    </div>	
    <form action="sending.aspx" method="post">
        <table id="newEmail">
            <tr>
                <th style="text-align:left;">To:</th>
				<%
					String recipient = null;
					try
					{
						recipient = Request.QueryString["recipient"].ToString().Trim();
					}
					catch (Exception e) { }

					if (recipient == null)
					{
						Response.Write("<td><input type='text' name='reciver' /></td>");
					} else {
						Response.Write($"<td><input type='text' name='reciver' value='{recipient}' /></td>");
					}
				%>
                
            </tr>
            <tr>
                <th style="text-align:left;">Subject:</th>
                <td>
                    <input type="text" name="subject" />
                </td>
            </tr>
            <tr>
                <td colspan = "2">
                    <textarea class="input" rows="5" cols="30" name="body"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style ="text-align: right;">
                    <input type="submit" value="Send" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

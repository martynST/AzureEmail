<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="Email.email" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" type="text/css" href="StyleSheet1.css" />
</head>
<body>
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
                <th onclick = "location.href= 'new.aspx'">New</th>
            </tr>
            <tr>
                <th onclick = "location.href = 'inbox.aspx'">Inbox</th>
            </tr>
            <tr>
                <th>Unread</th>
            </tr>
            <tr>
                <th>read</th>
            </tr>
        </table>
    </div>	
    <%
        String emailId = Request.QueryString["id"].ToString();
        String username = Session["username"].ToString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandText = $"UPDATE emails SET status = 'R' WHERE emailId = '{emailId}'";
        cmd.ExecuteNonQuery();

        cmd.CommandText = $"SELECT * FROM emails WHERE reciver = '{username}' AND emailId = '{emailId}'";
        SqlDataReader data = cmd.ExecuteReader();
        if (data.Read()) {
			Session["lastFrom"] = data["from"].ToString();
            Response.Write($"<div id='newMailContainer'><table id='recEmail'><tr><th>Subject:</th><td>{data["subject"].ToString()}</td></tr><tr><th>From:</th><td>{data["from"].ToString()}</td></tr><tr><th>Date:</th><td>{data["date"].ToString()}</td></tr><tr><td colspan = '2'>{data["body"].ToString()}</td></tr></table><input type='button' value='reply' onclick=\"location.href= 'new.aspx?recipient={data["from"].ToString()}'\"/></div>");
        }
    %>
	
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inbox.aspx.cs" Inherits="Email.inbox" %>

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
                <th onclick = "location.href = 'unread.aspx'">Unread</th>
            </tr>
            <tr>
                <th onclick = "location.href = 'read.aspx'">read</th>
            </tr>
        </table>
    </div>	
    <%
		if (Session["username"] == null) {
			Response.Redirect("Login.aspx");
		}
		String username = Session["username"].ToString().Trim();

		SqlConnection con = new SqlConnection();
		con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
		con.Open();
		SqlCommand cmd = con.CreateCommand();
		cmd.CommandText = $"SELECT * FROM emails WHERE reciver = '{username}' AND deleted = 'N' ORDER BY emailId DESC";
		SqlDataReader data = cmd.ExecuteReader();
		Response.Write($"<div id = 'inboxContainer'><table id = 'inbox'><tr><th>Subject</th><th>From</th><th>date</th></tr>");
		while (data.Read()) {
			Response.Write($"<tr onclick=\"location.href= 'email.aspx?id={data["emailId"].ToString()}'\" id = '{data["status"].ToString()}'><td>{data["subject"].ToString().Trim()}</td><td>{data["from"].ToString().Trim()}</td><td>{data["date"].ToString()}</td></tr>");
		}
		Response.Write($"</table></div>");

		data.Close();
		Response.Write("<script>let username = '" + username + "'</script>");
    %>
	<form id="form1" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"/>
		<script>			

			function MyMethod_Result(ResultString) {
				if (ResultString === "inbox.aspx") {
					location.reload();
				}
			}

			checkEmail(0);
			function checkEmail(i) {
				if (i < 3600) {
					setTimeout(function () { PageMethods.CheckNewEmail(username, MyMethod_Result); i++; console.log(i); checkEmail(i); }, 1000);
				} else {
					Location.reload();
				}
			}
		</script>
	</form>
</body>
    <script>
			function wantDelete(pid) {
				if (!confirm("Are you sure you want to delete?")) {
					preventDefault();
				}
			}
	</script>
</html>

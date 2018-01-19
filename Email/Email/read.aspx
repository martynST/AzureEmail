<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="read.aspx.cs" Inherits="Email.read1" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<%
		if (Session["username"] == null) {
			Response.Redirect("Login.aspx");
		}
		String username = Session["username"].ToString().Trim();

		SqlConnection con = new SqlConnection();
		con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
		con.Open();
		SqlCommand cmd = con.CreateCommand();
		cmd.CommandText = $"SELECT * FROM emails WHERE reciver = '{username}' AND deleted = 'N' AND status = 'R' ORDER BY emailId DESC";
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
				if (ResultString === "read.aspx") {
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
    <script>
			function wantDelete(pid) {
				if (!confirm("Are you sure you want to delete?")) {
					preventDefault();
				}
			}
	</script>
</asp:Content>

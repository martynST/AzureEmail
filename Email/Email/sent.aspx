﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="sent.aspx.cs" Inherits="Email.sent" %>
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
		cmd.CommandText = $"SELECT * FROM emails WHERE \"from\" = '{username}' ORDER BY emailId DESC";
		SqlDataReader data = cmd.ExecuteReader();
		Response.Write($"<div id = 'inboxContainer'><table id = 'inbox'><tr><th>Subject</th><th>From</th><th>date</th></tr>");
		while (data.Read()) {
			Response.Write($"<tr onclick=\"location.href= 'email.aspx?id={data["emailId"].ToString()}'\" id = '{data["status"].ToString()}'><td>{data["subject"].ToString().Trim()}</td><td>{data["from"].ToString().Trim()}</td><td>{data["date"].ToString()}</td></tr>");
		}
		Response.Write($"</table></div>");

		data.Close();
		Response.Write("<script>let username = '" + username + "'</script>");
    %>
    <script>
			function wantDelete(pid) {
				if (!confirm("Are you sure you want to delete?")) {
					preventDefault();
				}
			}
	</script>
</asp:Content>
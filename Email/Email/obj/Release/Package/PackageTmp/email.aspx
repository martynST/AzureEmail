<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="Email.email" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
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
            Response.Write($"<table><tr><th>Subject:</th><td>{data["subject"].ToString()}</td></tr><tr><th>From:</th><td>{data["from"].ToString()}</td></tr><tr><th>Date:</th><td>{data["date"].ToString()}</td></tr><tr><td colspan = '2'>{data["body"].ToString()}</td></tr></table>");
        }
    %>
</body>
</html>

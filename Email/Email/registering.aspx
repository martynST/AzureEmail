<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registering.aspx.cs" Inherits="Email.registering" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            making account...
        </div>
    </form>
    <%
        String username = Request.Form["username"].ToString();
        String password = Request.Form["password"].ToString();

        var sha = new System.Security.Cryptography.SHA256Managed();
        byte[] textData = System.Text.Encoding.UTF8.GetBytes(password);
        byte[] hash = sha.ComputeHash(textData);
        String hashed = BitConverter.ToString(hash).Replace("-", String.Empty);

        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandText = $"INSERT INTO users VALUES('{username}','{hashed}')";
        try {
            cmd.ExecuteNonQuery();
            Response.Redirect("Login.aspx");
        } catch (SqlException e) {
            Response.Redirect("registerdup.aspx");
        }

    %>
</body>
</html>

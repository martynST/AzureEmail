<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checking.aspx.cs" Inherits="Email.checking" %>
<%@ Import Namespace = "System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            redirecting...
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
        cmd.CommandText = $"SELECT * FROM users WHERE username = '{username}' AND password = '{hashed}'";
        SqlDataReader data = cmd.ExecuteReader();
        if (data.Read()) {
            Session["username"] = data["username"].ToString();
            data.Close();
            Response.Redirect($"inbox.aspx");
        } else {
            data.Close();
            Response.Redirect("invalidLogin.aspx");
        }
    %>
</body>
</html>

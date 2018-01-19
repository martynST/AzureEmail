<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sending.aspx.cs" Inherits="Email.sending" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            sending...
        </div>
    </form>
    <%
        String username = Session["username"].ToString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandText = $"SELECT RIGHT(CONCAT('00000',ISNULL(MAX(emailId)+1,'00001')),5) AS newEmailId FROM emails";
        SqlDataReader data = cmd.ExecuteReader();

        data.Read();
        String newEmailId = data["newEmailId"].ToString();
        data.Close();

        cmd.CommandText = $"INSERT INTO emails VALUES('{username}','{Request.Form["reciver"]}','{Request.Form["subject"]}','{Request.Form["body"]}',CURRENT_TIMESTAMP,'U','N','{newEmailId}')";
        cmd.ExecuteNonQuery();
        Response.Redirect("inbox.aspx");        
    %>
</body>
</html>

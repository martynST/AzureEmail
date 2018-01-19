<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Email.Login" %>
<%@ Import Namespace="System.Security.Cryptography" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form action="checking.aspx" method="post">
        <table>
            <tr>
                <td>Username:
                </td>
                <td>
                    <input type="text" name="username" maxlength = "50" />
                </td>
            </tr>
            <tr>
                <td>Password:
                </td>
                <td>
                    <input type="password" name="password" maxlength = "20"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="login" />
                    <a href="register.aspx">register</a>
                </td>
            </tr>
        </table>
    </form>
    <%
        /*
        var sha = new System.Security.Cryptography.SHA256Managed();
        byte[] textData = System.Text.Encoding.UTF8.GetBytes("cash money");
        byte[] hash = sha.ComputeHash(textData);
        String hashed = BitConverter.ToString(hash).Replace("-", String.Empty);
        Response.Write(hashed);*/
    %>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Email.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form action="registering.aspx" method="post">
        <table>
            <tr>
                <td>Username:
                </td>
                <td>
                    <input type="text" name="username" id="username" maxlength = "50" />
                </td>
            </tr>
            <tr>
                <td>Password:
                </td>
                <td>
                    <input type="password" name="password" maxlength = "20"  />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" id="registerButton" value="register" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

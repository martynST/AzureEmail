<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerdup.aspx.cs" Inherits="Email.registerdup" %>

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
                    <input type="submit" value="register" />
                </td>
            </tr>
        </table>
    </form>
    The username you selected is already in use. Please select a different one.
</body>
</html>

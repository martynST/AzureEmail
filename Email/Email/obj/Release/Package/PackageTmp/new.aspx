<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="Email._new" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form action="sending.aspx" method="post">
        <table>
            <tr>
                <th style="text-align:left;">To:</th>
                <td>
                    <input type="text" name="reciver" />
                </td>
            </tr>
            <tr>
                <th style="text-align:left;">Subject:</th>
                <td>
                    <input type="text" name="subject" />
                </td>
            </tr>
            <tr>
                <td colspan = "2">
                    <textarea class="input" rows="5" cols="30" name="body"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style ="text-align: right;">
                    <input type="submit" value="Send" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

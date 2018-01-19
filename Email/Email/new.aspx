<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="Email._new1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<form action="sending.aspx" method="post">
        <table id="newEmail">
            <tr>
                <th style="text-align:left;">To:</th>
				<%
					String recipient = null;
					try
					{
						recipient = Request.QueryString["recipient"].ToString().Trim();
					}
					catch (Exception e) { }

					if (recipient == null)
					{
						Response.Write("<td><input type='text' name='reciver' /></td>");
					} else {
						Response.Write($"<td><input type='text' name='reciver' value='{recipient}' /></td>");
					}
				%>
                
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
</asp:Content>

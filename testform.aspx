<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testform.aspx.cs" Inherits="AS_Assignment_203769L.testform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>First name</td>
                <td><asp:TextBox ID="first_name" runat="server"  TextMode="Password"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Last name</td>
                <td><asp:TextBox ID="TextBox1" runat="server"  TextMode="Password"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Credit card information</td>
                <td><asp:TextBox ID="TextBox2" runat="server"  TextMode="Password"></asp:TextBox></td>
            </tr>

        </table>
    </form>
</body>
</html>

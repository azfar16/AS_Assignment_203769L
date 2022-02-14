<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="AS_Assignment_203769L.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <legend>HomePage</legend>

        <table> <tr><td>User ID :</td><td><asp:Label ID="lbl_userid" runat="server" Text="lbl_userID"></asp:Label></td></tr></table>

        <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="LogOutMe" Visible="false" />
    </form>
</body>
</html>

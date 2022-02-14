<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AS_Assignment_203769L.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://www.google.com/recaptcha/api.js?render=6Ldw03AeAAAAAMhooAJwyW-fuikwxBLX-Us0h1gm"></script>
    <script>
        grecaptcha.ready(function () {
            grecaptcha.execute('6Ldw03AeAAAAAMhooAJwyW-fuikwxBLX-Us0h1gm', { action: 'Login' }).then(function (token) {
                document.getElementbyId("g-recaptcha-response").value = token;
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <table>

           <tr><td>Login</td></tr>

           <tr><td>User Email</td><td><asp:TextBox ID="tb_emailaddress" runat="server"  TextMode="Email" OnTextChanged="tb_emailaddress_TextChanged"></asp:TextBox></td></tr>

           <tr><td>Password</td><td><asp:TextBox ID="tb_pwd" runat="server"  TextMode="Password"></asp:TextBox></td></tr>

           <tr><td></td><td><asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_click"/></td></tr>

            <tr><td>Login Status : </td><td><asp:Label ID="lbl_status" runat="server" Text="lbl"></asp:Label></td></tr>

           
       </table>
        <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response" /> 
        <asp:Label ID="lblMessage" runat="server" EnableViewState="False">Error message here (lblmessage)</asp:Label>
    </form>
</body>
</html>

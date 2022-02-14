<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AS_Assignment_203769L.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function validate()
        {
            var str = document.getElementById('<%=tb_password.ClientID %>').value;
            var fname = document.getElementById('<%=tb_firstname.ClientID %>').value;

            if (str.length < 12) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password Length Must be at least 12 Characters"
                document.getElementById("lbl_pwdchecker").style.color = 'Red';
                return ("too_short");
            }

            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 number";
                document.getElementById("lbl_pwdchecker").style.color = 'Red';
                return ("no_number");
            }

            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 uppercase letter";
                document.getElementById("lbl_pwdchecker").style.color = 'Red';
                return ("no_uppercase");
            }

            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 lowercase letter";
                document.getElementById("lbl_pwdchecker").style.color = 'Red';
                return ("no_lowercase");
            }

            else if (str.search(/[-+_!@#$%^&*.,?]/) == -1)
            {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 special character";
                document.getElementById("lbl_pwdchecker").style.color = 'Red';
                return ("no_specialcharacter");
            }

          

            document.getElementById("lbl_pwdchecker").innerHTML = "Excellent!"
            document.getElementById("lbl_pwdchecker").style.color = "Blue";


            
        }

        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table>

            <tr>
            <td>First Name</td>
            <td><asp:TextBox ID="tb_firstname" runat="server"  ></asp:TextBox></td>
            <td><asp:Label ID="lbl_firstname" runat="server" Text="Label"></asp:Label></td>
            </tr>

            <tr>
            <td>Last Name</td>
            <td><asp:TextBox ID="tb_lastname" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
            <td>Credit Card Information</td>
            <td><asp:TextBox ID="tb_creditcard" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
            <td>Email Address</td>
            <td><asp:TextBox ID="tb_emailaddress" runat="server"  TextMode="Email"></asp:TextBox></td>
            </tr>

            <tr>
            <td>Password</td>
            <td><asp:TextBox ID="tb_password" runat="server"  TextMode="Password" onkeyup="javascript:validate()"></asp:TextBox></td> 
            <td><asp:Label ID="lbl_pwdchecker" runat="server" Text="Label"></asp:Label></td>
            <td><asp:Button ID="btn_checkPassword" runat="server" Text="Check Password Strength" /></td> <!--OnClick="btn_checkPassword_Click"-->
            </tr>

            <tr>
            <td>Date Of Birth</td>
            <td><asp:TextBox ID="tb_dateofbirth" runat="server"  TextMode="Date"></asp:TextBox></td>
            </tr>
           <tr>
                <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
            </tr>
            </table>
    </form>
</body>
</html>

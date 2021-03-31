<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="scoreView.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 685px">
    <form id="form1" runat="server">
        <div style="height: 681px;text-align:center">
            <br />
            <br />
            <p><H1>Login</H1></p>
            &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Username: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Font-Size="Large" Width="213px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Password:   "></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server" Font-Size="Large" TextMode="Password" Width="213px"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Font-Bold="True" Height="31px" OnClick="Button1_Click" Text="Login" Width="80px" />
        </div>
    </form>
</body>
</html>

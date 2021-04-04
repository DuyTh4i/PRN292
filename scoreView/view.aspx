<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="scoreView.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 950px;
            width: 1804px;
        }
    </style>
</head>
<body style="height: 950px">
    <form id="form1" runat="server">
        <div style="height: 50px;width:1920px; text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Hello, aa" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
            <br />
            <a href="Logout.aspx" style="text-decoration: none; color: crimson;font-size:x-large"><b>Logout</b></a>
        </div>


        <div style="display: inline-block; float: left; width: 200px; height: 900px; text-align: center; border-right: black solid 2px">

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Semester" Font-Size="X-Large" Font-Bold="True"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="True" Font-Size="Larger" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="180px">
            </asp:DropDownList>
        </div>
        <div style="display: inline-block; height: 900px; float: left; width: 320px; text-align: center; border-right: black solid 2px">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Class" Font-Size="X-Large" Font-Bold="True"></asp:Label>
            <br />
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Font-Size="Larger" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="300px"></asp:ListBox>
        </div>
        
        <div style="display: inline-block; width: 1180px; height: 900px; text-align: center;float:right">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            
            <asp:GridView ID="GridView1" runat="server" Font-Size="X-Large" Height="500px" Width="1180px" >
            </asp:GridView>
        </div>
    </form>
</body>
</html>

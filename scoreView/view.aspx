<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="scoreView.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 753px;
        }
    </style>
</head>
<body style="height: 753px">
    <form id="form1" runat="server">
        <div style="height: 53px; text-align:center; font-size:22px">
            <asp:Label ID="Label1" runat="server" Text="Hello, aa"></asp:Label>
            <br />
            <a href="Logout.aspx" style="text-decoration:none;color:crimson"><b>Logout</b></a>
        </div>
        <div style="display:inline-block; float:left; width: 180px; height: 700px; text-align:center;border-right:black solid 2px">
            
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
            
            <asp:Label ID="Label2" runat="server" Text="Semester" Font-Size="Larger" Font-Bold="True"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" style="margin-bottom: 0px" AutoPostBack="True" Font-Size="Large" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div style="display:inline-block; height: 700px; float:left;width: 290px; text-align:center;border-right:black solid 2px">
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
            <asp:Label ID="Label3" runat="server" Text="Class" Font-Size="Larger" Font-Bold="True"></asp:Label>
            <br />
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Font-Size="Medium" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            </div>
        <div style="display:inline-block; width: 1000px; height: 700px;float:right;text-align:center">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" Font-Size="Larger" Height="325px" Width="975px">
            </asp:GridView>
                
        </div>
        
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="TableTopGrid" 
        style="width: 100%; border-left: darkgray 1px solid;"
        cellspacing="0" cellpadding="0" align="center">                           
    <tr>
    <td style="width:100%; background-color: #66ccff" align="center">
        <asp:Button ID="btnTransposeReport" 
            runat="server" Font-Bold="True" 
            Font-Names="Tahoma"
            Font-Size="8pt" Text="Query" 
            Width="75px" ForeColor="Navy" 
            OnClick="btnTransposeReport_Click" />
    </td>
    </tr>
    <tr>
    <td width="100%" align="center" valign="top">
        <asp:DataGrid ID="GridReport" runat="server"
           Height="100%" Width="100%" HorizontalAlign="Center"
           Font-Size="8pt" EditItemStyle-Wrap="true" 
           Font-Names="Tahoma" PageSize="50"
           AutoGenerateColumns="True" 
           AllowPaging="False" AllowSorting="False" GridLines="Both"
           ShowFooter="False" BackColor="AliceBlue">
        <ItemStyle Height="18px" Width="100%" 
            HorizontalAlign="Center" CssClass="Grid" />
        <HeaderStyle Font-Size="8pt" Font-Names="Tahoma" 
            Font-Bold="False" Width="100%" Height="20px"
            ForeColor="White" BackColor="DimGray" 
            HorizontalAlign="Center" CssClass="Grid" />

        </asp:DataGrid>
       </td>
    </tr>
    <tr>
    <td style="width:100%; background-color:DimGray" align="center">
        &nbsp;
    </td>
    </tr>
</table>
        </div>
    </form>
</body>
</html>

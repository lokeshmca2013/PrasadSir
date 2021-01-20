<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayLetterHead.aspx.cs" Inherits="SOC.DisplayLetterHead" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register assembly="CrystalDecisions.Web" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                         <asp:DropDownList ID="ddlSelectedLetterCode" runat="server">
                            <asp:ListItem Text="--Select code---" Value="--Select Code--"></asp:ListItem>
                            <asp:ListItem Text="DDHYD" Value="DDHYD"></asp:ListItem>
                            <asp:ListItem Text="DDkolkata" Value="DDkolkata"></asp:ListItem>
                            <asp:ListItem Text="DDNewDelhi" Value="DDNewDelhi"></asp:ListItem>
                            <asp:ListItem Text="BDHYD" Value="BDHYD"></asp:ListItem>
                            <asp:ListItem Text="BDkolkata" Value="BDkolkata">
 
                            </asp:ListItem>
                            <asp:ListItem Text="BDNewDelhi" Value="BDNewDelhi">
 
                            </asp:ListItem>

                            <asp:ListItem Text="HDNewDelhi" Value="HDNewDelhi"></asp:ListItem>
                            <asp:ListItem Text="HDHYD" Value="HDNewDelhi"></asp:ListItem>
                            <asp:ListItem Text="HDkolkata" Value="HDkolkata"></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

                    </td>
                </tr>

            </table>
           
          
        </div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </form>
</body>
</html>

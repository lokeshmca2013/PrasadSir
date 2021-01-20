<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LetterHeadImages.aspx.cs" Inherits="SOC.LetterHeadImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding-left: 200px; padding-right: 300px;">
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
                        <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                        <asp:Button ID="Button1" runat="server" Text="Upload Photo" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

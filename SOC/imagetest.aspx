<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="imagetest.aspx.cs" Inherits="SOC.imagetest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <script type="text/javascript">
function openWindow() {
   url = "Help.aspx";
 newwindow = window.open(url,'name','menubar=no, toolbar=0,addressbar=no,height=400,width=600,top=100,left=200,scrollbars=1,location=0,statusbar=0,resizable=1');
  if (window.focus) {newwindow.focus()}
  return false;
         }
         </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content" id="two" style="display: block;">
                        <table>
                            <tr>
                                <td>
                        <asp:FileUpload ID="FileUploadImage" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                        <asp:Button ID="btnUploadImage" runat="server" Text="Upload" 
                            OnClick="Upload_Click" />
                                </td>
                            </tr>
                           
                            <tr>
                                <td align="center">
                                  <%-- <input type="button" value="WhiteBG"/>--%>
                                      <asp:Button ID="btnWhiteBG" runat="server" OnClick="Button1_Click"  Text="WhiteBG" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btndownload" runat="server" OnClick="Button1_Click1" Text="Dowload" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                   
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="openWindow();">Help</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    
                        </div>
        
             <asp:Image ID="imgResize" runat="server"  Visible="true" style="height:300px;width:300px" CssClass  ="Image"/>
        
           
    </form>
   
</body>
</html>

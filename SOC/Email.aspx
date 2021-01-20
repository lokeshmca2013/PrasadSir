<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="SOC.Email" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    //$(function () {
    //    $("[id*=GridView] input[type=checkbox]").click(function () {
    //        if ($(this).is(":checked")) {
    //            $("[id*=GridView] input[type=checkbox]").removeAttr("checked");
    //            $(this).attr("checked", "checked");
    //        }
    //    });
    //});

////function popupEmail()
////{
////    $.ajax({
////        type: "POST",
////        url: "SelectedEmailId.aspx",
////        data: "{}",
////        contentType: "application/json;charset=utf-8",
////        dataType: "json",
////        Success: function (msg)
////        {
////            url = "SelectedEmailId.aspx";
//// newwindow = window.open(url,'name','menubar=no, toolbar=0,addressbar=no,height=400,width=600,top=100,left=200,scrollbars=1,location=0,statusbar=0,resizable=1');
////  if (window.focus) {newwindow.focus()}
////  return false;

////        }


////    });
 
////}
   


</script>
    <style type="text/css">
    /*.modalBackground
    {
        background-color: cornflowerblue;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }*/
    .modalPopup
    {
        background-color: cornflowerblue;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 300px;
        height: 140px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
      
        <div>
             <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"   targetcontrolid="hdnField" popupcontrolid="Panel1" >
                </asp:ModalPopupExtender>
   <asp:panel ID="Panel1" runat="server" CssClass="modalPopup" align="center">
    <table>
    <%--<tr>
    <td>
    <asp:Label runat="server" id="lblEmail" ></asp:Label>
    </td>
        </tr>--%>
       <tr>
           <td>
               Selected Email id's are as Follows
           </td>
       </tr>
        
      
        </table>
    </asp:panel>
            
            
         <asp:GridView ID="GridView" runat="server"  AutoGenerateColumns="false" Visible="true" Width="100%">
         <Columns>  
                 <asp:TemplateField HeaderText="Select Data">  
                     
                    <ItemTemplate>  
                         
                        <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="false" />  
                    </ItemTemplate>  
                    <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  


                </asp:TemplateField> 
              <asp:TemplateField HeaderText="EmailId">  
                     
                    <ItemTemplate>  
                         <asp:label ID="txtEmail"  runat="server" Enabled="false" Text='<%# Bind("EmailId") %>' ></asp:label>  
                          
                    </ItemTemplate>  
                    <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  


                </asp:TemplateField> 
             </Columns>

    </asp:GridView>
           

        </div>
        <asp:HiddenField ID="hdnField" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="SendMail"   OnClick="Button1_Click" />
     </form>
</body>
</html>

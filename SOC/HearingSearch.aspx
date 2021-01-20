<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HearingSearch.aspx.cs" Inherits="SOC.HearingSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("[id*=gridviewHearingDateSearch] input[type=checkbox]").click(function () {
            if ($(this).is(":checked")) {
                $("[id*=gridviewHearingDateSearch] input[type=checkbox]").removeAttr("checked");
                $(this).attr("checked", "checked");
            }
        });
    });


</script>



</head>
<body>
    <form id="form1" runat="server">
       <table style="width: 802px; height: 418px;">
                <tr>
                    <td style="height: 59px;" align="center" valign="top">
        <span id="lblHearingSearch" style="display:inline-block;color:Navy;font-family:lucida HandWriting;font-size:Medium;width:187px;">Hearing DateSearch</span>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 59px">
                                        &nbsp;</td>
                                    <td align="right" style="width: 137px">
                                        <span id="lblFileNumberForHearingSearch" class="form_textbox"> By FileNo:</span>
                                    </td>
                                    <td align="left">
                                        <input name="txtFileNumberForHearingSearch" type="text" id="txtFileNumberForHearingSearch" class="form_textbox" style="font-weight:normal;width:396px;" runat="server" />
                                    </td>
                                </tr>



                                <tr>
                                    <td style="width: 59px">
                                        &nbsp;</td>
                                    <td align="right" style="width: 137px">
                                        <span id="lblApplicationNoForHearingSearch" class="form_textbox"> Application No:</span>
                                    </td>
                                    <td align="left">
                                        <input name="txtApplicationNumberForHearingSearch" type="text" id="txtApplicationNumberForHearingSearch" class="form_textbox" style="font-weight:normal;width:396px;" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 59px">
                                    </td>
                                    <td align="right" style="width: 137px">
                                        <span id="lblHearingDateForSearch" class="form_textbox">HearingDate:</span>
                                    </td>
                                    <td align="left">
                                        <span id="lblHearingDateSearchFrom" style="color:Navy;font-family:lucida handwriting;font-size:Small;">From :</span>
                                        &nbsp;<input name="txtHearingDateSearchFrom" type="text" id="txtHearingDateSearchFrom" class="form_textbox" style="color:Navy;font-weight:normal;width:146px;" runat="server"  />
                                        
                                        &nbsp;<span id="lblHearingDateSearchTo" style="color:Navy;font-family:lucida handwriting;font-size:Small;">To :</span>
                                        &nbsp;&nbsp;<input name="txtHearingDateSearchTo" type="text" id="txtHearingDateSearchTo" class="form_textbox" style="color:Navy;font-weight:normal;width:146px;" runat="server"  />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 59px">
                                        &nbsp;</td>
                                    <td align="right" style="width: 137px">
                                        <span id="lblMarkForHearingSearch" class="form_textbox">Mark :</span>
                                    </td>
                                    <td align="left">
                                        <input name="txtMarkForHearingSearch" type="text" id="txtMarkForHearingSearch" class="form_textbox" style="font-weight:normal;width:396px;" runat="server"/>
                                        &nbsp;</td>
                                </tr>
                               
                                
                               
                                <tr>
                                    <td style="width: 59px">
                                        &nbsp;</td>
                                    <td align="right" style="width: 137px">
                                        <span id="lblClassForHearingSearch" class="form_textbox">Class</span>
                                    </td>
                                    <td align="left">
                                        <input name="txtClassForHearingSearch" type="text" id="txtClassForHearingSearch" class="form_textbox" style="font-weight:normal;width:396px;" runat="server"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 59px">
                                        &nbsp;</td>
                                    <td align="right" style="width: 137px">
                                        <span id="lblApplicant" class="form_textbox">Applicant</span>
                                    </td>
                                    <td align="left">
                                        <input name="txtApplicantForHearingSearch" type="text" id="txtApplicantForHearingSearch" class="form_textbox" style="color:Navy;font-weight:normal;width:396px;" runat="server" />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 59px">
                                        &nbsp;</td>
                                    <td align="right" style="width: 137px">
                                        <span id="lblFileHandleAtForHearingSearch" class="form_textbox">FileHandleAt</span>
                                    </td>
                                    <td align="left">
                                        <input name="txtFileHandleAtForHearingSearch" type="text" id="txtFileHandleAtForHearingSearch" class="form_textbox" style="font-weight:normal;width:396px;" runat="server" >
                                        &nbsp;&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 59px">
                                    </td>
                                    <td align="left" colspan="2">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       
                                        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="gvbind" />
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td style="width: 59px">
                                    </td>
                                    <td align="center" colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            
                            <asp:GridView ID="gridviewHearingDateSearch" runat="server"
                          AutoGenerateColumns="false" DataKeyNames="IDNo" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">



                         <Columns>  
                              <asp:TemplateField HeaderText="Select Data">  
                     
                    <ItemTemplate>  
                         <asp:Button ID="btn_Update" runat="server" Text="Update" Visible="false" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" Visible="false" CommandName="Cancel"/>  
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />  
                    </ItemTemplate>  
                    <ItemStyle Width="50px" />
                    <HeaderStyle  Width="50px" />  


                </asp:TemplateField> 



                             <asp:TemplateField HeaderText="IDNo" Visible="false">  
                      
                    <ItemTemplate> 
                        <asp:TextBox ID="IDNo" runat="server" Text='<%# Bind("IDNo") %>'> </asp:TextBox> 
                        <asp:Label ID="lblIDNo" runat="server" Text='<%# Bind("IDNo") %>'></asp:Label>  
                    </ItemTemplate>  
                      <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  



                </asp:TemplateField>
                     <asp:TemplateField HeaderText="FileNo">  
                     
                    <ItemTemplate>  
                        <asp:TextBox ID="txtFileNo" Visible="false" runat="server" Enabled="false" Text='<%# Bind("FileNo") %>' ></asp:TextBox>  
                        <asp:Label ID="lblFileNo" runat="server" Text='<%# Bind("FileNo") %>'></asp:Label>  
                    </ItemTemplate>  
                          <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                <asp:TemplateField HeaderText="ApplicationNo">  
                 
                    <ItemTemplate>  
                            <asp:TextBox ID="txtApplicationNo" Visible="false" runat="server" Enabled="false" Text='<%# Bind("ApplicationNo") %>' ></asp:TextBox>
                        <asp:Label ID="lblApplicationNo"  runat="server" Text='<%# Bind("ApplicationNo") %>'></asp:Label>  
                    </ItemTemplate>  
                     <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  


                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Mark">  
                      
                    <ItemTemplate>  
                         <asp:TextBox ID="txtMark" Visible="false" runat="server" Enabled="false" Text='<%# Bind("Mark") %>'></asp:TextBox>  
                        <asp:Label ID="lblMark" runat="server" Text='<%# Bind("Mark") %>'></asp:Label>  
                    </ItemTemplate>  
                     <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  



                </asp:TemplateField>  
                 <asp:TemplateField HeaderText="Class">  
                    
                    <ItemTemplate>  
                         <asp:TextBox ID="txtClass" Visible="false" runat="server" Enabled="false" Text='<%# Bind("Class") %>' ></asp:TextBox>  
                        <asp:Label ID="lblClass" runat="server" Text='<%# Bind("Class") %>'></asp:Label>  
                    </ItemTemplate>  
                      <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>    
                  
                  
                 <asp:TemplateField HeaderText="Applicant">  
                      
                    <ItemTemplate>  
                        <asp:TextBox ID="txtApplicant"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("Applicant") %>'></asp:TextBox>
                        <asp:Label ID="lblApplicant" runat="server" Text='<%# Bind("Applicant") %>'></asp:Label>  
                    </ItemTemplate>  
                      <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                     
                <asp:TemplateField HeaderText="EmailId">  
                    
                    <ItemTemplate>  
                         <asp:Label ID="lblEmailId"   runat="server"  Text='<%# Bind("EmailId") %>'></asp:Label>  
                         <asp:TextBox ID="txtEmailId" Visible="false" runat="server" Enabled="false" Text='<%# Bind("EmailId") %>'></asp:TextBox>
                    </ItemTemplate>  
                     <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                 <asp:TemplateField HeaderText="PhoneNumber">  
                     
                    <ItemTemplate>  
                        <asp:Label ID="lblPhoneNumber"   runat="server"  Text='<%# Bind("PhoneNumber") %>'></asp:Label> 
                         <asp:TextBox ID="txtPhoneNumber"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>  
                    </ItemTemplate>  
                      <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                  <asp:TemplateField HeaderText="HearingDate">  
                    
                    <ItemTemplate>  
                         <asp:TextBox ID="txtHearingDate"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("HearingDate1") %>'></asp:TextBox>  
                        <asp:Label ID="lblHearingDate" runat="server" Text='<%# Bind("HearingDate1") %>'></asp:Label>  
                    </ItemTemplate>  
                       <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                              <asp:TemplateField HeaderText="ReminderSent">  
                   
                    <ItemTemplate>  
                        <asp:TextBox ID="txtReminderSent"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("ReminderSent") %>'></asp:TextBox>
                        <asp:Label ID="lblReminderSent" runat="server" Text='<%# Bind("ReminderSent") %>'></asp:Label>  
                    </ItemTemplate>  
                                   <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                              <asp:TemplateField HeaderText="LastReminderSentOn">  
                     
                    <ItemTemplate> 
                         <asp:TextBox ID="txtLastReminderSentOn"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("LastReminderSentOn1") %>'></asp:TextBox> 
                        <asp:Label ID="lblLastReminderSentOn" runat="server" Text='<%# Bind("LastReminderSentOn1") %>'></asp:Label>  
                    </ItemTemplate>
                                   <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                              <asp:TemplateField HeaderText="InstructionRecived">  
                    
                    <ItemTemplate> 
                         <asp:TextBox ID="txtInstructionRecived"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("InstructionRecived") %>'></asp:TextBox>
                        <asp:Label ID="lblInstructionRecived" runat="server" Text='<%# Bind("InstructionRecived") %>'></asp:Label>  
                    </ItemTemplate>  
                                   <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                                        <asp:TemplateField HeaderText="AffidavitRequired">  
                    
                    <ItemTemplate>  
                         <asp:TextBox ID="txtAffidavitRequired"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("AffidavitRequired") %>'></asp:TextBox>
                        <asp:Label ID="lblAffidavitRequired" runat="server" Text='<%# Bind("AffidavitRequired") %>'></asp:Label>  
                    </ItemTemplate>
                           <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  
                  
                </asp:TemplateField>  
                    <asp:TemplateField HeaderText="AffidavitSent">  
                     
                    <ItemTemplate> 
                         <asp:TextBox ID="txtAffidavitSent"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("AffidavitSent") %>'></asp:TextBox>  
                        <asp:Label ID="lblAffidavitSent" runat="server" Text='<%# Bind("AffidavitSent") %>'></asp:Label>  
                    </ItemTemplate>  
                         <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                  <asp:TemplateField HeaderText="PaymentRecived">  
                     
                    <ItemTemplate>  
                          <asp:TextBox ID="txtPaymentRecived"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("PaymentRecived") %>'></asp:TextBox>
                        <asp:Label ID="lblPaymentRecived" runat="server" Text='<%# Bind("PaymentRecived") %>'></asp:Label>  
                    </ItemTemplate>  
                       <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  
                 <asp:TemplateField HeaderText="FileHandledAt">  
                      
                    <ItemTemplate>  
                          <asp:TextBox ID="txtFileHandleAt"  Visible="false" runat="server" Enabled="false" Text='<%# Bind("FileHandleAt") %>'></asp:TextBox>
                        <asp:Label ID="lblFileHandleAt" runat="server" Text='<%# Bind("FileHandleAt") %>'></asp:Label>  
                    </ItemTemplate>  
                      <ItemStyle Width="20px" />
                    <HeaderStyle  Width="20px" />  

                </asp:TemplateField>  

                 </Columns>  


                            </asp:GridView>

                        </div>

       
    </form>
</body>
</html>

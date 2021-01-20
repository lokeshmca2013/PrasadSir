<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleofCharges.aspx.cs" Inherits="SOC.ScheduleofCharges" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
   </title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
          var SNO =30;
        $(document).ready(function () {
          
            $("#btnAddRow").click(function () {

                //Getting value from to populate
               
                SNO++;
                
                var textareaid = "Id="+'"' + "txtService"+ SNO + '"';
                var textboxid ='"'+ "txtFee" + SNO + '"' ;
                var textareacolumn = "<td>" + "<textarea" + textareaid + "rows=" + '"5"' + "cols=" + '"50"' + ">"
                    + "</textarea>" + "</td>";
                var textboxcolumn="<td>" +
                    "<asp:TextBox ID=" + textboxid + "style=" + '"width: 200px"'+
                    "></asp:TextBox></td>"
                alert(textareacolumn);
                alert(textboxcolumn);
                //Prepare TR to add in Table
                var tr; 
                tr = $('<tr style="left:180px"/>');
                tr.append("<td style="+'"padding-left:180px"' + ">" + SNO+ + "</td>");
                tr.append(textareacolumn);
                tr.append(textboxcolumn);
                tr.append("</tr>")
                alert(tr);
                $('#SOCtable').append(tr);

            });
        });


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div >
            <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="BtnAdd_Click" />

        </div>
        <div id="title" style="text-align:center;display:none" runat="server" >
                        Schedule of Charges in India; Effective from <br />
                        April 1, 2020 till March 31, 2021
                        
        </div>
        <br />
        <br />
        <br />
        <div id="tablediv" style="display:none" runat="server">
            <table id="SOCtable">
                
                <tr>
                     <th style="width:300px">SNO</th>
                     <th style="width:500px">TRADE MARKS</th> 
                     <th style="width:260px">TotalFees</th> 

                </tr>
                
                <tr style="left:320px">
                    <td style="padding-left:180px">
                       1.   
                    </td>
                    <td>
                       <textarea  id="txtService1" rows="5" cols="50" runat="server">
                          
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee1" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="padding-left:180px">
                    <td style="padding-left:180px" >
                       2.   
                    </td>
                    <td>
                       <textarea  id="txtService2" rows="5" cols="50" runat="server">
                          
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee2" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       3.   
                    </td>
                    <td>
                       <textarea  id="txtService3" rows="5" cols="50" runat="server">
                          
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee3" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       4.   
                    </td>
                    <td>
                       <textarea  id="txtService4" rows="5" cols="50" runat="server">
                          

                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee4" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
               <tr style="left:180px">
                    <td style="padding-left:180px" >
                       5.   
                    </td>
                    <td>
                       <textarea  id="txtService5" rows="5" cols="50" runat="server">
                        </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee5" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       6.   
                    </td>
                    <td>
                       <textarea  id="txtService6" rows="5" cols="50" runat="server">
                        
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee6" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
               <tr style="left:180px">
                    <td style="padding-left:180px" >
                       7.   
                    </td>
                    <td>
                       <textarea  id="txtService7" rows="5" cols="50" runat="server">
                       
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee7" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
               <tr style="left:180px">
                    <td style="padding-left:180px" >
                       8.   
                    </td>
                    <td>
                        <textarea id="txtService8" rows="5" cols="50" runat="server">
                           
                        

                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee8" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
               <tr style="left:180px">
                    <td style="padding-left:180px" >
                       9.   
                    </td>
                    <td>
                       <textarea  id="txtService9" rows="5" cols="50" runat="server">
                           

                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee9" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       10.   
                    </td>
                    <td>
                       <textarea  id="txtService10" rows="5" cols="50" runat="server">
                        
   
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee10" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       11.   
                    </td>
                    <td>
                       <textarea  id="txtService11" rows="5" cols="50" runat="server">
                        
      
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee11" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       12.   
                    </td>
                    <td>
                      <textarea  id="txtService12" rows="5" cols="50" runat="server">
                        
      
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee12" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       13.   
                    </td>
                    <td>
                       <textarea  id="txtService13" rows="5" cols="50" runat="server">


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee13" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       14.   
                    </td>
                    <td>
                       <textarea  id="txtService14" rows="5" cols="50" runat="server">



                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee14" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       15.   
                    </td>
                    <td>
                       <textarea  id="txtService15" rows="5" cols="50" runat="server">

                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee15" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       16.   
                    </td>
                    <td>
                       <textarea  id="txtService16" rows="5" cols="50" runat="server">
                           

                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee16" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:500px">
                    <td >
                        IPAB
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       17.   
                    </td>
                    <td>
                       <textarea  id="txtService17" rows="5" cols="50" runat="server">


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee17" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       18.   
                    </td>
                    <td>
                       <textarea  id="txtService18" rows="5" cols="50" runat="server">


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee18" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       19.   
                    </td>
                    <td>
                       <textarea  id="txtService19" rows="5" cols="50" runat="server">

                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee19" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       20.   
                    </td>
                    <td>
                       <textarea  id="txtService20" rows="5" cols="50" runat="server">


  
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee20" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       21.   
                    </td>
                    <td>
                      <textarea  id="txtService21" rows="5" cols="50" runat="server">
      
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee21" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       22.   
                    </td>
                    <td>
                       <textarea  id="txtService22" rows="5" cols="50" runat="server">


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee22" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:180px">
                    <td style="padding-left:180px" >
                       23.   
                    </td>
                    <td>
                       <textarea  id="txtService23" rows="5" cols="50" runat="server">


                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee23" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >
                        Court Proceedings
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       24.   
                    </td>
                    <td>
                       <textarea  id="txtService24" rows="5" cols="50" runat="server">


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee24" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       25.   
                    </td>
                    <td>
                       <textarea  id="txtService25" rows="5" cols="50" runat="server">


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee25" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       26.   
                    </td>
                    <td>
                       <textarea  id="txtService26" rows="5" cols="50" runat="server">
 


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee26" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       27.   
                    </td>
                    <td>
                       <textarea  id="txtService27" rows="5" cols="50" runat="server">


                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee27" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       28.   
                    </td>
                    <td>
                       <textarea  id="txtService28" rows="5" cols="50" runat="server">

                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee28" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       29.   
                    </td>
                    <td>
                       <textarea  id="txtService29" rows="5" cols="50" runat="server">

  
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee29" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       30.   
                    </td>
                    <td>
                       <textarea  id="txtService30" rows="5" cols="50" runat="server">
                      </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee30" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
               <%-- <tr style="left:320px">
                    <td style="padding-left:180px" >
                       31.   
                    </td>
                    <td>
                       <textarea  id="txtService31" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee31" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       32.   
                    </td>
                    <td>
                       <textarea  id="txtService32" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee32" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       33.   
                    </td>
                    <td>
                       <textarea  id="txtService33" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee33" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       34.   

                    </td>
                    <td>
                       <textarea  id="txtService34" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee34" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       35.   
                    </td>
                    <td>
                       <textarea  id="txtService35" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee35" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       36.   
                    </td>
                    <td>
                       <textarea  id="txtService36" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee36" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       37.   
                    </td>
                    <td>
                       <textarea  id="txtService37" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee37" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       38.   
                    </td>
                    <td>
                       <textarea  id="txtService38" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee38" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       39.   
                    </td>
                    <td>
                       <textarea  id="txtService39" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee39" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       40.   
                    </td>
                    <td>
                       <textarea  id="txtService40" rows="5" cols="50" runat="server">

                      </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee40" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       41.   
                    </td>
                    <td>
                       <textarea  id="txtService41" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee41" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       42.   
                    </td>
                    <td>
                       <textarea  id="txtService42" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee42" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       43.   
                    </td>
                    <td>
                       <textarea  id="txtService43" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee43" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       44.   
                    </td>
                    <td>
                       <textarea  id="txtService44" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee44" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       45.   
                    </td>
                    <td>
                       <textarea  id="txtService45" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee45" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       36.   
                    </td>
                    <td>
                       <textarea  id="txtService46" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee46" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       47.   
                    </td>
                    <td>
                       <textarea  id="txtService47" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee47" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       48.   
                    </td>
                    <td>
                       <textarea  id="txtService48" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee48" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       49.   
                    </td>
                    <td>
                       <textarea  id="txtService49" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee49" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       50.   
                    </td>
                    <td>
                       <textarea  id="txtService50" rows="5" cols="50" runat="server">

                                                  </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee50" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       51.   
                    </td>
                    <td>
                       <textarea  id="txtService51" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee51" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       52.   
                    </td>
                    <td>
                       <textarea  id="txtService52" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee52" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       53.   
                    </td>
                    <td>
                       <textarea  id="txtService53" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee53" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       54.   
                    </td>
                    <td>
                       <textarea  id="txtService54" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee54" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       55.   
                    </td>
                    <td>
                       <textarea  id="txtService55" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee55" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       56.   
                    </td>
                    <td>
                       <textarea  id="txtService56" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee56" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       57.   
                    </td>
                    <td>
                       <textarea  id="txtService57" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee57" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       58.   
                    </td>
                    <td>
                       <textarea  id="txtService58" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee58" runat="server" style="width:200px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       59.   
                    </td>
                    <td>
                       <textarea  id="txtService59" rows="5" cols="50" runat="server">
                           
                       </textarea>
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee59" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="left:320px">
                    <td style="padding-left:180px" >
                       60.   
                    </td>
                    <td>
                       <textarea  id="txtService60" rows="5" cols="50" runat="server">
                           </textarea>
              
                    </td>
                    <td>
                         <asp:TextBox ID="txtFee60" style="width:200px" runat="server"></asp:TextBox>
                    </td>
                </tr>--%>

                <tr style="text-align:center">
                    <td >
                       <input type="button" value="Add New Row" id="btnAddRow" />

                    </td>
                </tr>
            </table>
            <div>
                 <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>
       

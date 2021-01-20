using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;


namespace SOC
{
    public partial class Email : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=SUDHEERLAPPY\\SQL2014;Database=Sample;Integrated Security=true");
        SqlCommand cmd;
        string EmailIdquery;
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                Bind();
            }
        }
        public void Bind()
        {

            con.Open();
            EmailIdquery = "SELECT EmailId from Emailtable";

            cmd = new SqlCommand(EmailIdquery, con);
            System.Data.DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GridView.DataSource = ds;
            GridView.DataBind();
        }
        public bool SendMail(string ToEmailIid)
        {

            using (MailMessage msg = new MailMessage())
            {
                string activationCode = Guid.NewGuid().ToString();

                msg.From = new MailAddress("chinnamlokesh555@gmail.com");
                msg.To.Add(ToEmailIid);
                msg.Subject = "TestMail";
                

                using (SmtpClient smt = new SmtpClient())
                {
                    try
                    {
                        smt.Host = "smtp.gmail.com";
                        System.Net.NetworkCredential ntwd = new NetworkCredential();
                        ntwd.UserName = "chinnamlokesh555@gmail.com";
                        ntwd.Password = "jaisriram@100";
                        smt.UseDefaultCredentials = true;
                        smt.Credentials = ntwd;
                        smt.Port = 587;
                        smt.EnableSsl = true;
                        smt.Send(msg);
                        return true;
                    }
                    catch(Exception e)
                    {
                        return false;
                    }
                  
                    
                }
            }


             
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
           
           
            foreach (GridViewRow row in GridView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox Selecteditem = (row.Cells[0].FindControl("chkSelect") as CheckBox);
                    string Emailid = (row.Cells[1].FindControl("txtEmail") as Label).Text;
                    
                    if (Selecteditem.Checked)
                    {
                        bool result=SendMail(Emailid);
                        Label lbl = new Label();
                        if(result)
                        {
                             
                            Emailid = Emailid +" "+ "\u221A";
                        }
                        lbl.Text = Emailid;
                        Panel1.Controls.Add(lbl);
                        Panel1.Controls.Add(new LiteralControl("<br />"));
                        
                        //str = str + Emailid + ",";

                    }
                }
            }
            Button btn = new Button();
            btn.ID = "btnclose";
            btn.Text = "Close";
            Panel1.Controls.Add(new LiteralControl("<br />"));
            Panel1.Controls.Add(btn);
            ModalPopupExtender1.CancelControlID = "btnclose";
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('" + str + "');", true);
            ModalPopupExtender1.Show();
        }
        
        }
    }
    

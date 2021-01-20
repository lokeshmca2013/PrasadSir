using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


namespace SOC
{
    public partial class HearingSearch : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SUDHEERLAPPY\\SQL2014;Database=Sample;Integrated Security=true");
        SqlCommand cmd;
        
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void gvbind()
        {

            //string c = ConfigurationManager.ConnectionStrings["SOCConnectionString"].ConnectionString;
            //SqlConnection con = new System.Data.SqlClient.SqlConnection(c);
            con.Open();
            //SqlCommand cmd;
            string HearingSearchquery;
            if (!string.IsNullOrEmpty(txtHearingDateSearchFrom.Value) && !string.IsNullOrEmpty(txtHearingDateSearchTo.Value))
             {
                 HearingSearchquery = "SELECT FileNo,ApplicationNo,Mark,Class,Applicant,EmailId,PhoneNumber,HearingDate1,ReminderSent, LastReminderSentOn1,InstructionRecived,AffidavitRequired,AffidavitSent,PaymentRecived,FileHandleAT FROM HearingSearchtable WHERE(ApplicationNo LIKE '%" + txtApplicationNumberForHearingSearch.Value.Trim() + "%') AND (Mark LIKE '%" + txtMarkForHearingSearch.Value.Trim() + "%') AND ( HearingDate LIKE '%" + txtHearingDateSearchTo.Value.Trim() + "%') AND (HearingDate LIKE '%" + txtHearingDateSearchFrom.Value.Trim() + "%') AND (FileHandleAt LIKE '%" + txtFileHandleAtForHearingSearch.Value.Trim() + "%') AND (HearingDate BETWEEN '" + Convert.ToDateTime(txtHearingDateSearchFrom.Value.Trim()) + "' AND '" + Convert.ToDateTime(txtHearingDateSearchTo.Value.Trim()) + "') ORDER BY FileNo";

                cmd = new SqlCommand(HearingSearchquery, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                gridviewHearingDateSearch.DataSource = ds;
                gridviewHearingDateSearch.DataBind();




            }
            else if (!string.IsNullOrEmpty(txtApplicationNumberForHearingSearch.Value) || !string.IsNullOrEmpty(txtFileNumberForHearingSearch.Value) || !string.IsNullOrEmpty(txtApplicantForHearingSearch.Value) || !string.IsNullOrEmpty(txtClassForHearingSearch.Value) || !string.IsNullOrEmpty(txtMarkForHearingSearch.Value) || !string.IsNullOrEmpty(txtFileHandleAtForHearingSearch.Value))
            {

                HearingSearchquery = "SELECT FileNo,ApplicationNo,Mark,Class,Applicant,EmailId,PhoneNumber,HearingDate1,ReminderSent, LastReminderSentOn1,InstructionRecived,AffidavitRequired,AffidavitSent,PaymentRecived,FileHandleAT FROM HearingSearchtable WHERE (ApplicationNo LIKE '%" + txtApplicationNumberForHearingSearch.Value.Trim() + "%') AND (Mark LIKE '%" + txtMarkForHearingSearch.Value.Trim() + "%') AND ( FileNo LIKE '%" + txtFileNumberForHearingSearch.Value.Trim() + "%') AND ( Class LIKE '%" + txtClassForHearingSearch.Value.Trim() + "%') AND (FileHandleAt LIKE '%" + txtFileHandleAtForHearingSearch.Value.Trim() + "%') AND (Applicant LIKE '%" + txtApplicantForHearingSearch.Value.Trim() + "%') order by FileNo";
                cmd = new SqlCommand(HearingSearchquery, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);

                gridviewHearingDateSearch.DataSource = ds;
                gridviewHearingDateSearch.DataBind();


            }
            else
            {
                HearingSearchquery = "select IDNo, FileNo,ApplicationNo,Mark,Class,Applicant,EmailId,PhoneNumber,HearingDate,HearingDate1,ReminderSent,LastReminderSentOn,LastReminderSentOn1,InstructionRecived,AffidavitRequired,AffidavitSent,PaymentRecived,FileHandleAt from HearingSearchtable order by FileNo";
                cmd = new SqlCommand(HearingSearchquery, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);

                gridviewHearingDateSearch.DataSource = ds;
                gridviewHearingDateSearch.DataBind();



            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {


            gridviewHearingDateSearch.EditIndex = e.NewEditIndex;
            gvbind();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           int IDNo = Convert.ToInt32(gridviewHearingDateSearch.DataKeys[e.RowIndex].Value.ToString());
           GridViewRow row = (GridViewRow)gridviewHearingDateSearch.Rows[e.RowIndex];
           Label lblID = (Label)row.FindControl("lblID");
           TextBox FileNo= (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[2].FindControl("txtFileNo");
            int Fileno = Convert.ToInt32(FileNo.Text);
            TextBox Mark = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[2].FindControl("txtMark");
           TextBox Class = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[3].FindControl("txtClass");
            TextBox Applicant = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[4].FindControl("txtApplicant");
            TextBox EmailId = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[5].FindControl("txtEmailId");
            TextBox PhoneNumber = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[6].FindControl("txtPhoneNumber"); 
            TextBox HearingDate = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[7].FindControl("txtHearingDate"); ;
            TextBox Reminder = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[8].FindControl("txtReminderSent");
            int ReminderSent = Convert.ToInt32(Reminder.Text);
          //  int RS = int.TryParse();
            TextBox LastReminderSentOn = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[9].FindControl("txtLastReminderSentOn");
            TextBox InstructionRecived = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[10].FindControl("txtInstructionRecived");
            TextBox AffidavitRequired = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[11].FindControl("txtAffidavitRequired");
            TextBox AffidavitSent = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[12].FindControl("txtAffidavitSent");
            TextBox PaymentRecived = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[13].FindControl("txtPaymentRecived");
            TextBox FileHandleAt = (TextBox)gridviewHearingDateSearch.Rows[e.RowIndex].Cells[14].FindControl("txtFileHandleAt");
            //TextBox txt = (TextBox)gridviewHearingDateSearch.cell[].control[];
            gridviewHearingDateSearch.EditIndex = -1;
            con.Open();
            
            cmd = new SqlCommand("UpdateHearingSearch",con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDNo", System.Data.SqlDbType.Int));
            cmd.Parameters["@IDNo"].Value = IDNo;

            cmd.Parameters.Add(new SqlParameter("@FileNo", System.Data.SqlDbType.Int));
            cmd.Parameters["@FileNo"].Value = Fileno;

            cmd.Parameters.Add(new SqlParameter("@Mark", System.Data.SqlDbType.VarChar, 500));
            cmd.Parameters["@Mark"].Value = Mark.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@Class", System.Data.SqlDbType.VarChar, 50));
            cmd.Parameters["@Class"].Value = Class.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@Applicant", System.Data.SqlDbType.VarChar, 500));
            cmd.Parameters["@Applicant"].Value = Applicant.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@EmailId", System.Data.SqlDbType.VarChar, 50));
            cmd.Parameters["@EmailId"].Value = EmailId.Text.ToString();


            


            cmd.Parameters.Add(new SqlParameter("@PhoneNumber", System.Data.SqlDbType.VarChar, 20));
            cmd.Parameters["@PhoneNumber"].Value = PhoneNumber.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@HearingDate1", System.Data.SqlDbType.VarChar,50));
            cmd.Parameters["@HearingDate1"].Value = HearingDate.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@ReminderSent", System.Data.SqlDbType.Int, 5));
            cmd.Parameters["@ReminderSent"].Value = ReminderSent;


            cmd.Parameters.Add(new SqlParameter("@LastReminderSentOn1", System.Data.SqlDbType.VarChar, 50));
            cmd.Parameters["@LastReminderSentOn1"].Value = LastReminderSentOn.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@InstructionRecived", System.Data.SqlDbType.VarChar, 3));
            cmd.Parameters["@InstructionRecived"].Value =InstructionRecived.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@AffidavitRequired", System.Data.SqlDbType.VarChar, 3));
            cmd.Parameters["@AffidavitRequired"].Value = AffidavitRequired.Text.ToString();
            cmd.Parameters.Add(new SqlParameter("@AffidavitSent", System.Data.SqlDbType.VarChar, 3));
            cmd.Parameters["@AffidavitSent"].Value = AffidavitSent.Text.ToString();

            cmd.Parameters.Add(new SqlParameter("@PaymentRecived", System.Data.SqlDbType.VarChar, 50));
            cmd.Parameters["@PaymentRecived"].Value = PaymentRecived.Text.ToString();


            cmd.Parameters.Add(new SqlParameter("@FileHandledAt", System.Data.SqlDbType.VarChar, 50));
            cmd.Parameters["@FileHandledAt"].Value= FileHandleAt.Text.ToString();



            //SqlCommand cmd = new SqlCommand("update detail set name='" + textName.Text + "',address='" + textadd.Text + "',country='" + textc.Text + "'where id='" + userid + "'", conn);
           cmd.ExecuteNonQuery();
           con.Close();
           gvbind();


        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridviewHearingDateSearch.PageIndex = e.NewPageIndex;
            gvbind();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridviewHearingDateSearch.EditIndex = -1;
            gvbind();

        }

        protected void gvbind(object sender, EventArgs e)
        {
            gvbind();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

          foreach(GridViewRow  row in gridviewHearingDateSearch.Rows)
            {
                //   CheckBox x =( rws.FindControl("");
                CheckBox checkbox = row.FindControl("CheckBox1") as CheckBox;
                TextBox txtFileNo = row.FindControl("txtFileNo") as TextBox;

                TextBox txtApplicationNo = row.FindControl("txtApplicationNo") as TextBox;
                TextBox txtMark = row.FindControl("txtMark") as TextBox;
                TextBox txtClass = row.FindControl("txtClass") as TextBox;
                TextBox txtApplicant = row.FindControl("txtApplicant") as TextBox;
                TextBox txtEmailId = row.FindControl("txtEmailId") as TextBox;
                TextBox txtPhoneNumber = row.FindControl("txtPhoneNumber") as TextBox;
                TextBox txtHearingDate = row.FindControl("txtHearingDate") as TextBox;
                TextBox txtReminderSent = row.FindControl("txtReminderSent") as TextBox;
                TextBox txtLastReminderSentOn = row.FindControl("txtLastReminderSentOn") as TextBox;
                TextBox txtInstructionRecived = row.FindControl("txtInstructionRecived") as TextBox;
                TextBox txtAffidavitRequired = row.FindControl("txtAffidavitRequired") as TextBox;
                TextBox txtAffidavitSent = row.FindControl("txtAffidavitSent") as TextBox;
                TextBox txtPaymentRecived = row.FindControl("txtPaymentRecived") as TextBox;
                TextBox txtFileHandleAt = row.FindControl("txtFileHandleAt") as TextBox;
                Label lblApplicationNo = row.FindControl("lblApplicationNo") as Label;
                Label lblFileNo = row.FindControl("lblFileNo") as Label;
                Label lblClass = row.FindControl("lblClass") as Label;
                Label lblMark = row.FindControl("lblMark") as Label;
                Label lblApplicant = row.FindControl("lblApplicant") as Label;
                Label lblEmailId = row.FindControl("lblEmailId") as Label;
                Label lblPhoneNumber = row.FindControl("lblPhoneNumber") as Label;
                Label lblHearingDate = row.FindControl("lblHearingDate") as Label;
                Label lblReminderSent = row.FindControl("lblReminderSent") as Label;
                Label lblLastReminderSentOn = row.FindControl("lblLastReminderSentOn") as Label;
                Label lblInstructionRecived = row.FindControl("lblInstructionRecived") as Label;
                Label lblAffidavitRequired = row.FindControl("lblAffidavitRequired") as Label;
                Label lblAffidavitSent = row.FindControl("lblAffidavitSent") as Label;
                Label lblFileHandleAt = row.FindControl("lblFileHandleAt") as Label;
                Label lblPaymentReceived = row.FindControl("lblPaymentRecived") as Label;
                Button btn_Update = row.FindControl("btn_Update") as Button;
                Button btn_Cancel = row.FindControl("btn_Cancel") as Button;




                if (checkbox.Checked)
                {
                    btn_Update.Visible = true;
                    btn_Cancel.Visible = true;
                    lblApplicationNo.Visible = false;
                    txtApplicationNo.Visible = true;
                    txtApplicationNo.Enabled = true;
                    lblFileNo.Visible = false;
                    txtFileNo.Visible = true;
                    txtFileNo.Enabled = true;
                    lblMark.Visible = false;
                    txtMark.Visible = true;
                    txtMark.Enabled = true;
                    lblClass.Visible = false;
                    txtClass.Visible = true;
                    txtClass.Enabled = true;
                    lblApplicant.Visible = false;
                    txtApplicant.Visible = true;
                    txtApplicant.Enabled = true;
                    lblEmailId.Visible = false;
                    txtEmailId.Visible = true;
                    txtEmailId.Enabled = true;
                    lblPhoneNumber.Visible = false;
                    txtPhoneNumber.Visible = true;
                    txtPhoneNumber.Enabled = true;
                    lblHearingDate.Visible = false;
                    txtHearingDate.Visible = true;
                    txtHearingDate.Enabled = true;
                    lblReminderSent.Visible = false;
                    txtReminderSent.Visible = true;
                    txtReminderSent.Enabled = true;
                    lblLastReminderSentOn.Visible = false;
                    txtLastReminderSentOn.Visible = true;
                    txtLastReminderSentOn.Enabled = true;
                    lblInstructionRecived.Visible = false;
                    txtInstructionRecived.Visible = true;
                    txtInstructionRecived.Enabled = true;
                    lblAffidavitRequired.Visible = false;
                    txtAffidavitRequired.Visible = true;
                    txtAffidavitRequired.Enabled = true;
                    lblAffidavitSent.Visible = false;
                    txtAffidavitSent.Visible = true;
                    txtAffidavitSent.Enabled = true;
                    lblFileHandleAt.Visible = false;
                    txtFileHandleAt.Visible = true;
                    txtFileHandleAt.Enabled = true;
                    lblPaymentReceived.Visible = false;
                    txtPaymentRecived.Visible = true;
                    txtPaymentRecived.Enabled = true;

                }
                else
                {  
                    btn_Update.Visible = false;
                    btn_Cancel.Visible = false;
                    lblApplicationNo.Visible = true;
                    txtApplicationNo.Visible = false;
                    txtApplicationNo.Enabled = false;
                    lblFileNo.Visible = true;
                    txtFileNo.Visible = false;
                    txtFileNo.Enabled = false;
                    lblMark.Visible = true;
                    txtMark.Visible = false;
                    txtMark.Enabled = false;
                    lblClass.Visible = true;
                    txtClass.Visible = false;
                    txtClass.Enabled = false;
                    lblApplicant.Visible = true;
                    txtApplicant.Visible = false;
                    txtApplicant.Enabled = false;
                    lblEmailId.Visible = true;
                    txtEmailId.Visible = false;
                    txtEmailId.Enabled = false;
                    lblPhoneNumber.Visible = true;
                    txtPhoneNumber.Visible = false;
                    txtPhoneNumber.Enabled = false;
                    lblHearingDate.Visible = true;
                    txtHearingDate.Visible = false;
                    txtHearingDate.Enabled = false;
                    lblReminderSent.Visible = true;
                    txtReminderSent.Visible = false;
                    txtReminderSent.Enabled = false;
                    lblLastReminderSentOn.Visible = true;
                    txtLastReminderSentOn.Visible = false;
                    txtLastReminderSentOn.Enabled = false;
                    lblInstructionRecived.Visible = true;
                    txtInstructionRecived.Visible = false;
                    txtInstructionRecived.Enabled = false;
                    lblAffidavitRequired.Visible = true;
                    txtAffidavitRequired.Visible = false;
                    txtAffidavitRequired.Enabled = false;
                    lblAffidavitSent.Visible = true;
                    txtAffidavitSent.Visible = false;
                    txtAffidavitSent.Enabled = false;
                    lblFileHandleAt.Visible = true;
                    txtFileHandleAt.Visible = false;
                    txtFileHandleAt.Enabled = false;
                    lblPaymentReceived.Visible = true;
                    txtPaymentRecived.Visible = false;
                    txtPaymentRecived.Enabled = false;
                }


                }
          

        }

       
    }
    }

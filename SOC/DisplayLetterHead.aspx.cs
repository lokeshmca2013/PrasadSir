using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SOC
{
    public partial class DisplayLetterHead : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SUDHEERLAPPY;Database=Sample;Integrated Security=true");
        SqlCommand cmd;
        string selectedValue;


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GenerateReport()
        {
            selectedValue = ddlSelectedLetterCode.SelectedItem.Value;

            if(string.IsNullOrEmpty(selectedValue))
            {
                cmd = new SqlCommand("GetLetterHeadDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ImageCode", selectedValue); 
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable datatable = new DataTable();
                da.Fill(datatable);    
                ReportDocument crystalReport = new ReportDocument();     
                crystalReport.Load(Server.MapPath("~/CrystalReport1.rpt"));     
                crystalReport.SetDataSource(datatable);     
                CrystalReportViewer1.ReportSource = crystalReport;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            GenerateReport();
        }
    }
}
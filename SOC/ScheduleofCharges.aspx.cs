using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BussinessLogic;
using BussinessLogic.BussinessLogicLayer;
using Entities.Entities;
using System.Data;

namespace SOC
{
    public partial class ScheduleofCharges : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SOCEntity entity = new SOCEntity();
            BussinessLogicLayer bll = new BussinessLogicLayer();
            entity.FeeDetails = txtFee1.Text;
            entity.FeeDetails = txtFee2.Text;
            entity.FeeDetails = txtFee3.Text;
            entity.FeeDetails = txtFee4.Text;
            entity.FeeDetails = txtFee4.Text;
            entity.FeeDetails = txtFee6.Text;
            //entity.ServiceTittle = txtService1.Text.Tostring();
            bll.InsertSOCDetails(entity);

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            title.Style.Add("display", "block");
            tablediv.Style.Add("display", "block");
            
            BussinessLogicLayer bll = new BussinessLogicLayer();
            DataSet ds=bll.GetSocDetails();
            if (ds.Tables[0].Rows.Count != 0)
            {
                txtService1.Value= ds.Tables[0].Rows[0][1].ToString();
                txtService2.Value = ds.Tables[0].Rows[1][1].ToString();
                txtService3.Value= ds.Tables[0].Rows[2][1].ToString();
                txtService4.Value = ds.Tables[0].Rows[3][1].ToString();
                txtService5.Value = ds.Tables[0].Rows[4][1].ToString();
                txtService6.Value = ds.Tables[0].Rows[5][1].ToString();
                txtService7.Value = ds.Tables[0].Rows[6][1].ToString();
                txtService8.Value = ds.Tables[0].Rows[7][1].ToString();
                txtService9.Value = ds.Tables[0].Rows[8][1].ToString();
                txtService10.Value = ds.Tables[0].Rows[9][1].ToString();
                txtService11.Value = ds.Tables[0].Rows[10][1].ToString();
                txtService12.Value = ds.Tables[0].Rows[11][1].ToString();
                txtService13.Value = ds.Tables[0].Rows[12][1].ToString();
                txtService14.Value = ds.Tables[0].Rows[13][1].ToString();
                txtService15.Value = ds.Tables[0].Rows[14][1].ToString();
                txtService16.Value = ds.Tables[0].Rows[15][1].ToString();
                txtService17.Value = ds.Tables[0].Rows[16][1].ToString();
                txtService18.Value = ds.Tables[0].Rows[17][1].ToString();
                txtService19.Value = ds.Tables[0].Rows[18][1].ToString();
                txtService20.Value = ds.Tables[0].Rows[19][1].ToString();
                txtService21.Value = ds.Tables[0].Rows[20][1].ToString();
                txtService22.Value = ds.Tables[0].Rows[21][1].ToString();
                txtService23.Value = ds.Tables[0].Rows[22][1].ToString();
                txtService24.Value = ds.Tables[0].Rows[23][1].ToString();
                txtService25.Value = ds.Tables[0].Rows[24][1].ToString();
                txtService26.Value = ds.Tables[0].Rows[25][1].ToString();
                txtService27.Value = ds.Tables[0].Rows[26][1].ToString();
                txtService28.Value = ds.Tables[0].Rows[27][1].ToString();
                txtService29.Value = ds.Tables[0].Rows[28][1].ToString();
                txtService30.Value = ds.Tables[0].Rows[29][1].ToString();
                //txtService31.Value = ds.Tables[0].Rows[31][1].ToString();
                //txtService32.Value = ds.Tables[0].Rows[32][1].ToString();
                //txtService33.Value = ds.Tables[0].Rows[33][1].ToString();
                //txtService34.Value = ds.Tables[0].Rows[34][1].ToString();
                txtFee1.Text = ds.Tables[0].Rows[0][2].ToString();
                txtFee2.Text = ds.Tables[0].Rows[1][2].ToString();
                txtFee3.Text = ds.Tables[0].Rows[2][2].ToString();
                txtFee4.Text = ds.Tables[0].Rows[3][2].ToString();
                txtFee5.Text = ds.Tables[0].Rows[4][2].ToString();
                txtFee6.Text = ds.Tables[0].Rows[5][2].ToString();
                txtFee7.Text = ds.Tables[0].Rows[6][2].ToString();
                txtFee8.Text = ds.Tables[0].Rows[7][2].ToString();
                txtFee9.Text = ds.Tables[0].Rows[8][2].ToString();
                txtFee10.Text = ds.Tables[0].Rows[9][2].ToString();
                txtFee11.Text = ds.Tables[0].Rows[10][2].ToString();
                txtFee12.Text = ds.Tables[0].Rows[11][2].ToString();
                txtFee13.Text = ds.Tables[0].Rows[12][2].ToString();
                txtFee14.Text = ds.Tables[0].Rows[13][2].ToString();
                txtFee15.Text = ds.Tables[0].Rows[14][2].ToString();
                txtFee16.Text = ds.Tables[0].Rows[15][2].ToString();
                txtFee17.Text = ds.Tables[0].Rows[16][2].ToString();
                txtFee18.Text = ds.Tables[0].Rows[17][2].ToString();
                txtFee19.Text = ds.Tables[0].Rows[18][2].ToString();
                txtFee20.Text = ds.Tables[0].Rows[19][2].ToString();
                txtFee21.Text = ds.Tables[0].Rows[20][2].ToString();
                txtFee22.Text = ds.Tables[0].Rows[21][2].ToString();
                txtFee23.Text = ds.Tables[0].Rows[22][2].ToString();
                txtFee24.Text = ds.Tables[0].Rows[23][2].ToString();
                txtFee25.Text = ds.Tables[0].Rows[24][2].ToString();
                txtFee26.Text = ds.Tables[0].Rows[25][2].ToString();
                txtFee27.Text = ds.Tables[0].Rows[26][2].ToString();
                txtFee28.Text = ds.Tables[0].Rows[27][2].ToString();
                txtFee29.Text = ds.Tables[0].Rows[28][2].ToString();
                txtFee30.Text = ds.Tables[0].Rows[29][2].ToString();







            }

        }
    }
}
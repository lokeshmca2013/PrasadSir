using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOC
{
    public partial class LetterHeadImages : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SUDHEERLAPPY;Database=Sample;Integrated Security=true");
        SqlCommand cmd;
        System.Drawing.Image image;
        string selectedValue;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
            return returnImage;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            selectedValue = ddlSelectedLetterCode.SelectedItem.Value;


            if (FileUpload1.HasFile)
            {
                byte[] imageBytes = FileUpload1.FileBytes;
                image = byteArrayToImage(imageBytes);
                string height = Convert.ToString(image.Height);
                string Width = Convert.ToString(image.Width);
                cmd = new SqlCommand("InsertLetterHeads", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@ImageData", imageBytes); // bytes  
                cmd.Parameters.AddWithValue("@ImageCode", selectedValue); // getting file size  
                cmd.Parameters.AddWithValue("@Height", height); // bytes  
                cmd.Parameters.AddWithValue("@Width", Width);
                int returnvalue = cmd.ExecuteNonQuery();
                con.Close();
                cmd.Dispose();
                if (returnvalue > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Image Saved Successfully');", true);
                }

            }
        }
    }
}
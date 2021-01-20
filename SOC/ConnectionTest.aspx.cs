using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SOC
{
    public partial class ConnectionTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string c  = ConfigurationManager.ConnectionStrings["SOCConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(c);
            con.Open();
            Response.Write(con.State);




        }
    }
}
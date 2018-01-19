using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Email
{
    public partial class unread1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string CheckNewEmail(String username)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $"SELECT TOP 1 * FROM emails WHERE reciver = '{username}' AND deleted = 'N' AND status = 'U' ORDER BY emailId DESC";
            SqlDataReader data = cmd.ExecuteReader();
            if (data.Read())
            {
                DateTime latestEmail = DateTime.Parse(data["date"].ToString());
                DateTime currentTime = DateTime.Now;
                TimeSpan difference = currentTime.Subtract(latestEmail);
                double diffSec = difference.TotalSeconds;
                if (diffSec < 10)
                {
                    return "unread.aspx";
                }
            }
            return "";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text.RegularExpressions;
using System.Drawing;

using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace AS_Assignment_203769L
{
    public partial class Success : System.Web.UI.Page
    {
        string MYDBConnectionString =
            System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString;
        byte[] Key;
        byte[] IV;
        byte[] nric = null;
        string userID = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                userID = (string)Session["userID"];

                displayUserProfile(userID);
            }

        }

       /* protected void displayUserProfile(string userid)
        {
            SqlConnection connection = new SqlConnection(MYDBConnectionString);
            string sql = "select * FROM Account WHERE EmailAddress=@USERID";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@USERID", userid);
            try
            {
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                    }
                    lbl_nric.Text = decryptData(nric);
                }
            }//try
    }*/
}
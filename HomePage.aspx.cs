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
using System.IO;

namespace AS_Assignment_203769L
{
    public partial class HomePage : System.Web.UI.Page
    {
        string MYDBConnectionString =
            System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString;
        byte[] Key;
        byte[] IV;
        byte[] nric = null;
        string userID = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] != null && Session["AuthToken"] != null && Request.Cookies["AuthToken"] != null)
            {
                if (!Session["AuthToken"].ToString().Equals(Request.Cookies["AuthToken"].Value))
                {
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    lblMessage.Text = "You are logged in";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    btnLogout.Visible = true;
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }

        }

        protected void LogoutMe(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            Response.Redirect("Login.aspx", false);

            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
            }
            if (Request.Cookies["AuthToken"] != null)
            {
                Response.Cookies["AuthToken"].Value = string.Empty;
                Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
            }
        }

        protected void displayUserProfile(string userid)
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
                        if(reader["EmailAddress"] != DBNull.Value)
                        {
                            lbl_userid.Text = reader["EmailAddress"].ToString();
                        }

                   }
                  
               }
           }//try
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());

            }
            finally
            {
                connection.Close();
            }
   }
    }

    /*protected string decryptData(byte[] cipherText)
    {
        string plainText = null;

        try
        {
            RijndaelManaged cipher = new RijndaelManaged();
            IV = cipher.IV;
            cipher.Key = Key;
            // Create a decrytor to perform the stream transform.
            ICryptoTransform decryptTransform = cipher.CreateDecryptor();

            using (MemoryStream msDecrypt = new MemoryStream(cipherText))
            {
                using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptTransform, CryptoStreamMode.Read))
                {
                    using (StreamReader srDecrypt = new StreamReader(csDescrypt))
                    {
                        plainText = srDecrypt.ReadToEnd();
                    }
                }
            }
        }
        catch (Exception ex) { throw new Exception(ex.ToString()); }
        finally { }
        return plainText;
    }*/
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using Sajt.BusinessLayer;

namespace Sajt
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                Label4.Visible = false;
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            string kor_ime = TextBoxKorIme.Text;
            string lozinka = TextBoxLozinka.Text;

            string connStr = WebConfigurationManager.ConnectionStrings["restoranBaza"].ConnectionString;

            SqlConnection sqlConn = new SqlConnection(connStr);

            SqlCommand sqlComm = new SqlCommand("SELECT * FROM admin WHERE kor_ime = @kor_ime AND lozinka = @lozinka", sqlConn);

            sqlComm.Parameters.Add("@kor_ime", SqlDbType.NVarChar).Value = kor_ime;
            sqlComm.Parameters.Add("@lozinka", SqlDbType.NVarChar).Value = lozinka;

            sqlConn.Open();
            string result = Convert.ToString(sqlComm.ExecuteScalar());

            if (string.IsNullOrEmpty(result))
            {
                Label4.Visible = true;
            }
            else
            {
                Session["kor_ime"] = TextBoxKorIme.Text.ToString();
                Session["lozinka"] = TextBoxLozinka.Text.ToString();
                sqlConn.Close();
                Response.Redirect("~/Admin.aspx");
            }
        }
    }
}
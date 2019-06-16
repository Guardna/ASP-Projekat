using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sajt.BusinessLayer;

namespace Sajt.Administrator
{
    public partial class dodavanjeSlika : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpSlikeSelect op = new OpSlikeSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                SlikeDb[] slike = items.Cast<SlikeDb>().ToArray();

                GridView1.DataSource = slike;
                GridView1.DataBind();
            }
        }

        protected void btnUnesi_Click(object sender, EventArgs e)
        {
            string naziv = this.TextBoxNaziv.Text;
            FileUpload slika = (FileUpload)this.FileUploadSlika;

            if (slika.HasFile)
            {
                string fileName = slika.PostedFile.FileName;
                string novoIme = String.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyyHHmmss"), fileName);
                string putanjaSlika = Server.MapPath("~/img/upload/") + novoIme;
                slika.SaveAs(putanjaSlika);

                OpSlikeInsert insert = new OpSlikeInsert();
                insert.Slike = new SlikeDb { Naziv = naziv, Putanja = "~/img/upload/" + novoIme };
                OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(insert);

                if ((obj == null) || (!obj.Status))
                    return;
                else
                {
                    DbItem[] items = obj.DbItems;
                    SlikeDb[] slike = items.Cast<SlikeDb>().ToArray();

                    GridView1.DataSource = slike;
                    GridView1.DataBind();
                }
            }
        }

        /*protected void btnUnesi_Click(object sender, EventArgs e)
        {
            //Sablon masterSablon = (Sablon)this.Master;
            string uploadFolder = Server.MapPath("~/img/upload/");
            if (FileUploadSlika.HasFile)
            {
                string naziv = TextBoxNaziv.Text;
                string fileName = FileUploadSlika.PostedFile.FileName;
                string novoIme = String.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyy"), fileName);
                string tipFajla = FileUploadSlika.PostedFile.ContentType;
                int velicina = FileUploadSlika.PostedFile.ContentLength;

                string konekcijaStr = WebConfigurationManager.ConnectionStrings["restoranBaza"].ConnectionString;
                string insertQuery = "INSERT INTO slike(naziv,putanja) VALUES(@naziv,@putanja)";
                SqlConnection sqlConn = new SqlConnection(konekcijaStr);
                SqlCommand sqlComm = new SqlCommand(insertQuery);
                sqlComm.Parameters.AddWithValue("@naziv", naziv);
                sqlComm.Parameters.AddWithValue("@putanja", "~/img/upload/" + novoIme);
                sqlComm.Connection = sqlConn;
                //sqlComm.CommandType = CommandType.StoredProcedure;
                try
                {
                    FileUploadSlika.SaveAs(uploadFolder + novoIme);
                    sqlComm.Connection.Open();
                    sqlComm.ExecuteNonQuery();
                    //masterSablon.ispisPoruke(String.Format("Uspesno ste uneli sliku pod nazivom {0}", naziv), "alert-success");
                    TextBoxNaziv.Text = string.Empty;
                }
                catch (Exception ex)
                {
                    //masterSablon.ispisPoruke(ex.Message, "alert-danger");
                }
                finally
                {
                    sqlComm.Connection.Close();
                }
            }
        }*/
    }
}
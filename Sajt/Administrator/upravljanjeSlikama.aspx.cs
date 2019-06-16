using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sajt.BusinessLayer;

namespace Sajt.Administrator
{
    public partial class upravljanjeSlikama : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string naziv = this.TextBox1.Text;
            FileUpload slika = (FileUpload)this.FileUploadEditSlika;

            int id = Convert.ToInt32(button.CommandArgument.ToString());

            if (slika.HasFile)
            {
                string fileName = slika.PostedFile.FileName;
                string novoIme = String.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyyHHmmss"), fileName);
                string putanjaSlika = Server.MapPath("~/img/upload/") + novoIme;
                slika.SaveAs(putanjaSlika);

                OpSlikeUpdate op = new OpSlikeUpdate();
                op.Slike = new SlikeDb { IdSlika = id, Naziv = naziv, Putanja = "~/img/upload/" + novoIme };
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
        }
        protected void btnIzmeni_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button taster = (Button)sender;
            int id = Convert.ToInt32(taster.CommandArgument.ToString());
            this.btnPotvrdi.CommandArgument = id.ToString();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Button taster = (Button)sender;
            int idSlika = Convert.ToInt32(taster.CommandArgument);
            OpSlikaDelete op = new OpSlikaDelete();
            op.IdSlika = idSlika;
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            DbItem[] items = obj.DbItems;
            SlikeDb[] slike = items.Cast<SlikeDb>().ToArray();

            GridView1.DataSource = slike;
            GridView1.DataBind();
        }
    }
}
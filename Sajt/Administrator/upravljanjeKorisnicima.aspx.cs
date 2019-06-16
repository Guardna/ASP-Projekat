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
    public partial class upravljanjeKorisnicima : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpKorisnikSelect op = new OpKorisnikSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                KorisnikDb[] korisnici = items.Cast<KorisnikDb>().ToArray();

                GridView1.DataSource = korisnici;
                GridView1.DataBind();
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button taster = (Button)sender;
            int idKorisnik = Convert.ToInt32(taster.CommandArgument);
            OpKorisnikDelete op = new OpKorisnikDelete();
            op.IdKorisnik = idKorisnik;
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            DbItem[] items = obj.DbItems;
            KorisnikDb[] restoran = items.Cast<KorisnikDb>().ToArray();

            GridView1.DataSource = restoran;
            GridView1.DataBind();
        }
        protected void btnIzmeni_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button taster = (Button)sender;
            string[] arg = taster.CommandArgument.ToString().Split(';');
            TextBox4.Text = arg[0];
            TextBox1.Text = arg[1];
            TextBox2.Text = arg[2];
            TextBox3.Text = arg[3];
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int idKorisnik = Int32.Parse(TextBox4.Text);
            string ime = TextBox1.Text;
            string prezime = TextBox2.Text;
            string mail = TextBox3.Text;
            OpKorisnikUpdate op = new OpKorisnikUpdate();
            op.Korisnik = new KorisnikDb { IdKorisnik = idKorisnik, Ime = ime, Prezime = prezime, Mail = mail };
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                KorisnikDb[] korisnici = items.Cast<KorisnikDb>().ToArray();

                GridView1.DataSource = korisnici;
                GridView1.DataBind();
            }
        }
    }
}
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
    public partial class dodavanjeKorisnika : System.Web.UI.Page
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

        protected void btnUnesi_Click(object sender, EventArgs e)
        {
            string ime = TextBox1.Text;
            string prezime = TextBox2.Text;
            string mail = TextBox3.Text;

            OpKorisnikInsert op = new OpKorisnikInsert();
            op.Korisnik = new KorisnikDb { Ime = ime, Prezime = prezime, Mail = mail };
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
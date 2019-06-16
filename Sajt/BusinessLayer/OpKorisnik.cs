using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;
using Sajt.DataLayer;

namespace Sajt.BusinessLayer
{
    public class KorisnikDb : DbItem
    {
        #region Podaci
        private int idKorisnik; // {get; set;} i private
        private string ime;
        private string prezime;
        private string mail;
        //private int idvesti; {get; set;}
        #endregion
        #region Svojstva
        public int IdKorisnik
        {
            get { return idKorisnik; }
            set { idKorisnik = value; }
        }
        public string Ime
        {
            get { return ime; }
            set { ime = value; }
        }
        public string Prezime
        {
            get { return prezime; }
            set { prezime = value; }
        }
        public string Mail
        {
            get { return mail; }
            set { mail = value; }
        }
        #endregion
        public override string ToString()
        {
            return this.idKorisnik.ToString() + " " + this.Ime + " " + this.Prezime + " " + this.mail;
        }
    }
    public class KriterijumKorisnik : KriterijumZaSelekciju
    {
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Mail { get; set; }
    }

    public abstract class OpKorisnikBase : Operacija
    {
        public KriterijumKorisnik Kriterijum { get; set; }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            IEnumerable<KorisnikDb> ieKorisnici;
            if (Kriterijum != null)
                //((this.Kriterijum == null) || (this.Kriterijum.Ime == null)
                 //&& (this.Kriterijum.Prezime == null) && (this.Kriterijum.Mail == null))
                ieKorisnici = from Korisnici in entiteti.korisnicis
                              //where this.Kriterijum.idvesti == Korisnici.idvesti -- slozena selekcija
                           select new KorisnikDb
                           {
                               IdKorisnik = Korisnici.idkorisnik,
                               Ime = Korisnici.ime,
                               Prezime = Korisnici.prezime,
                               Mail = Korisnici.mail//,
                               //idvesti = korisnici.idvesti
                           };
            else
                ieKorisnici = from Korisnici in entiteti.korisnicis
                           //where ((this.Kriterijum.Ime == null) ? true :
                                        //this.Kriterijum.Ime == Korisnici.ime) &&
                                 //((this.Kriterijum.Prezime == null) ? true :
                                        //this.Kriterijum.Prezime == Korisnici.prezime) &&
                                 //((this.Kriterijum.Mail == null) ? true :
                                        //this.Kriterijum.Mail == Korisnici.mail)
                           select new KorisnikDb
                           {
                               IdKorisnik = Korisnici.idkorisnik,
                               Ime = Korisnici.ime,
                               Prezime = Korisnici.prezime,
                               Mail = Korisnici.mail
                           };
            KorisnikDb[] niz = ieKorisnici.ToArray();


            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
    public class OpKorisnikSelect : OpKorisnikBase
    {
    }
    public class OpKorisnikInsert : OpKorisnikBase
    {
        private KorisnikDb korisnik;
        public KorisnikDb Korisnik
        {
            get { return korisnik; }
            set { korisnik = value; }
        }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.korisnik != null) && !string.IsNullOrEmpty(this.korisnik.Ime) &&
                !string.IsNullOrEmpty(this.korisnik.Prezime) &&
                !string.IsNullOrEmpty(this.korisnik.Mail))
                entiteti.KorisnikInsert(this.korisnik.Ime, this.korisnik.Prezime, this.korisnik.Mail);
            return base.izvrsi(entiteti);
        }
    }
    public class OpKorisnikUpdate : OpKorisnikBase
    {
        private KorisnikDb korisnik;
        public KorisnikDb Korisnik
        {
            get { return korisnik; }
            set { korisnik = value; }
        }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.korisnik != null) && (this.Korisnik.IdKorisnik) > 0 &&
                !string.IsNullOrEmpty(this.korisnik.Ime) &&
                !string.IsNullOrEmpty(this.korisnik.Prezime) &&
                !string.IsNullOrEmpty(this.korisnik.Mail))
                entiteti.KorisnikUpdate(this.Korisnik.IdKorisnik, this.Korisnik.Ime, this.Korisnik.Prezime, this.Korisnik.Mail);
            return base.izvrsi(entiteti);
        }

    }
    public class OpKorisnikDelete : OpKorisnikBase
    {
        private int idKorisnik;
        public int IdKorisnik
        {
            get { return idKorisnik; }
            set { idKorisnik = value; }
        }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if (this.IdKorisnik > 0)
                entiteti.KorisnikDelete(this.IdKorisnik);
            return base.izvrsi(entiteti);
        }

    }
}

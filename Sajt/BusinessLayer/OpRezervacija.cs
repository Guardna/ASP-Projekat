using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sajt.DataLayer;

namespace Sajt.BusinessLayer
{
    public class RezervacijaDb : DbItem
    {
        #region Podaci
        private int idRez;
        private string ime;
        private string telefon;
        private string datum;
        private string vreme;
        #endregion
        #region Svojstva
        public int IdRez
        {
            get { return idRez; }
            set { idRez = value; }
        }
        public string Ime
        {
            get { return ime; }
            set { ime = value; }
        }
        public string Telefon
        {
            get { return telefon; }
            set { telefon = value; }
        }
        public string Datum
        {
            get { return datum; }
            set { datum = value; }
        }
        public string Vreme
        {
            get { return vreme; }
            set { vreme = value; }
        }
        #endregion
        public override string ToString()
        {
            return this.idRez.ToString() + " " + this.ime + " " + this.telefon + " " + this.datum + " " + this.vreme;
        }
    }
    public class KriterijumRezervacija : KriterijumZaSelekciju
    {
        public string Ime { get; set; }
        public string Telefon { get; set; }
        public string Datum { get; set; }
        public string Vreme { get; set; }
    }

    public abstract class OpRezervacijaBase : Operacija
    {
        public KriterijumRezervacija Kriterijum { get; set; }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            IEnumerable<RezervacijaDb> ierezervacija;
            if ((this.Kriterijum == null) || (this.Kriterijum.Ime == null)
                 && (this.Kriterijum.Telefon == null) && (this.Kriterijum.Datum == null)
                && (this.Kriterijum.Vreme == null))
                ierezervacija = from Rezervacija in entiteti.rezervacijas
                              select new RezervacijaDb
                              {
                                  IdRez = Rezervacija.idrez,
                                  Ime = Rezervacija.ime,
                                  Telefon = Rezervacija.telefon,
                                  Datum = Rezervacija.datum,
                                  Vreme = Rezervacija.vreme
                              };
            else
                ierezervacija = from Rezervacija in entiteti.rezervacijas
                              where ((this.Kriterijum.Ime == null) ? true :
                                           this.Kriterijum.Ime == Rezervacija.ime) &&
                                    ((this.Kriterijum.Telefon == null) ? true :
                                           this.Kriterijum.Telefon == Rezervacija.telefon) &&
                                    ((this.Kriterijum.Datum == null) ? true :
                                           this.Kriterijum.Datum == Rezervacija.datum) &&
                                    ((this.Kriterijum.Vreme == null) ? true :
                                           this.Kriterijum.Vreme == Rezervacija.vreme)
                              select new RezervacijaDb
                              {
                                  IdRez = Rezervacija.idrez,
                                  Ime = Rezervacija.ime,
                                  Telefon = Rezervacija.telefon,
                                  Datum = Rezervacija.datum,
                                  Vreme = Rezervacija.vreme
                              };
            RezervacijaDb[] niz = ierezervacija.ToArray();


            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
    public class OpRezervacijaSelect : OpRezervacijaBase
    {
    }
    public class OpRezervacijaInsert : OpRezervacijaBase
    {
        private RezervacijaDb rezervacija;
        public RezervacijaDb Rezervacija
        {
            get { return rezervacija; }
            set { rezervacija = value; }
        }

        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.rezervacija != null) && !string.IsNullOrEmpty(this.rezervacija.Ime) &&
                !string.IsNullOrEmpty(this.rezervacija.Telefon) &&
                !string.IsNullOrEmpty(this.rezervacija.Datum) &&
                !string.IsNullOrEmpty(this.rezervacija.Vreme))
                entiteti.RezervacijaInsert(this.rezervacija.Ime, this.rezervacija.Telefon, this.rezervacija.Datum, this.rezervacija.Vreme);
            return base.izvrsi(entiteti);
        }
    }
    public class OpRezervacijaUpdate : OpRezervacijaBase
    {
        private RezervacijaDb rezervacija;
        public RezervacijaDb Rezervacija
        {
            get { return rezervacija; }
            set { rezervacija = value; }
        }

        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.rezervacija != null) && (this.rezervacija.IdRez) > 0 &&
                !string.IsNullOrEmpty(this.rezervacija.Ime) &&
                !string.IsNullOrEmpty(this.rezervacija.Telefon) &&
                !string.IsNullOrEmpty(this.rezervacija.Datum) &&
                !string.IsNullOrEmpty(this.rezervacija.Vreme))
                entiteti.RezervacijaUpdate(this.rezervacija.IdRez, this.rezervacija.Ime, this.rezervacija.Telefon, this.rezervacija.Datum, this.rezervacija.Vreme);
            return base.izvrsi(entiteti);
        }

    }
    public class OpRezervacijaDelete : OpRezervacijaBase
    {
        private int idRez;
        public int IdRez
        {
            get { return idRez; }
            set { idRez = value; }
        }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if (this.idRez > 0)
                entiteti.RezervacijaDelete(this.idRez);
            return base.izvrsi(entiteti);
        }

    }
}
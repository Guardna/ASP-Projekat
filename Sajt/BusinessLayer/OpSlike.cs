using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sajt.DataLayer;

namespace Sajt.BusinessLayer
{
    public class SlikeDb : DbItem
    {
        #region Podaci
        private int idSlika;
        private string naziv;
        private string putanja;
        #endregion
        #region Svojstva
        public int IdSlika
        {
            get { return idSlika; }
            set { idSlika = value; }
        }
        public string Naziv
        {
            get { return naziv; }
            set { naziv = value; }
        }
        public string Putanja
        {
            get { return putanja; }
            set { putanja = value; }
        }
        #endregion
        public override string ToString()
        {
            return this.idSlika.ToString() + " " + this.naziv + " " + this.putanja;
        }
    }

    public class KriterijumSlika : KriterijumZaSelekciju
    {
        public string Naziv { get; set; }
        public string Putanja { get; set; }
    }

    public abstract class OpSlikeBase : Operacija
    {
        public KriterijumSlika Kriterijum { get; set; }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            IEnumerable<SlikeDb> ieslike;
            if ((this.Kriterijum == null) || (this.Kriterijum.Naziv == null)
                 && (this.Kriterijum.Putanja == null))
                ieslike = from Slike in entiteti.slikes
                              select new SlikeDb
                              {
                                  IdSlika = Slike.idslika,
                                  Naziv = Slike.naziv,
                                  Putanja = Slike.putanja
                              };
            else
                ieslike = from Slike in entiteti.slikes
                              where ((this.Kriterijum.Naziv == null) ? true :
                                           this.Kriterijum.Naziv == Slike.naziv) &&
                                    ((this.Kriterijum.Putanja == null) ? true :
                                           this.Kriterijum.Putanja == Slike.putanja)
                              select new SlikeDb
                              {
                                  IdSlika = Slike.idslika,
                                  Naziv = Slike.naziv,
                                  Putanja = Slike.putanja
                              };
            SlikeDb[] niz = ieslike.ToArray();


            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
    public class OpSlikeSelect : OpSlikeBase
    {
    }
    public class OpSlikeInsert : OpSlikeBase
    {
        private SlikeDb slike;
        public SlikeDb Slike
        {
            get { return slike; }
            set { slike = value; }
        }  
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.slike != null) && !string.IsNullOrEmpty(this.slike.Naziv) &&
                !string.IsNullOrEmpty(this.slike.Putanja))
                entiteti.SlikaInsert(this.slike.Naziv, this.slike.Putanja);
            return base.izvrsi(entiteti);
        }
    }
    public class OpSlikeUpdate : OpSlikeBase
    {
        private SlikeDb slike;
        public SlikeDb Slike
        {
            get { return slike; }
            set { slike = value; }
        }
        
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.slike != null) && (this.slike.IdSlika) > 0 &&
                !string.IsNullOrEmpty(this.slike.Naziv) &&
                !string.IsNullOrEmpty(this.slike.Putanja))
                entiteti.SlikaUpdate(this.slike.IdSlika, this.slike.Naziv, this.slike.Putanja);
            return base.izvrsi(entiteti);
        }
    }
    public class OpSlikaDelete : OpSlikeBase
    {
        private int idSlika;
        public int IdSlika
        {
            get { return idSlika; }
            set { idSlika = value; }
        }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if (this.idSlika > 0)
                entiteti.SlikaDelete(this.idSlika);
            return base.izvrsi(entiteti);   
        }

    }
}
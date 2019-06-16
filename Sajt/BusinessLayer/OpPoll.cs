using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sajt.DataLayer;

namespace Sajt.BusinessLayer
{
    public class PollDb : DbItem
    {
        #region Podaci
        private int idPoll;
        private string naziv;
        private int glasovi;
        #endregion
        #region Svojstva
        public int IdPoll
        {
            get { return idPoll; }
            set { idPoll = value; }
        }
        public string Naziv
        {
            get { return naziv; }
            set { naziv = value; }
        }
        public int Glasovi
        {
            get { return glasovi; }
            set { glasovi = value; }
        }
        #endregion
        public override string ToString()
        {
            return this.idPoll.ToString() + " " + this.naziv + " " + this.glasovi.ToString();
        }
    }

    public class KriterijumPoll : KriterijumZaSelekciju
    {
        public string Naziv { get; set; }
        public int Glasovi { get; set; }
    }

    public abstract class OpPollBase : Operacija
    {
        public KriterijumPoll Kriterijum { get; set; }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            IEnumerable<PollDb> iepoll;
            if ((this.Kriterijum == null) || (this.Kriterijum.Naziv == null))
                iepoll = from Poll in entiteti.polls
                          select new PollDb
                          {
                              IdPoll = Poll.idpoll,
                              Naziv = Poll.naziv,
                              Glasovi = Poll.glasovi
                          };
            else
                iepoll = from Poll in entiteti.polls
                          where ((this.Kriterijum.Naziv == null) ? true :
                                       this.Kriterijum.Naziv == Poll.naziv) &&
                                ((this.Kriterijum.Glasovi == null) ? true :
                                       this.Kriterijum.Glasovi == Poll.glasovi)
                          select new PollDb
                          {
                              IdPoll = Poll.idpoll,
                              Naziv = Poll.naziv,
                              Glasovi = Poll.glasovi
                          };
            PollDb[] niz = iepoll.ToArray();


            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
    public class OpPollSelect : OpPollBase
    {
    }
    public class OpPollInsert : OpPollBase
    {
        private PollDb poll;

        public PollDb Poll
        {
            get { return poll; }
            set { poll = value; }
        }
       
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.poll != null) && !string.IsNullOrEmpty(this.poll.Naziv) &&
                this.poll.Glasovi > 0)
                entiteti.PollInsert(this.poll.Naziv, this.poll.Glasovi);
            return base.izvrsi(entiteti);
        }
    }
    public class OpPollUpdate : OpPollBase
    {
        private PollDb poll;

        public PollDb Poll
        {
            get { return poll; }
            set { poll = value; }
        }
        
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.poll != null) && (this.poll.IdPoll) > 0 &&
                !string.IsNullOrEmpty(this.poll.Naziv) &&
                this.poll.Glasovi > 0)
                entiteti.PollUpdate(this.poll.IdPoll, this.poll.Naziv, this.poll.Glasovi);
            return base.izvrsi(entiteti);
        }
    }
    public class OpPollUpdateVotes : OpPollBase
    {
        private PollDb poll;

        public PollDb Poll
        {
            get { return poll; }
            set { poll = value; }
        }

        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.poll != null) && (this.poll.IdPoll) > 0 &&
                !string.IsNullOrEmpty(this.poll.Naziv) &&
                this.poll.Glasovi > 0)
                entiteti.PollUpdateVotes(this.poll.IdPoll, this.poll.Naziv, this.poll.Glasovi);
            return base.izvrsi(entiteti);
        }
    }
    public class OpPollDelete : OpPollBase
    {
        private int idPoll;

        public int IdPoll
        {
            get { return idPoll; }
            set { idPoll = value; }
        }
        
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if (this.idPoll > 0)
                entiteti.PollDelete(this.idPoll);
            return base.izvrsi(entiteti);
        }

    }
}
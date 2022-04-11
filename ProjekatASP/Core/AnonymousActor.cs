using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjekatASP.Core
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 2;

        public string Identity => "Anonymus";

        public IEnumerable<int> AllowedUseCases => new List<int> { 5 };
    }
}

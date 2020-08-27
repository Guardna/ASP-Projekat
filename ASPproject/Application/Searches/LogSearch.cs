using Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class LogSearch:PagedSearch
    {
        public DateTime Date { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public string UseCaseName { get; set; }
        public string Actor { get; set; }
    }
}

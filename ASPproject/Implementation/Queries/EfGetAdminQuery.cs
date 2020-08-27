using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using DataAccess;
using Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EfGetAdminQuery : IGetAdminQuery
    {
        private readonly ProjekatContext context;
        private readonly IMapper _mapper;

        public EfGetAdminQuery(ProjekatContext context, IMapper mapper)
        {
            this.context = context;
            _mapper = mapper;
        }


        public int Id => 4;

        public string Name => "Log search.";

        public PagedResponse<UseCaseLogDto> Execute(LogSearch search)
        {
            var query = context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
            {
                query = query.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }

            if (search.DateFrom != DateTime.MinValue)
            {
                query = query.Where(x => x.Date>=search.DateFrom.Date);
            }
            if (search.DateTo != DateTime.MinValue && search.DateTo >= search.DateFrom)
            {
                query = query.Where(x => x.Date <= search.DateTo.Date);
            }

            return query.Paged<UseCaseLogDto, Domain.UseCaseLog>(search, _mapper);
        }
    }
}

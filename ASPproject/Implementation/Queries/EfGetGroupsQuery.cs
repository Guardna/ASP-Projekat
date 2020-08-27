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
    public class EfGetGroupsQuery : IGetGroupsQuery
    {
        private readonly ProjekatContext context;
        private readonly IMapper _mapper;

        public EfGetGroupsQuery(ProjekatContext context, IMapper mapper)
        {
            this.context = context;
            _mapper = mapper;
        }

        public int Id => 4;

        public string Name => "Group search.";

        public PagedResponse<GroupDto> Execute(GroupSearch search)
        {
            var query = context.Groups.AsQueryable();

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Paged<GroupDto, Domain.Group>(search, _mapper);
        }
    }
}

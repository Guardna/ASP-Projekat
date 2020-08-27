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
    public class EfGetUsersQuery : IGetUsersQuery
    {
        private readonly ProjekatContext context;
        private readonly IMapper _mapper;

        public EfGetUsersQuery(ProjekatContext context, IMapper mapper)
        {
            this.context = context;
            _mapper = mapper;
        }


        public int Id => 4;

        public string Name => "User search.";

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var query = context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }

            return query.Paged<UserDto, Domain.User>(search, _mapper);
        }
    }
}

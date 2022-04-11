using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using DataAccess;
using Domain;
using Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EfGetPostsQuery : IGetPostsQuery
    {
        private readonly ProjekatContext context;
        private readonly IMapper _mapper;

        public EfGetPostsQuery(ProjekatContext context, IMapper mapper)
        {
            this.context = context;
            _mapper = mapper;
        }

        public int Id => 5;

        public string Name => "Post search.";

        public PagedResponse<PostDto> Execute(PostSearch search)
        {
            var query = context.Posts.AsQueryable();

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Paged<PostDto, Post>(search, _mapper);
        }
    }
}

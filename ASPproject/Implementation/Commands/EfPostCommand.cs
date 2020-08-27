using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfPostCommand : IPostCommand
    {

        private readonly ProjekatContext _context;

        public EfPostCommand(ProjekatContext context)
        {
            _context = context;
        }

        public int Id => 4;

        public string Name => "Create Post";

        public void Execute(PostDto request)
        {
            var post = new Post
            {
                Name = request.Name
            };

            _context.Posts.Add(post);

            _context.SaveChanges();

        }

    }
}

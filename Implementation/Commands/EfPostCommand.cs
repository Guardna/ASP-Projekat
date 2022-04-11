using Application;
using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http;
using System.Text;

namespace Implementation.Commands
{
    public class EfPostCommand : IPostCommand
    {

        private readonly ProjekatContext _context;
        private readonly IApplicationActor _actor;
        public EfPostCommand(ProjekatContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 4;

        public string Name => "Create Post";

        public void Execute(PostDto request)
        {

            var post = new Post
            {
                Name = request.Name,
                UserId = _actor.Id,
                GroupId = request.GroupId,
                Description = request.Description
            };

            var pp=_context.Posts.Add(post);

            pp.Context.SaveChanges();

            _context.Photos.Add(new Photo
            {
                PostId = pp.Entity.Id,
                Name = request.ImageName,
                Path=request.Path
            });
            _context.SaveChanges();
        }
   

    }
}

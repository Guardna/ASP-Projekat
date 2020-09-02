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
    public class EfCommentCommand : IPostComment
    {

        private readonly ProjekatContext _context;
        private readonly IApplicationActor _actor;
        public EfCommentCommand(ProjekatContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 4;

        public string Name => "Create Comment";

        public void Execute(CommentDto request)
        {

            var comm = new Comment
            {
                PostId = request.PostId,
                UserId = _actor.Id,
                Content = request.Content
            };

            _context.Comments.Add(comm);

            _context.SaveChanges();

        }
   

    }
}

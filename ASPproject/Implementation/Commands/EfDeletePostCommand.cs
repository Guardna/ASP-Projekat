using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeletePostCommand : IDeletePostCommand
    {
        private readonly ProjekatContext _context;

        public EfDeletePostCommand(ProjekatContext context)
        {
            this._context = context;
        }

        public int Id => 4;

        public string Name => "Deleting Post";

        public void Execute(int request)
        {
            var post = _context.Posts.Find(request);
            var pid = _context.Photos.Where(x => x.PostId.Equals(request));
            var poto = pid.First();

            if (post == null)
            {
                throw new EntityNotFoundException(request, typeof(Post));
            }

            _context.Photos.Remove(poto);
            _context.Posts.Remove(post);

            _context.SaveChanges();
        }
    }
}

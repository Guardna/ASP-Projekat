using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly ProjekatContext _context;

        public EfDeleteUserCommand(ProjekatContext context)
        {
            this._context = context;
        }

        public int Id => 3;

        public string Name => "Deleting User";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }

            _context.Users.Remove(user);

            _context.SaveChanges();
        }
    }
}

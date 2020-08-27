using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteGroupCommand : IDeleteGroupCommand
    {
        private readonly ProjekatContext _context;

        public EfDeleteGroupCommand(ProjekatContext context)
        {
            this._context = context;
        }

        public int Id => 3;

        public string Name => "Deleting group";

        public void Execute(int request)
        {
            var group = _context.Groups.Find(request);

            if(group == null)
            {
                throw new EntityNotFoundException(request, typeof(Group));
            }

            _context.Groups.Remove(group);

            _context.SaveChanges();
        }
    }
}

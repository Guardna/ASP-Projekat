using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateGroupCommand : ICreateGroupCommand
    {

        private readonly ProjekatContext _context;

        public EfCreateGroupCommand(ProjekatContext context)
        {
            _context = context;
        }

        public int Id => 4;

        public string Name => "Create New Group";

        public void Execute(GroupDto request)
        {
            var group = new Group
            {
                Name = request.Name
            };

            _context.Groups.Add(group);

            _context.SaveChanges();

        }

    }
}

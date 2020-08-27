using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Implementation.Validators
{
    public class CreatePostValidator: AbstractValidator<PostDto>
    {
        private readonly ProjekatContext _context;
        public CreatePostValidator(ProjekatContext context)
        {
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name is required parameter.")
                .Must(name => !_context.Posts.Any(p => p.Name == name))
                .WithMessage(p => $"Post with the name of {p.Name} already exists in database.");

        }
    }
}

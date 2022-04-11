using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.DataTransfer;

namespace Implementation.Validators
{
    public class CreatePhotoValidator : AbstractValidator<PhotoDto>
    {
        private readonly ProjekatContext _context;
        public CreatePhotoValidator(ProjekatContext context)
        {
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name is required parameter.");
            RuleFor(x => x.Path)
                .NotEmpty()
                .WithMessage("Photo is required parameter.")
                .Must(path => !_context.Photos.Any(p => p.Path == path))
                .WithMessage(p => $"Path with the name of {p.Path} already exists in database.");

        }
    }
}

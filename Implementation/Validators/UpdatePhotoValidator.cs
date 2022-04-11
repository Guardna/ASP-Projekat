using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Implementation.Validators
{
    public class UpdatePhotoValidator : AbstractValidator<PhotoDto>
    {
        public UpdatePhotoValidator(ProjekatContext context)
        {
            RuleFor(x => x.Path)
                .NotEmpty()
                .WithMessage("Path is required parameter.")
                .Must((dto, path) => !context.Photos.Any(p => p.Path == path && p.Id != dto.Id))
                .WithMessage(p => $"Path already exists in database.");

        }
    }
}

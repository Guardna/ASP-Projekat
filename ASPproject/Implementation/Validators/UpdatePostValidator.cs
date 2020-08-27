using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Implementation.Validators
{
    public class UpdatePostValidator : AbstractValidator<PostDto>
    {
        public UpdatePostValidator(ProjekatContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name is required parameter.")
                .Must((dto, name) => !context.Posts.Any(p => p.Name == name && p.Id != dto.Id))
                .WithMessage(p => $"Post with the name of {p.Name} already exists in database.");

        }
    }
}

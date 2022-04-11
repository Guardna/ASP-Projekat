using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Implementation.Validators
{
    public class UpdateUserValidator : AbstractValidator<UserDto>
    {
        public UpdateUserValidator(ProjekatContext context)
        {
            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("Email is required parameter.")
                .Must((dto, email) => !context.Users.Any(p => p.Email == email && p.Id != dto.Id))
                .WithMessage(p => $"Email with the name of {p.Email} already exists in database.");

        }
    }
}

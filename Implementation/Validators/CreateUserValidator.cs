using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Implementation.Validators
{
    public class CreateUserValidator : AbstractValidator<UserDto>
    {
        private readonly ProjekatContext _context;
        public CreateUserValidator(ProjekatContext context)
        {
            _context = context;

            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("Email is required parameter.")
                .Must(email => !_context.Users.Any(p => p.Email == email))
                .WithMessage(p => $"Email with the name of {p.Email} already exists in database.");

        }
    }
}

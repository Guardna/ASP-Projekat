using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using Application.DataTransfer;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        
        public RegisterUserValidator(ProjekatContext context)
        {
            RuleFor(x => x.FirstName).NotEmpty();
            RuleFor(x => x.LastName).NotEmpty();
            RuleFor(x => x.Password)
                .NotEmpty()
                .MinimumLength(6);


            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .Must(x => !context.Users.Any(user => user.Email == x))
                .WithMessage("Email is already taken.");
        }
    }
}

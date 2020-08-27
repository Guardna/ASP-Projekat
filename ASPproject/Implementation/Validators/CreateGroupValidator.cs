using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using Application.DataTransfer;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateGroupValidator : AbstractValidator<GroupDto>
    {

        public CreateGroupValidator(ProjekatContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .Must(name => !context.Groups.Any(g => g.Name == name))
                .WithMessage("Group name must be unique"); 
        }
    }
}

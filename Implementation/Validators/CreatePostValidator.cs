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
    public class CreatePostValidator : AbstractValidator<PostDto>
    {

        public CreatePostValidator(ProjekatContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .Must(name => !context.Posts.Any(g => g.Name == name))
                .WithMessage("Post name must be unique"); 
        }
    }
}

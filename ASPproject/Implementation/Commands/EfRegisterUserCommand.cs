using FluentValidation;
using Application.Commands;
using Application.DataTransfer;
using Application.Email;
using DataAccess;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        public int Id => 4;

        public string Name => "User Registration";

        private readonly ProjekatContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;

        public EfRegisterUserCommand(ProjekatContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var kor=_context.Users.Add(new Domain.User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Password = request.Password,
                Email = request.Email
            });
            kor.Context.SaveChanges();
           
            _context.UserUserCase.Add(new Domain.UserUserCase
            {
                UserId = kor.Entity.Id,
                UseCaseId = 1
            });
            _context.UserUserCase.Add(new Domain.UserUserCase
            {
                UserId = kor.Entity.Id,
                UseCaseId = 4
            });

            _context.SaveChanges();


            _sender.Send(new SendEmailDto
            {
                Content = "<h1>Successfull registration!</h1>",
                SendTo = request.Email,
                Subject = "Registration"
            });
        }
    }
}

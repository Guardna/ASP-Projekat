using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjekatASP.Core
{
    public static class ApiExtensions
    {
        public static UnprocessableEntityObjectResult AsUnprocessableEntity(this ValidationResult result)
        {
            var errorMessages = result.Errors.Select(x => new ClientError
            {
                ErrorMessage = x.ErrorMessage,
                PropertyName = x.PropertyName
            });

            return new UnprocessableEntityObjectResult(new
            {
                Errors = errorMessages
            });
        }
    }
}

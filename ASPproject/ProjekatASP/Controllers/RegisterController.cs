using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Application;
using Application.Commands;
using Application.DataTransfer;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public RegisterController(UseCaseExecutor executor) => _executor = executor;


        // POST: api/Register
        [HttpPost]
        public void Post(
            [FromBody] RegisterUserDto dto, 
            [FromServices] IRegisterUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }
    }
}

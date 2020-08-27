using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;

namespace ProjekatASP.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;

        public AdminController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/Test
        [HttpGet]
        public IActionResult Get(
            [FromQuery] LogSearch search,
            [FromServices] IGetAdminQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET: api/Test/5
        [HttpGet("{id}", Name = "GetAdmin")]
        public string Get(int id)
        {
            return "value";
        }

    }
}

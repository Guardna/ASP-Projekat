using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DataAccess;
using Domain;
using Application.DataTransfer;
using Application;
using Application.Queries;
using Application.Searches;
using Application.Commands;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Implementation.Validators;
using ProjekatASP.Core;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjekatASP.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ProjekatContext _context;
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        private readonly IMapper _mapper;

        public UserController(IMapper mapper, IApplicationActor actor, UseCaseExecutor executor)
        {
            _context = new ProjekatContext();
            this.actor = actor;
            this.executor = executor;
            _mapper = mapper;
        }

        // GET: api/<GroupController>
        [HttpGet]
        public IActionResult Get(
            [FromQuery] UserSearch search,
            [FromServices] IGetUsersQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<GroupController>/5
        [HttpGet("{id}", Name = "GetUsers")]
        public IActionResult Get(int id)
        {

            var user = _context.Users.Find(id);

            if (user == null)
            {
                return NotFound();
            }


            return Ok(_mapper.Map<UserDto>(user));
        }
        // PUT api/<GroupController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserDto dto, [FromServices] UpdateUserValidator validator)
        {
            dto.Id = id;

            var user = _context.Users.Find(id);

            if (user == null)
            {
                return NotFound();
            }

            var result = validator.Validate(dto);

            if (!result.IsValid)
            {
                return result.AsUnprocessableEntity();
            }

            _mapper.Map(dto, user);


            try
            {
                _context.SaveChanges();
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

     
    }
}
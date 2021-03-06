using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DataAccess;
using Domain;
using Microsoft.AspNetCore.Http;
using AutoMapper;
using ProjekatASP.Core;
using FluentValidation;
using Implementation.Validators;
using Application.DataTransfer;
using Application.Commands;
using Application;
using Application.Queries;
using Application.Searches;
using System.IO;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjekatASP.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly CreatePostValidator _validator;
        private readonly ProjekatContext _context;
        private readonly IMapper _mapper;
        private readonly UseCaseExecutor _executor;


        public PostController(IMapper mapper, CreatePostValidator validator, ProjekatContext context, UseCaseExecutor executor)
        {
            _context =context;
            _mapper = mapper;
            _validator = validator;
            _executor = executor;
        }

        // GET: api/<GroupController>
        [HttpGet]
        public IActionResult Get(
            [FromQuery] PostSearch search,
            [FromServices] IGetPostsQuery query)
        {
            try
            {
                return Ok(_executor.ExecuteQuery(query, search));
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }


        // GET api/<GroupController>/5
        [HttpGet("{id}", Name = "GetPosts")]
        public IActionResult Get(int id)
        {

            var post = _context.Posts.Find(id);

            if (post == null)
            {
                return NotFound();
            }


            return Ok(_mapper.Map<PostDto>(post));
        }
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] PostDto dto, [FromServices] UpdatePostValidator validator)
        {
            dto.Id = id;

            var post = _context.Posts.Find(id);

            if (post == null)
            {
                return NotFound();
            }

            var result = validator.Validate(dto);

            if (!result.IsValid)
            {
                return result.AsUnprocessableEntity();
            }

            _mapper.Map(dto, post);


            try
            {
                _context.SaveChanges();
                return NoContent();
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        // POST api/<GroupController>
        [Authorize]
        [HttpPost]
        public void Post(
            [FromForm] PostDto dto,
            [FromServices] IPostCommand command)
        {
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.Image.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            dto.Path = path;
            dto.ImageName = newFileName;

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.Image.CopyTo(fileStream);
            }

            _executor.ExecuteCommand(command, dto);
        }
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePostCommand command)
        {
             _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}

       





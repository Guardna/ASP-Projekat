using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DataAccess;
using Microsoft.AspNetCore.Http;
using AutoMapper;
using Domain;
using Application.DataTransfer;
using Application.Commands;
using Application;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjekatASP.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {

        private readonly ProjekatContext _context;
        private readonly IMapper _mapper;
        private readonly UseCaseExecutor executor;
        public CommentController()
        {
            _context = new ProjekatContext();
        }

        public CommentController(IMapper mapper, ProjekatContext context, UseCaseExecutor executor)
        {
            _context = context;
            _mapper = mapper;
            this.executor = executor;
        }

        // POST api/<GroupController>

        [HttpPost]
        public void Post([FromBody] CommentDto dto,
            [FromServices] IPostComment command)
        {

                executor.ExecuteCommand(command, dto);

        }


        // DELETE api/<GroupController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var post = _context.Comments.Find(id);

            if (post == null)
            {
                return NotFound();
            }

            post.IsDeleted = true;
            post.IsActive = false;
            post.DeletedAt = DateTime.Now;

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
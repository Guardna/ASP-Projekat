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

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProjekatASP.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {

        private readonly ProjekatContext _context;
        private readonly IMapper _mapper;
        public CommentController()
        {
            _context = new ProjekatContext();
        }

        public CommentController(IMapper mapper, ProjekatContext context)
        {
            _context = context;
            _mapper = mapper;
        }

        // POST api/<GroupController>
        [HttpPost]
        public IActionResult Post([FromBody] CommentDto dto)
        {

            var comment = _mapper.Map<Comment>(dto);

            try
            {
                _context.Add(comment);
                _context.SaveChanges();
                return StatusCode(StatusCodes.Status201Created);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
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
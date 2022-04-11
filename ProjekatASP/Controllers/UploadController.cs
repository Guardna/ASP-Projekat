﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    { 
        public void Post([FromForm] UploadDto dto)
        {
 
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.Image.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.Image.CopyTo(fileStream);
            }

        }



    }

    public class UploadDto
    {
        public IFormFile Image { get; set; }
    }
}

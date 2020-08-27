using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class PostDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int UserId { get; set; }
        public string Description { get; set; }

        public int GroupId { get; set; }
    }

}

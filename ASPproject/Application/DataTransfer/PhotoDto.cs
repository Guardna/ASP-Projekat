using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class PhotoDto
    {
        public int PostId { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Photo:Entity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
        public int PostId { get; set; }
        public virtual Post Post { get; set; }

    
    }
}

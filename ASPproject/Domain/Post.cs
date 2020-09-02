using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Post : Entity
    {
        public string Name { get; set; }
        public int UserId { get; set; }
        public int GroupId { get; set; }
        public string Description { get; set; }
        public virtual User User { get; set; }
        public virtual Photo Photo { get; set; }
        public virtual Group Group { get; set; }
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
        public virtual ICollection<Photo> Photos { get; set; } = new HashSet<Photo>();
    }
}

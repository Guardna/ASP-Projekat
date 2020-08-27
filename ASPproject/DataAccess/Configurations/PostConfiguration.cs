using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class PostConfiguration : IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post> builder)
        {
            builder.Property(x => x.Name).HasMaxLength(30);
            builder.HasIndex(x => x.Name).IsUnique();
            builder.Property(x => x.Name).IsRequired();

            builder.HasMany(u => u.Comments).WithOne(o => o.Post).HasForeignKey(o => o.PostId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(k => k.Photos).WithOne(j => j.Post).HasForeignKey(j => j.PostId).OnDelete(DeleteBehavior.Restrict);



        }
    }
}

using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class UserConfiguration: IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasAlternateKey(x => x.Email);

            builder.Property(x => x.Email).HasMaxLength(30);
            builder.HasIndex(x => x.Email).IsUnique();
            builder.Property(x => x.Email).IsRequired();

            builder.Property(x => x.FirstName).IsRequired().HasMaxLength(30);
            builder.Property(x => x.LastName).IsRequired().HasMaxLength(30);

            builder.HasMany(u => u.Posts).WithOne(o => o.User).HasForeignKey(o => o.UserId).OnDelete(DeleteBehavior.Restrict);
  
        }
    }
}

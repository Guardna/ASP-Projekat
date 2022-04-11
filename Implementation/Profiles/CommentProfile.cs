using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain;

namespace Implementation.Profiles
{
    public class CommentProfile : Profile
    {
        public CommentProfile(){
            CreateMap<Comment, Application.DataTransfer.CommentDto>();
            CreateMap<Application.DataTransfer.CommentDto, Comment>();
            }
    }
}

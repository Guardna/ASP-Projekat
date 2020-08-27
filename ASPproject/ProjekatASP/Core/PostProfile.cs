using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain;
using ProjekatASP.Controllers;

namespace ProjekatASP.Core
{
    public class PostProfile : Profile
    {
        public PostProfile(){
            CreateMap<Post, Application.DataTransfer.PostDto>();
            CreateMap<Application.DataTransfer.PostDto, Post>();
            }
    }
}

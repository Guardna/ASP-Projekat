using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain;

namespace Implementation.Profiles
{
    public class PhotoProfile : Profile
    {
        public PhotoProfile(){
            CreateMap<Photo, Application.DataTransfer.PhotoDto>();
            CreateMap<Application.DataTransfer.PhotoDto, Photo>();
            }
    }
}

using AutoMapper;
using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Profiles
{
    public class AdminProfile : Profile
    {
        public AdminProfile()
        {
            CreateMap<Domain.UseCaseLog, UseCaseLogDto>();
        }
    }
}

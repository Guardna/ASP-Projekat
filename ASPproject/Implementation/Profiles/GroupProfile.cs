using AutoMapper;
using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Profiles
{
    public class GroupProfile : Profile
    {
        public GroupProfile()
        {
            CreateMap<Domain.Group, GroupDto>();
        }
    }
}

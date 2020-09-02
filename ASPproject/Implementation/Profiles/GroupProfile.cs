using AutoMapper;
using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;
using Domain;

namespace Implementation.Profiles
{
    public class GroupProfile : Profile
    {
        public GroupProfile()
        {
            CreateMap<Group, GroupDto>();
        }
    }
}

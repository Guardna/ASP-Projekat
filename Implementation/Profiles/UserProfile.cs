using Application.DataTransfer;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Profiles
{
    public class UserProfile:Profile
    {
        public UserProfile()
        {
            CreateMap<Domain.User, UserDto>();
        }
    }
}


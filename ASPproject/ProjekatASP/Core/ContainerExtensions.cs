using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Application;
using Application.Commands;
using Application.Queries;
using DataAccess;
using Implementation.Commands;
using Implementation.Queries;
using Implementation.Validators;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjekatASP.Core
{
    public static class ContainerExtensions
    {
        public static void AddUsesCases(this IServiceCollection services)
        {
            services.AddTransient<IGetGroupsQuery, EfGetGroupsQuery>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IGetAdminQuery, EfGetAdminQuery>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<ICreateGroupCommand, EfCreateGroupCommand>();
            services.AddTransient<IDeleteGroupCommand, EfDeleteGroupCommand>();
            services.AddTransient<IDeletePostCommand, EfDeletePostCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IPostCommand, EfPostCommand>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<CreatePostValidator>();
            services.AddTransient<UpdatePostValidator>();
            services.AddTransient<CreateUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<CreatePhotoValidator>();
            services.AddTransient<UpdatePhotoValidator>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<CreateGroupValidator>();
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });
        }

        public static void AddJwt(this IServiceCollection services, AppSettings appSettings)
        {
            services.AddTransient<JwtManager>(x =>
            {
                var context = x.GetService<ProjekatContext>();

                return new JwtManager(context, appSettings.JwtIssuer, appSettings.JwtSecretKey);
            });

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = appSettings.JwtIssuer,
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(appSettings.JwtSecretKey)),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }
    }
}

using Microsoft.EntityFrameworkCore.Internal;
using Application.Commands;
using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Implementation.Commands
{
    public class RawSqlCreateGroupCommand : ICreateGroupCommand
    {
        private readonly IDbConnection dbConnection;

        public RawSqlCreateGroupCommand(IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
        }

        public int Id => 2;

        public string Name => "Create group using raw SQL";

        public void Execute(GroupDto request)
        {
            var query = "INSERT INTO GROUPS (name) VALUES('" + request.Name + "')";
            var command = dbConnection.CreateCommand();
            command.CommandText = query;
            command.ExecuteNonQuery();
        }
    }
}

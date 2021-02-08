using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DeloitteNF.Areas.rootAPI
{
    public class LoginAccess
    {
        public static bool Login(string username, string password)
        {
            return username == "admin" && password == "pass";
        }
    }
}
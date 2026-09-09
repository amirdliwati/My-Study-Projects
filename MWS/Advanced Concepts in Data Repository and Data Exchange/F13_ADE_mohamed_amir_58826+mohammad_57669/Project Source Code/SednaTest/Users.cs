using System;
using System.Collections.Generic;
using System.Text;

namespace SednaTest
{
    static class Users
    {
        static string _UserName = "";
        public static string currentUser
        {
            get
            {
                return _UserName;
            }
        }
        public static bool isUser()
        {
            return currentUser == "user";
        }
        public static bool isAdmin()
        {
            return currentUser == "admin";
        }
        public static bool isSuperAdmin()
        {
            return currentUser == "superadmin";
        }

        public static bool CheckLogin(string userName, string userPassword)
        {
            bool b = false;
            switch(userName.ToLower())
            {
                case "user":
                case "admin":
                case "superadmin":
                    b = userPassword.ToLower() == userName.ToLower();
                    break;
            }
            if (b)
                _UserName = userName.ToLower();
            return b;
        }
    }
}

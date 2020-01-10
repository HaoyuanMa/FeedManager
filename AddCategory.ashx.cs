using Feed_Manager.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Claims;
using System.Security.Principal;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Feed_Manager.solve
{
    /// <summary>
    /// AddCategory 的摘要说明
    /// </summary>
    public class AddCategory : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
          
            CategoryContext categoryContext = new CategoryContext();
            String str = context.Request.QueryString["str"];
            String str2 = context.Request.QueryString["uname"];
            String type = context.Request.QueryString["type"];
            if(type.Equals("cty"))
            {
                Category category = new Category
                {
                    //Id = categoryContext.Configs.ToList<Config>()[0].max_cty_id,
                    Name = str,
                    UserName = str2
                };
                categoryContext.Categories.Add(category);
            }
            else if(type.Equals("fvt"))
            {
                Favourite favorite = new Favourite
                {
                    //Id = categoryContext.Configs.ToList<Config>()[0].max_cty_id,
                    Name = str,
                    UserName = str2
                };
                categoryContext.Favourites.Add(favorite);
            }
           
            categoryContext.SaveChanges();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
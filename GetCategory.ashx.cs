using Feed_Manager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Feed_Manager
{
    /// <summary>
    /// GetCategory 的摘要说明
    /// </summary>
    public class GetCategory : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String html = "";
            String ctyname = context.Request.QueryString["ctyname"].ToString();
            String uname = context.Request.QueryString["uname"].ToString();
            CategoryContext categoryContext = new CategoryContext();
            List<Category> categories = categoryContext.Categories.ToList<Category>();
            var category = categories.Where(c => c.UserName.Equals(uname)).Where(c => c.Name.Equals(ctyname)).Where(c=>c.Rsses!=null).FirstOrDefault();
            
            foreach(Rss r in category.Rsses)
            {
                html += "<li><a href='javascript:void(0)'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + r.Name.ToString() +
                       "</a></ li >";
            }
   
            context.Response.ContentType = "text/plain";
            context.Response.Write(html);
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
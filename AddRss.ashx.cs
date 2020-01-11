using Feed_Manager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Web;
using System.Xml;

namespace Feed_Manager
{
    /// <summary>
    /// AddRss 的摘要说明
    /// </summary>
    public class AddRss : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            CategoryContext categoryContext = new CategoryContext();
           

            String userName = context.Request.QueryString["uname"].ToString();
            String ctyname = context.Request.QueryString["ctyname"].ToString();
            String url = context.Request.QueryString["url"].ToString();

            Category category = categoryContext.Categories.Where(c=>c.Name.ToString().Equals(ctyname)).FirstOrDefault();

            var reader = XmlReader.Create(url);
            var feed = SyndicationFeed.Load(reader);
            String title = feed.Title.Text.ToString();

            Rss rss = new Rss
            {
                Name = title,
                UserName = userName,
                Url = url
            };

            category.Rsses.Add(rss);
            categoryContext.SaveChanges();

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("");
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
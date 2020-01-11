using Feed_Manager.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.ServiceModel.Syndication;
using System.Text;
using System.Text.RegularExpressions;
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
            String url = context.Request.QueryString["url"].ToString();
            String type = context.Request.QueryString["type"].ToString();

            if(type.Equals("rss"))
            {
                String ctyname = context.Request.QueryString["ctyname"].ToString();
                Category category = categoryContext.Categories.Where(c => c.Name.ToString().Equals(ctyname)).FirstOrDefault();
               

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
            }
            else if(type.Equals("essay"))
            {
                String fvtname = context.Request.QueryString["fvtname"].ToString();
                Favourite favourite = categoryContext.Favourites.Where(f => (f.UserName.ToString().Equals(userName)&&f.Name.ToString().Equals(fvtname))).FirstOrDefault();

                List<String> tad = getWebTitleAndDescription(url);
                String title = tad[0];
                String description = tad[1];


                Essay essay = new Essay
                {
                    Url = url,
                    Title = title,
                    Description = description
                };

                favourite.Essays.Add(essay);
                categoryContext.SaveChanges();
            }

            

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

        private List<String> getWebTitleAndDescription(String url)
        {
            //请求资源
            System.Net.WebRequest wb = System.Net.WebRequest.Create(url.Trim());

            //响应请求
            WebResponse webRes = null;

            //将返回的数据放入流中
            Stream webStream = null;
            try
            {
                webRes = wb.GetResponse();
                webStream = webRes.GetResponseStream();
            }
            catch (Exception e)
            {
                return null;
            }


            //从流中读出数据
            StreamReader sr = new StreamReader(webStream, System.Text.Encoding.UTF8);

            //创建可变字符对象，用于保存网页数据 
            StringBuilder sb = new StringBuilder();

            //读出数据存入可变字符中
            String str = "";
            for (int i = 0; i < 50; i++)
            {
                str = sr.ReadLine();
                if (str != null)
                    sb.Append(str);
                else
                    break;
            }

            //建立获取网页标题正则表达式
            String regex = @"<title>.+</title>";
            String regexd = @"<description>.+</description>";

            //返回网页标题
            String title = Regex.Match(sb.ToString(), regex).ToString();
            title = title.Replace("<title>", "");
            title = title.Replace("</title>", "");

            String description = Regex.Match(sb.ToString(), regexd).ToString();
            description = Regex.Replace(description, @"[\""]+", "");

            List<String> result = new List<string> { title, description };
            return result;
        }

    }
}
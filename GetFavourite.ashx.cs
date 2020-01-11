using Feed_Manager.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Feed_Manager
{
    /// <summary>
    /// GetFavourite 的摘要说明
    /// </summary>
    public class GetFavourite : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String uname = context.Request.QueryString["uname"].ToString();
            String fvtname = context.Request.QueryString["fvtid"].ToString();
            

            CategoryContext categoryContext = new CategoryContext();
            Favourite favourite = categoryContext.Favourites.Where(f => f.Name.ToString().Equals(fvtname)).FirstOrDefault();
            List<Essay> essays = favourite.Essays.ToList<Essay>();

            String html = "<div class='content-header'>" +
                             "<nav aria-label='breadcrumb'></nav><a><h1 class='page-title'>" +
                              favourite.Name.ToString() +"</h1></a></div><div class='row'>" +
                             "<table class='table table-hover'><caption></caption>" +
                             "<thead><tr>" +
                             "<th width = '10px'></th>" +
                             "<th width = '10px'></th>" +
                             "<th width='75%'></th></thead><tbody>";

            foreach (Essay essay in essays)
            {
                String link = essay.Url.ToString();
                String title = essay.Title.ToString();
                String description = essay.Description.ToString();
                
                html += ("<tr><td><a href='javascript:void(0)'><i class='fa fa-star'></i></a></td>" +
                    "<td></td>" +
                    "<td style=' overflow: hidden; white-space: nowrap; text-overflow: ellipsis '><a href='" + link + "'target='_blank'><b>" + title + "</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + description + "</a></td></tr>");

            }

            html += "</tbody></table>";
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
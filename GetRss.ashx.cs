﻿using Feed_Manager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

namespace Feed_Manager
{
    /// <summary>
    /// GetRss 的摘要说明
    /// </summary>
    public class GetRss : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            

            String uname = context.Request.QueryString["uname"].ToString();
            int rssid = int.Parse(context.Request.QueryString["rssid"].ToString());

            CategoryContext categoryContext = new CategoryContext();
            Rss rss = categoryContext.Rsses.Where(r => r.RssId == rssid).FirstOrDefault();
           

            var reader = XmlReader.Create(rss.Url);
            var feed = SyndicationFeed.Load(reader);
            String title = feed.Title.Text.ToString();
            String link = feed.Links.ToList<SyndicationLink>().FirstOrDefault().Uri.ToString();
            String html = "<div class='content-header'>" +
                             "<nav aria-label='breadcrumb'></nav><a href='" + link + "'target='_blank'><h1 class='page-title'>" +
                             rss.Name.ToString() + "</h1></a></div><div class='row'>" +
                             "<table class='table table-hover'><caption></caption>" +
                             "<thead><tr>" +
                             "<th width = '10px'></th>" +
                             "<th width = '10px'></th>" +
                             "<th width='75%'></th></thead><tbody>";

            List<SyndicationItem> syndicationItems = feed.Items.ToList<SyndicationItem>();
            foreach(SyndicationItem item in syndicationItems)
            {
                String itemtitle = item.Title.Text.ToString();
                String itemlink = item.Links.ToList<SyndicationLink>().FirstOrDefault().Uri.ToString();
                String description = item.Summary.Text.ToString();
                if(description.Length>1024)
                {
                    description = description.Substring(0, 1024);
                }
                description = trans(description);
                html += ("<tr><td><a href='javascript:void(0)'><i class='fa fa-bookmark-o' aria-hidden='true'></i></a></td>" +
                    "<td><a href='javascript:void(0)'><i class='fa fa-star-o'aria-hidden='true'></i></a></td>" +
                    "<td style=' overflow: hidden; white-space: nowrap; text-overflow: ellipsis '><a href='" + itemlink + "'target='_blank'><b>" + itemtitle + "</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + description + "</a></td></tr>");

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

        private String trans(String str)
        {
            char[] nstr = str.ToArray<char>();
            Stack<int> left = new Stack<int>();
            for (int i = 0; i < str.Length; i++)
            {
                
                if (str[i] == '<')
                {
                    left.Push(i);
                }
                else if (str[i] == '>')
                {
                    if (left.Count == 0)
                    {
                        continue;
                    }
                    int start = left.Pop();
                    for (int j = start; j <= i; j++)
                        nstr[j] = '\a';
                }
                else
                {
                    continue;
                }
            }
            String nnstr =  new string(nstr).Replace("\a","");


            return nnstr;
        }
    }
}
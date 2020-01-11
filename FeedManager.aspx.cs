using Feed_Manager.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Feed_Manager
{
    
    public partial class FeedManager : System.Web.UI.Page
    {

        public const string CategorySessionKey = "ctyid";
        CategoryContext categoryContext = new CategoryContext();
        public String userName = HttpContext.Current.User.Identity.Name.ToString();
        

        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // 以下代码可帮助防御 XSRF 攻击
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // 使用 Cookie 中的 Anti-XSRF 令牌
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // 生成新的 Anti-XSRF 令牌并保存到 Cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 设置 Anti-XSRF 令牌
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // 验证 Anti-XSRF 令牌
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Anti-XSRF 令牌验证失败。");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (HttpContext.Current.Session[CategorySessionKey] == null)
                {
                    HttpContext.Current.Session[CategorySessionKey] =
                    HttpContext.Current.User.Identity.Name;
                }
                musername.InnerText = HttpContext.Current.User.Identity.Name;

         
            }
            else
            {
                Response.Redirect("Account/Login.aspx");
            }
            
        }


        public String LoadFavourites()
        {
            String html = "";
            List<Favourite> favorites;
            favorites = categoryContext.Favourites.ToList<Favourite>();
            favorites.ForEach(f =>
            {
                if (f.UserName.Equals(userName))
                {
                    html += "<li><a href='javascript:void(0)'class='fvt-a' id = 'fvt-a-" + f.Name.ToString() +
                        "'> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class=" +
                        "'fa fa-star'" +
                        "></i> &nbsp&nbsp " +
                        f.Name.ToString() +
                        "</a></li >";
                }
            });
            return html;

        }

        public string LoadCategories()
        {
            String html = "";
            List<Category> categories;
            categories = categoryContext.Categories.ToList<Category>();
            categories.ForEach(c =>
            {
                if (c.UserName.Equals(userName))
                {
                    html += "<li><a href='javascript:void(0)' class='cty-a' id ='cty-a-" + c.Name.ToString() +
                        "'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class=" +
                        "'fa fa-angle-right'" +
                        "></i> &nbsp&nbsp " +
                        c.Name.ToString() +
                        "</a>" +
                        "<ul id='cty-u-"+ c.Name.ToString() +
                        "' style='display:none'></ul>" +
                        "</li >";
                }
            });
            return html;
          
        }


        protected void Page_Unload(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

       

    }
}
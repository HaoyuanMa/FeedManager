using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Feed_Manager.Models
{
    public class Rss
    {

        [Key]
        public int RssId { get; set; }
        public String Name { get; set; }
        public String Url { get; set; }
        public String UserName { get; set; }
    }
}
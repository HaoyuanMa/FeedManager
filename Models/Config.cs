using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Feed_Manager.Models
{
    public class Config
    {
        [Key]
        public int id { get; set; }
        public int max_cty_id { get; set; }
    }
   
}
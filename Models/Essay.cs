using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Feed_Manager.Models
{
    public class Essay
    {
        [Key]
        public int EssayId { get; set; }
        public List<Favourite> Favourites { get; set; }
        public String Url { get; set; }

    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Feed_Manager.Models
{
    public class Favourite
    {
        [Key]
        public int FavouriteId { get; set; }
        public virtual ICollection<Essay> Essays { get; set; }
        
        public String Name { get; set; }
        public String UserName { get; set; }
    }
}
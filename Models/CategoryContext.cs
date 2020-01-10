using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Feed_Manager.Models
{
    public class CategoryContext : DbContext
    {
        public CategoryContext() : base("feedmanager")
        {
        }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Favourite> Favourites { get; set; }
        public DbSet<Rss> Rsses { get; set; }
        public DbSet<Essay> Essays { get; set; }
        public DbSet<Config> Configs { get; set; }
    }
}
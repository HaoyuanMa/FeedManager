using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Feed_Manager.Models
{
    public class DatabaseInitializer : DropCreateDatabaseIfModelChanges<CategoryContext>
    {
        protected override void Seed(CategoryContext context)
        {
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetFavouriteses().ForEach(f => context.Favourites.Add(f));
            GetEssays().ForEach(e => context.Essays.Add(e));
            GetRsses().ForEach(r => context.Rsses.Add(r));
            
            Config config = new Config
            {
                id = 0,
                max_cty_id = 0
            };
            context.Configs.Add(config);
        }

        private static Essay essay0 = new Essay
        {
            EssayId = 0,
            Favourites = null,
            Url = "http://www.ruanyifeng.com/blog/2020/01/weekly-issue-89.html"
        };
        private static Essay essay1 = new Essay
        {
            EssayId = 1,
            Favourites = null,
            Url = "http://www.ruanyifeng.com/blog/2020/01/weekly-issue-89.html"
        };

        private static Favourite favourite0 = new Favourite
        {
            FavouriteId = 0,
            Name = "test_fav0",
            Essays = new List<Essay> { essay0,essay1},
            UserName = "test@test.com"
        };
        private static Favourite favourite1 = new Favourite
        {
            FavouriteId = 1,
            Essays = null,
            Name = "test_fav1",
            UserName = "test@test.com"
        };


        private static Rss rss0 = new Rss
        {
            RssId = 0,
            Name = "mhy",
            Url = "http://www.ruanyifeng.com/blog/atom.xml",
            UserName = "test@test.com"
        };
        private static Rss rss1 = new Rss
        {
            RssId = 1,
            Name = "mhy",
            Url = "http://www.ruanyifeng.com/blog/atom.xml",
            UserName = "test@test.com"
        };
        private static Rss rss2 = new Rss
        {
            RssId = 2,
            Name = "mhy",
            Url = "http://www.ruanyifeng.com/blog/atom.xml",
            UserName = "test@test.com"
        };


        private static List<Category> GetCategories()
        {
            var categories = new List<Category> {
                new Category
                {
                    CategoryId = 0,
                    Rsses = new List<Rss>{rss0,rss1},
                    Name = "test_category0",
                    UserName="test@test.com"
                },
                new Category
                {
                    CategoryId = 1,
                    Rsses = new List<Rss>{rss2},
                    Name = "test_category1",
                    UserName="test@test.com"
                }
            };
            return categories;
        }

        private static List<Rss> GetRsses()
        {
            var rsses = new List<Rss> { rss0, rss1 };
            return rsses;
        }

        private static List<Favourite> GetFavouriteses()
        {
            essay0.Favourites = new List<Favourite> { favourite0 };
            essay1.Favourites = new List<Favourite> { favourite0 };
            var favouriteses = new List<Favourite> {favourite0, favourite1 };
            return favouriteses;
        }

        private static List<Essay> GetEssays()
        {
            var essayes = new List<Essay> { essay0, essay1 };
            return essayes;
        }
    }
}
using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class Blog
    {
        public int MaBlog { get; set; }
        public string TenBlog { get; set; }
        public string NoiDung { get; set; }
        public DateTime? NgayDang { get; set; }
        public int? MaLoaiBlog { get; set; }

        public virtual LoaiBlog MaLoaiBlogNavigation { get; set; }
    }
}

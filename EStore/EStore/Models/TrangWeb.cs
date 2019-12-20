using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class TrangWeb
    {
        public TrangWeb()
        {
            PhanQuyen = new HashSet<PhanQuyen>();
        }

        public int MaTrang { get; set; }
        public string TenTrang { get; set; }
        public string Url { get; set; }

        public virtual ICollection<PhanQuyen> PhanQuyen { get; set; }
    }
}

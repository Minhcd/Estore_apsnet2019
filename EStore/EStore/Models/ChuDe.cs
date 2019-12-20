using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class ChuDe
    {
        public int MaCd { get; set; }
        public string TenCd { get; set; }
        public string MaNv { get; set; }

        public virtual NhanVien MaNvNavigation { get; set; }
    }
}

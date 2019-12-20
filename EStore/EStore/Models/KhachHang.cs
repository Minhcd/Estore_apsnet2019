using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EStore.Models
{
    public partial class KhachHang
    {
        public KhachHang()
        {
            BanBe = new HashSet<BanBe>();
            BinhLuan = new HashSet<BinhLuan>();
            KhuyenMai = new HashSet<KhuyenMai>();
            YeuThich = new HashSet<YeuThich>();
        }
        [Display(Name = "Mã khách hàng")]
        public int MaKh { get; set; }
        [Display(Name = "Mật khẩu")]
        public string MatKhau { get; set; }
        [Display(Name = "Họ tên")]
        public string HoTen { get; set; }
        [Display(Name = "Giới tính")]
        public bool? GioiTinh { get; set; }
        [Display(Name = "Ngày sinh")]
        public DateTime? NgaySinh { get; set; }
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Điện thoại")]
        public string DienThoai { get; set; }
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Display(Name = "Hiệu lực")]
        public bool? HieuLuc { get; set; }
        [Display(Name = "Vai trò")]
        public int? VaiTro { get; set; }
        public string RandomKey { get; set; }

        public virtual ICollection<BanBe> BanBe { get; set; }
        public virtual ICollection<BinhLuan> BinhLuan { get; set; }
        public virtual ICollection<KhuyenMai> KhuyenMai { get; set; }
        public virtual ICollection<YeuThich> YeuThich { get; set; }
    }
}

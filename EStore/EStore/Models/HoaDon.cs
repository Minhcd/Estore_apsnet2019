using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EStore.Models
{
    public partial class HoaDon
    {
        public HoaDon()
        {
            ChiTietHd = new HashSet<ChiTietHd>();
        }
        [Display(Name = "Mã hóa đơn")]
        public int MaHd { get; set; }
        [Display(Name = "Ngày đặt")]
        public DateTime? NgayDat { get; set; }
        [Display(Name = "Ngày giao")]
        public DateTime? NgayGiao { get; set; }
        [Display(Name = "Họ tên")]
        public string HoTen { get; set; }
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Cách thanh toán")]
        public string CachThanhToan { get; set; }
        [Display(Name = "Cách vận chuyển")]
        public string CachVanChuyen { get; set; }
        [Display(Name = "Phí vận chuyển")]
        public double? PhiVanChuyen { get; set; }
        
        public int? MaTrangThai { get; set; }
        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }
        [Display(Name = "Điện thoại")]
        public string DienThoai { get; set; }
        [Display(Name = "Tổng tiền")]
        public double? TongTien { get; set; }
        [Display(Name = "Mã trạng thái")]
        public virtual TrangThai MaTrangThaiNavigation { get; set; }
        public virtual ICollection<ChiTietHd> ChiTietHd { get; set; }
    }
}

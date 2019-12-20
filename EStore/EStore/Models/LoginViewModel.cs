using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EStore.Models
{
    public class LoginViewModel
    {
        [Display(Name = "Mã khách hàng")]
        [Key]

        [MaxLength(50, ErrorMessage = "Tối đa 20 kí tự")]
        public string email { get; set; }
        [Display(Name = "Mật khẩu")]
        [MaxLength(50, ErrorMessage = "Tối đa 50 kí tự")]
        [DataType(DataType.Password)]
        public string MatKhau { get; set; }
        public bool RememberMe { set; get; }
    }
}

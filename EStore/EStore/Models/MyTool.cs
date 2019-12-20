using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace EStore.Models
{
    public class MyTool
    {
    }
    public static class StaticClass
    {
        public static string ToVND(this double dongia)
        {
            return $"{dongia.ToString("#,##0")} đ";
        }

        public static string ToUrlFriendly(this string tieuDe)
        {
            if (tieuDe != null)
            {
                string str = tieuDe.ToLower().Trim();

                //thay thế tiếng Việt
                str = Regex.Replace(str, @"[áàảãạâấầẩẫậăắằẳẵặ]", "a");
                str = Regex.Replace(str, @"[éèẻẽẹêếềểễệ]", "e");
                str = Regex.Replace(str, @"[úùụủũưừứựửữ]", "u");
                str = Regex.Replace(str, @"[íìỉĩị]", "i");
                str = Regex.Replace(str, @"[óòỏõọôốồổỗộơớờởỡợ]", "o");
                str = Regex.Replace(str, @"[ýỳỷỹỵ]", "y");
                str = Regex.Replace(str, @"[đ]", "d");
                str = Regex.Replace(str, @"[-]", "");
                str = Regex.Replace(str, @"[+]", "");

                str = Regex.Replace(str, @"[^a-z0-9\s-]", " ");
                str = Regex.Replace(str, @"\s+", "-").Trim();
                str = Regex.Replace(str, @"\s", "-");
                return str;
            }

            return tieuDe;
        }
    }
}

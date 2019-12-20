using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace EStore.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomesController : CheckLoginController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
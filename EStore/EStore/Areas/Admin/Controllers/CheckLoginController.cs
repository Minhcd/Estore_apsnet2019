using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EStore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;

namespace EStore.Areas.Admin.Controllers
{
    public class CheckLoginController : Controller
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            if (HttpContext.Session.Get("email") == null)
            {

                filterContext.Result = new RedirectToRouteResult(new
                  RouteValueDictionary(new { controller = "Login", action = "Index" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace symphony_limited.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            var check = Session["Id"];
            if (check == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                          RouteValueDictionary(new { controller = "LoginRegister", action = "login" }));

            }
            //if (!string.IsNullOrEmpty(check))
            //{
            //    if (check != null)
            //    {
            //        filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Home", action = "Error" }));
            //    }
            //}
            //else
            //{
            //    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Login" }));
            //}
        }
    }
}
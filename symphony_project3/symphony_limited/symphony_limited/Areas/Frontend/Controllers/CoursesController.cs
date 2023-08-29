using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using symphony_limited.FrameWork;

namespace symphony_limited.Areas.Frontend.Controllers
{
    public class CoursesController : Controller
    {
        private symphony_limitedEntities db = new symphony_limitedEntities();

        // GET: Frontend/Courses
        public ActionResult Index(int courseid = 0)
        {
            if (courseid == 0)
            {
                var courses = db.Courses.Include(c => c.Category).Include(c => c.Teacher);
                return View(courses.ToList());
            }
            else
            {
                var courses = db.Courses.Include(c => c.Category).Include(c => c.Teacher).Where(x => x.CategoryId == courseid);
                return View(courses.ToList());
            }
        }

        public ActionResult Details(int? id)
        {
            var courses = db.Courses.Include(c => c.Category).Include(c => c.Teacher);
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        


    }
}

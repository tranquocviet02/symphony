using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
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
        //public ActionResult Index(int courseid = 0)
        //{
        //    if (courseid == 0)
        //    {
        //        var courses = db.Courses.Include(c => c.Category).Include(c => c.Teacher);
        //        return View(courses.ToList());
        //    }
        //    else
        //    {
        //        var courses = db.Courses.Include(c => c.Category).Include(c => c.Teacher).Where(x => x.CategoryId == courseid);
        //        return View(courses.ToList());
        //    }
        //}

        public async Task<ActionResult> Index(String search, int pageNumber = 1)
        {
            ViewdataNameCategory();

            var pagesize = 12;
            var courses = db.Courses.Include(c => c.Category).Include(c => c.Teacher).ToList();
            if (!String.IsNullOrEmpty(search))
            {
                courses = courses.Where(s => s.NameCourse.Contains(search) || s.Category.NameCategory.Contains(search)).ToList();
            }
            var total = courses.Count();
            var obj = new List<Course>();
            if (pageNumber > 0)
            {
                obj = courses.Skip((pageNumber - 1) * pagesize).Take(pagesize).ToList();
            }
            ViewBag.total = total;
            ViewBag.pageSize = pagesize;
            var page = total / pagesize;
            if (total % pagesize > 0)
            {
                page = page + 1;
            }
            ViewBag.page = page;
            ViewBag.search = search;
            ViewBag.pagenumber = pageNumber;
            return View(obj);
        }

        public void Viewdatadefault()
        {
            List<Course> courseList = db.Courses.ToList();
            ViewBag.ListCourse = courseList;


        }

        public void ViewdataNameCategory()
        {
            List<Category> namecategory = db.Categories.ToList();

            ViewBag.NameCategory = namecategory;
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

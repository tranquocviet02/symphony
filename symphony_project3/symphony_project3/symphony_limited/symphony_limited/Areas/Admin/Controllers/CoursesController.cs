using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using PagedList;
using symphony_limited.FrameWork;

namespace symphony_limited.Areas.Admin.Controllers
{
    public class CoursesController : BaseController
    {
        private symphony_limitedEntities db = new symphony_limitedEntities();

        // GET: Admin/Courses
        //public ActionResult Index()
        //{
        //    var courses = db.Courses.Include(c => c.Category).Include(c => c.Teacher);
        //    return View(courses.ToList());
        //}
        public async Task<ActionResult> Index(String search, int pageNumber = 1)
        {
            //string a = Session["Id"].ToString();
            //if (Session["Id"] == null)
            //{
            //    return RedirectToAction("Login", "LoginRegister");
            //}
            Viewdatadefault();
            ViewdataTeacher();
            ViewdataCategory();
            var pagesize = 6;
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

        public void ViewdataTeacher()
        {
            List<Teacher> teacherList = db.Teachers.ToList();
            ViewBag.ListTeacher = teacherList;
        }
        public void ViewdataCategory()
        {
            List<Category> categoryList = db.Categories.ToList();
            ViewBag.ListCategory = categoryList;
        }

        // GET: Admin/Courses/Details/5
        public ActionResult Details(int? id)
        {
            Viewdatadefault();
            ViewdataTeacher();
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

        // GET: Admin/Courses/Create
        [HttpGet]
        public ActionResult AddOrUpdate(int id = 0)
        {
            Viewdatadefault();
            ViewdataTeacher();
            ViewdataCategory();
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "NameCategory");
            ViewBag.TeacherId = new SelectList(db.Teachers, "TeacherId", "NameTeachear");
            var course = new Course();
            if (id != 0)
            {
                return View(db.Courses.Find(id));
            }
            return View(course);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddOrUpdate([Bind(Include = "CourseId,NameCourse,Price,Status,Description,Numberofsession,TeacherId,Img,CategoryId")] Course course, HttpPostedFileBase uploadhinh)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (uploadhinh != null && uploadhinh.ContentLength > 0)
                    {
                        int id = course.CourseId;

                        string _FileName = "";
                        int index = uploadhinh.FileName.IndexOf('.');
                        _FileName = "teacher" + id.ToString() + "." + uploadhinh.FileName.Substring(index + 1);
                        string _path = Path.Combine(Server.MapPath("~/Upload/Course/"), _FileName);
                        uploadhinh.SaveAs(_path);
                        course.Img = _FileName;
                    }
                    if (course.CourseId == 0)
                    {
                        db.Courses.Add(course);
                    }
                    else
                    {
                        db.Entry(course).State = EntityState.Modified;
                        var data = db.Courses.Find(course.CourseId);

                        data.NameCourse = course.NameCourse;
                        data.Price = course.Price;
                        data.Status = course.Status;
                        data.Teacher.NameTeachear = course.Teacher.NameTeachear;
                        data.Category.NameCategory = course.Category.NameCategory;
                        data.Numberofsession = course.Numberofsession;
                        data.Description = course.Description;
                        data.CourseId = course.CourseId;
                        data.Img = !string.IsNullOrEmpty(course.Img) ? course.Img : data.Img;
                        db.Courses.Attach(data);
                    }
                    db.SaveChanges();
                }
                ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "NameCategory", course.CategoryId);
                ViewBag.TeacherId = new SelectList(db.Teachers, "TeacherId", "NameTeachear", course.TeacherId);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        // POST: Admin/Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
      
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpPost]
        public JsonResult DeleteMG_Course(int ID)
        {
            if (ID != 0)
            {
                try
                {
                    var data = db.Courses.Where(o => o.CourseId == ID).FirstOrDefault();
                    db.Courses.Remove(data);
                    db.SaveChanges();

                }
                catch (Exception EX)
                {

                    throw;
                }
            
            }
            return Json(new { status = true, mess = "xoa thanh cong" });
        }
    }
}

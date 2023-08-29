using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using symphony_limited.FrameWork;

namespace symphony_limited.Areas.Frontend.Controllers
{
    public class StudentRegisterController : Controller
    {
        private symphony_limitedEntities db = new symphony_limitedEntities();

        // GET: Frontend/StudentRegister
        public ActionResult Index()
        {
            var students = db.Students.Include(s => s.Course);
            return View(students.ToList());
        }

        // GET: Frontend/StudentRegister/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // GET: Frontend/StudentRegister/Create
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "NameCourse");
            return View();
        }

        // POST: Frontend/StudentRegister/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StudentId,NameStudent,BirthDay,Email,PhoneNumber,CourseId,Genre")] Student student)
        {
            if (ModelState.IsValid)
            {
                db.Students.Add(student);
                db.SaveChanges();
                SetAlert("Them student thanh cong", "success");
                return RedirectToAction("Create");
            }

            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "NameCourse", student.CourseId);
            return View(student);
        }

        protected void SetAlert(string messenger, string type)
        {
            TempData["AlertMessenger"] = messenger;
            if (type == "success")
            {
                TempData["AlterType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlterType"] = "alert-warning";
            }
            else if (type == "erro")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
    }
}

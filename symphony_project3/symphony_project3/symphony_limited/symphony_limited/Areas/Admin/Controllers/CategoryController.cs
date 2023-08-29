using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using symphony_limited.FrameWork;

namespace symphony_limited.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        private symphony_limitedEntities db = new symphony_limitedEntities();

        // GET: Admin/Category
        //public ActionResult Index()
        //{
        //    return View(db.Categories.ToList());
        //}

        public async Task<ActionResult> Index(String search, int pageNumber = 1)
        {
            Viewdatadefault();
            var pagesize = 6;
            var categories = db.Categories.ToList();
            if (!String.IsNullOrEmpty(search))
            {
                categories = categories.Where(s => s.NameCategory.Contains(search)).ToList();
            }
            var total = categories.Count();
            var obj = new List<Category>();
            if (pageNumber > 0)
            {
                obj = categories.Skip((pageNumber - 1) * pagesize).Take(pagesize).ToList();
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

        // GET: Admin/Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Category/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CategoryId,NameCategory")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category);
        }

        // GET: Admin/Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CategoryId,NameCategory")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // GET: Admin/Category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

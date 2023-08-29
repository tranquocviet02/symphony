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
    public class ContactsController : Controller
    {
        //private symphony_limited db = new symphony_limited();
        private symphony_limitedEntities db = new symphony_limitedEntities();


        public async Task<ActionResult> Index(String search, int pageNumber = 1)
        {

            var pagesize = 6;
            var contacts = db.Contacts.ToList();
            if (!String.IsNullOrEmpty(search))
            {
                contacts = contacts.Where(s => s.FullName.Contains(search)).ToList();
            }
            var total = contacts.Count();
            var obj = new List<Contact>();
            if (pageNumber > 0)
            {
                obj = contacts.Skip((pageNumber - 1) * pagesize).Take(pagesize).ToList();
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

        // GET: Admin/Contacts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        public void Viewdatadefault()
        {
            List<Contact> contactsList = db.Contacts.ToList();
            ViewBag.ListContacts = contactsList;
        }

        // GET: Admin/Courses/Create
        [HttpGet]
        public ActionResult AddOrUpdate(int id = 0)
        {
            Viewdatadefault();
            var contact = new Contact();
            if (id != 0)
            {
                return View(db.Contacts.Find(id));
            }
            return View(contact);
        }

        [HttpPost]
        public ActionResult AddOrUpdate([Bind(Include = "ContactId,FullName,Email,Subject,message")] Contact contact)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (contact.ContactId == 0)
                    {
                        db.Contacts.Add(contact);
                    }
                    else
                    {
                        db.Entry(contact).State = EntityState.Modified;
                        var data = db.Contacts.Find(contact.ContactId);

                        data.FullName = contact.FullName;
                        data.Email = contact.Email;
                        data.Subject = contact.Subject;
                        data.message = contact.message;
                        db.Contacts.Attach(data);
                    }
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        // GET: Admin/Contacts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Admin/Contacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Contact contact = db.Contacts.Find(id);
            db.Contacts.Remove(contact);
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

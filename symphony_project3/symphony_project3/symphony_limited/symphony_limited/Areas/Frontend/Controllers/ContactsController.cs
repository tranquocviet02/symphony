using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using symphony_limited.FrameWork;

namespace symphony_limited.Areas.Frontend.Controllers
{
    public class ContactsController : Controller
    {
        private symphony_limitedEntities db = new symphony_limitedEntities();

        // GET: Frontend/Contacts
        public ActionResult Index()
        {
            return View(db.Contacts.ToList());
        }

        // GET: Frontend/Contacts/Details/5

        // GET: Frontend/Contacts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Frontend/Contacts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Contact contact)
        {
            try
            {
                db.Contacts.Add(contact);
                db.SaveChanges();
                ViewBag.error = "You have successfully submitted !";
                return RedirectToAction(nameof(Index));
            }

            catch (DbUpdateException /*Ex*/)
            {
                ModelState.AddModelError("", "Unable to save changes." +
                    "Try again , and if the problem presists" +
                    "See your system administrator");
                ViewBag.error = "Response has not been sent !";
            }

            return RedirectToAction("Create", "Contacts");
        }
    }
}

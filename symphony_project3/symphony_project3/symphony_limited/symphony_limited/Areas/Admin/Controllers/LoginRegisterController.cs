using symphony_limited.code;
using symphony_limited.FrameWork;
using System;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace symphony_limited.Areas.Admin.Controllers
{
    public class LoginRegisterController : Controller
    {
        symphony_limitedEntities db = new symphony_limitedEntities();
        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Signup(Login login)
        {
            if (db.Logins.Any(x => x.Email == login.Email))
            {
                ViewBag.Notification = "this account has aleardy exsted";
                return View();
            }
            else
            {
                login.PassWord = RSAHelpers.MD5Encode(login.PassWord);
                db.Logins.Add(login);
                try
                {
                    // Your code...
                    // Could also be before try if you know the exception occurs in SaveChanges

                    db.SaveChanges();
                }
                catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    throw;
                }


                Session["Id"] = login.Id.ToString();
                Session["Email"] = login.Email.ToString();
                return RedirectToAction("Login", "LoginRegister");
            }
        }
        public ActionResult Logout()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("Login", "LoginRegister");
            }
            Session.Clear();
            return RedirectToAction("Login", "LoginRegister");
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]

        [ValidateAntiForgeryToken]
        public ActionResult Login(Login login)
        {

            var strpw = RSAHelpers.MD5Encode(login.PassWord).ToString();

            var checkLogin = db.Logins.Where(x => x.Email.Equals(login.Email) && x.PassWord.Equals(strpw)).FirstOrDefault();
            if (checkLogin != null)
            {
                Session["Id"] = login.Id.ToString();
                Session["Email"] = login.Email.ToString();
                return RedirectToAction("Index", "Courses");
            }
            else
            {
                ViewBag.Notification = "Wrong Email or PassWord";
            }
            return View();
        }




        // GET: Admin/Logins/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Login login = db.Logins.Find(id);
            if (login == null)
            {
                return HttpNotFound();
            }
            return View(login);
        }

        // POST: Admin/Logins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Login login = db.Logins.Find(id);
            db.Logins.Remove(login);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
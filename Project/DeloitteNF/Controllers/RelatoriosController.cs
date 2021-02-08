using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DeloitteNF.Controllers
{
    public class RelatoriosController : Controller
    {
        // GET: Relatorios
        public ActionResult ProductsSales()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            return View(db.stp_InvoiceListProductsSales());
        }

        // GET: Relatorios/Details/5
        public ActionResult ClientsSales()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            return View(db.stp_BestCustomers());
        }
        
    }
}

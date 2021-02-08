using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DeloitteNF.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            DeloitteNFEntities db = new DeloitteNFEntities();

            ViewBag.UltimasVendas = db.stp_InvoiceList().OrderByDescending(x=>x.Data).Take(5);

            ViewBag.TotalVendasMes = db.stp_InvoiceList().Where(x => x.Data > DateTime.Now.AddDays(-30)).Sum(y => y.TotalNota);
            ViewBag.TotalVendasDia = db.stp_InvoiceList().Where(x => x.Data > DateTime.Now.AddDays(-1)).Sum(y => y.TotalNota);

            ViewBag.Best = db.stp_BestCustomers();

            ViewBag.Percentual = Convert.ToInt16((ViewBag.TotalVendasMes==0?0:(ViewBag.TotalVendasDia * 100) / ViewBag.TotalVendasMes));

            return View();
        }

        public ActionResult About()
        {


            return View();
        }

        public class teste
        {
            public int cod { get; set; }
            public string texto { get; set; }
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
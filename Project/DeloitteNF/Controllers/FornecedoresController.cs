using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace DeloitteNF.Controllers.Front
{
    public class FornecedoresController : Controller
    {
        // GET: Fornecedores
        public ActionResult Index()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            return View(db.stp_ProviderSPList());
        }

        // GET: Fornecedores/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Fornecedores/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                string _nome = collection["Nome"];

                DeloitteNFEntities db = new DeloitteNFEntities();
                IEnumerable<stp_ProvidersInsert_Result> resp = db.stp_ProvidersInsert(_nome);

                return RedirectToAction("Index");

            }
            catch
            {
                return View();
            }
        }

        // GET: Fornecedores/Edit/5
        public ActionResult Edit(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ProvidersId_Result> resp = db.stp_ProvidersId(id);

            return View(resp.FirstOrDefault());
        }

        // POST: Clientes/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();

                string _nome = collection["Nome"];

                db.stp_ProvidersUpdate(id, _nome);


                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Details/5
        public ActionResult Details(int id)
        {

            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ProvidersId_Result> resp = db.stp_ProvidersId(id);

            return View(resp.FirstOrDefault());

        }

        // GET: Clientes/Delete/5
        public ActionResult Delete(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ProvidersId_Result> resp = db.stp_ProvidersId(id);

            return View(resp.FirstOrDefault());
        }

        // POST: Clientes/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_ProvidersDelete(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }


    }
}
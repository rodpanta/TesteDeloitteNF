using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace DeloitteNF.Controllers.Front
{
    public class ClientesController : Controller
    {
        // GET: Clientes
        public ActionResult Index()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
     
            return View(db.stp_ClientesResList());
        }


        // GET: Clientes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Clientes/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                string _nome = collection["Nome"];
                string _end = collection["Endereço"];
                string _tipo = collection["Tipo"];

                DeloitteNFEntities db = new DeloitteNFEntities();
                IEnumerable <stp_ClientsInsert_Result> resp = db.stp_ClientsInsert(_nome, _end, _tipo);

                return RedirectToAction("Index");

            }
            catch
            {
                return View();
            }
        }


        // GET: Clientes/Edit/5
        public ActionResult Edit(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable <stp_ClientsId_Result> resp =  db.stp_ClientsId(id); 
            
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
                string _end = collection["Endereço"];
                string _tipo = collection["Tipo"];

                db.stp_ClientsUpdate(id,_nome, _end, _tipo);
                

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
            IEnumerable<stp_ClientsId_Result> resp = db.stp_ClientsId(id);

            return View(resp.FirstOrDefault());

        }


        // GET: Clientes/Delete/5
        public ActionResult Delete(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ClientsId_Result> resp = db.stp_ClientsId(id);

            return View(resp.FirstOrDefault());
        }

        // POST: Clientes/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_ClientsDelete(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

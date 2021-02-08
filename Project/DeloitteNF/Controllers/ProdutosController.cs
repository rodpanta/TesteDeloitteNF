using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace DeloitteNF.Controllers.Front
{
    public class ProdutosController : Controller
    {
        // GET: Produtos
        public ActionResult Index()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            return View(db.stp_ProductsList());
        }

        // GET: Produtos/Details/5
        public ActionResult Details(int id)
        {

            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stpProductsId_Result> resp = db.stpProductsId(id);

            return View(resp.FirstOrDefault());

        }

        // GET: Produtos/Edit/5
        public ActionResult Edit(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            ViewBag.Fornecedores = db.stp_ProviderSPList();

            IEnumerable<stpProductsId_Result> resp = db.stpProductsId(id);

            return View(resp.FirstOrDefault());
        }

        // POST: Produtos/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();

                string _nome = collection["nomeprod"];
                string _uni = collection["Unidade"];
                string _nomef = collection["nomefornec"];
                int _fornecid = Convert.ToInt32(collection["Fornecedor_id"]);
                decimal _preco = Convert.ToDecimal(collection["Preco"]);


                db.stp_ProductsUpdate(id,_nome,_uni,_preco,_fornecid);


                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Produtos/Create
        public ActionResult Create()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            ViewBag.Fornecedores = db.stp_ProviderSPList();

            return View();
        }

        // POST: Produtos/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                string _nome = collection["Nome"];
                string _uni = collection["Unidade"];
                int _fornecid = Convert.ToInt32(collection["fornecedoreid"]);
                decimal _preco = Convert.ToDecimal(collection["Preco"]);

                DeloitteNFEntities db = new DeloitteNFEntities();
                IEnumerable<stp_ProductsInsert_Result> resp = db.stp_ProductsInsert(_nome, _uni, _preco, _fornecid);

                return RedirectToAction("Index");

            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Delete/5
        public ActionResult Delete(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stpProductsId_Result> resp = db.stpProductsId(id);

            return View(resp.FirstOrDefault());
        }

        // POST: Clientes/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_STPProductsDelete(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }

    }
}
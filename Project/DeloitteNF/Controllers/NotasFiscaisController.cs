using DeloitteNF.Areas.rootAPI;
using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace DeloitteNF.Controllers.Front
{
    public class NotasFiscaisController : Controller
    {
        [BasicAuthentication]
        public ActionResult Index()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            return View(db.stp_InvoiceList());
        }

        // GET: NotasFiscais/Details/5
        public ActionResult Details(int id)
        {

            DeloitteNFEntities db = new DeloitteNFEntities();

            ViewBag.Produtos = db.stp_ProductsList()
                                .Select(d => new
                                {
                                    Produto_id = d.Produto_id,
                                    Name = d.nomeprod + " - " + d.nomefornec + " - " + d.Unidade + " - " + d.Preco
                                });

              IEnumerable<stp_InvoiceItemList_Result> orespitens = db.stp_InvoiceItemList(id);

             ViewBag.Itens = db.stp_InvoiceItemList(id);
             ViewBag.TotalNF = orespitens.Sum(x => x.Total);

            return View(db.stp_InvoiceID(id).FirstOrDefault());

        }

        // GET: NotasFiscais/Create
        public ActionResult CreateItem(int id)
        {

            DeloitteNFEntities db = new DeloitteNFEntities();

            ViewBag.Produtos = db.stp_ProductsList()
                                .Select(d => new
                                {
                                    Produto_id = d.Produto_id,
                                    Name = d.nomeprod + " - " + d.nomefornec + " - " + d.Unidade + " - " + d.Preco
                                });


            stp_InvoiceID_Result oresp = db.stp_InvoiceID(id).FirstOrDefault();

            ViewBag.NFid = oresp.NotaFiscal_id;
            ViewBag.Data = oresp.Data;
            ViewBag.Nome = oresp.Nome;

            IEnumerable<stp_InvoiceItemList_Result> orespitens = db.stp_InvoiceItemList(id);

            ViewBag.Itens = db.stp_InvoiceItemList(id);
            ViewBag.TotalNF = orespitens.Sum(x => x.Total);

            return View();

        }

        // POST: NotasFiscais/CreateItem
        [HttpPost]
        public ActionResult CreateItem(int id,FormCollection collection)
        {
            try
            {

                string nfid = collection["nfid"];
                string prodid = collection["prodid"];
                string quant = collection["Quantidade"];

      

                int i;
                int? _nfid = int.TryParse(nfid, out i) ? (int?)i : null;
                int? _prodid = int.TryParse(prodid, out i) ? (int?)i : null;
                int? _quant = int.TryParse(quant, out i) ? (int?)i : 0;

                DeloitteNFEntities db = new DeloitteNFEntities();
                decimal? preco = db.stp_ProductsList().Where(x=> x.Produto_id == _prodid).FirstOrDefault().Preco;

                db.stp_InvoiceItemsInsert(_nfid, _prodid, _quant, preco);

                return RedirectToAction("CreateItem", new { id = nfid });

            }
            catch
            {
                return View();
            }
        }

        // GET: NotasFiscais/Create
        public ActionResult Create()
        {

            DeloitteNFEntities db = new DeloitteNFEntities();

            ViewBag.Clientes = db.stp_ClientesResList();

            return View();
        }

        // POST: NotasFiscais/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                string roleValue1 = collection["clientid"];

                DeloitteNFEntities db = new DeloitteNFEntities();

                int i;
                int? temp = int.TryParse(roleValue1, out i) ? (int?)i : null;

                IEnumerable<stp_InvoiceInsertRes_Result>  oresp = db.stp_InvoiceInsert(temp);
                
                return RedirectToAction("CreateItem", new { id = oresp.ToList().FirstOrDefault().NotaFiscal_Id });

            }
            catch
            {
                return View();
            }
        }



        // GET: NotasFiscais/Edit/5
        public ActionResult Edit(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            ViewBag.Produtos = db.stp_ProductsList()
                                .Select(d => new
                                {
                                    Produto_id = d.Produto_id,
                                    Name = d.nomeprod + " - " + d.nomefornec + " - " + d.Unidade + " - " + string.Format("{0:C}", d.Preco)
                                });

            IEnumerable<stp_InvoiceItemList_Result> orespitens = db.stp_InvoiceItemList(id);

            ViewBag.Itens = db.stp_InvoiceItemList(id);
            ViewBag.TotalNF = orespitens.Sum(x => x.Total);

            return View(db.stp_InvoiceID(id).FirstOrDefault());

        }

        public ActionResult EditEmissao(int id)
        {
            try
            {

                DeloitteNFEntities db = new DeloitteNFEntities();

                db.stp_InvoiceEmitir(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: NotasFiscais/Delete/5
        public ActionResult Delete(int id)
        {

            DeloitteNFEntities db = new DeloitteNFEntities();

            ViewBag.Produtos = db.stp_ProductsList()
                                .Select(d => new
                                {
                                    Produto_id = d.Produto_id,
                                    Name = d.nomeprod + " - " + d.nomefornec + " - " + d.Unidade + " - " + d.Preco
                                });

            IEnumerable<stp_InvoiceItemList_Result> orespitens = db.stp_InvoiceItemList(id);

            ViewBag.Itens = db.stp_InvoiceItemList(id);
            ViewBag.TotalNF = orespitens.Sum(x => x.Total);

            return View(db.stp_InvoiceID(id).FirstOrDefault());
        }

        // POST: NotasFiscais/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_InvoiceDelete(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult DeleteItem(int id, int idnf)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_InvoiceItemsDelete(id);

                return RedirectToAction("CreateItem", new { id = idnf });
            }
            catch
            {
                return View();
            }
        }

    }
}

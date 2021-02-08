using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DeloitteNF.Areas.rootAPI.Controllers
{
    public class NotasFiscaisController : ApiController
    {
        // GET: NotasFiscais
        [Route("api/NotasFiscais")]
        public IEnumerable<stp_InvoiceList_Result> Get()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            return db.stp_InvoiceList();
        }

        // GET: NotasFiscais
        [Route("api/NotasFiscais/{id}")]
        public Models.NFGet Get(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            Models.NFGet oresp = new Models.NFGet()
            {
                nf = db.stp_InvoiceID(id).FirstOrDefault(),
                itensnf = db.stp_InvoiceItemList(id)
            };

            return oresp;
        }

    }
}

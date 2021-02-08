using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DeloitteNF.Areas.rootAPI.Controllers
{
    [BasicAuthentication]
    public class FornecedoresController : ApiController
    {
        // GET: api/Fornecedores
        [Route("api/Fornecedores")]
        public IEnumerable<stp_ProviderSPList_Result> Get()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();

            return db.stp_ProviderSPList();

        }

        // GET: api/Fornecedores/5
        [Route("api/Fornecedores/{id}")]
        public stp_ProvidersId_Result Get(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ProvidersId_Result> resp = db.stp_ProvidersId(id);

            return resp.FirstOrDefault();

        }


        // POST: api/Fornecedores
        [Route("api/Fornecedores")]
        public decimal? Post([FromBody]stp_ProvidersId_Result value)
        {

            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ProvidersInsert_Result> resp = db.stp_ProvidersInsert(value.Nome);

            return resp.FirstOrDefault().Fornecedor_Id;
        }

        // PUT: api/Fornecedores/5
        [Route("api/Fornecedores/{id}")]
        public bool Put(int id, [FromBody]stp_ProvidersId_Result value)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            try
            {
                db.stp_ProvidersUpdate(id, value.Nome);
                return true;
            }
            catch
            {
                return false;
            }
        }

        // DELETE: api/Fornecedores/5
        [Route("api/Fornecedores/{id}")]
        public bool Delete(int id)
        {

            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_ProvidersDelete(id);

                return true;
            }
            catch
            {
                return false;
            }

        }
    }
}

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
    public class ClientesController : ApiController
    {
        // GET: api/Clientes
        [Route("api/Clientes")]
        public IEnumerable<stp_ClientesResList_Result> Get()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            return db.stp_ClientesResList();

        }

        // GET: api/Clientes/5
        [Route("api/Clientes/{id}")]
        public stp_ClientsId_Result Get(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ClientsId_Result> resp = db.stp_ClientsId(id);

            return resp.FirstOrDefault();

        }

        [Route("api/Clientes")]
        public decimal? Post([FromBody]stp_ClientsId_Result value)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ClientsInsert_Result> resp = db.stp_ClientsInsert(value.Nome, value.Endereço,value.Tipo);

            return resp.FirstOrDefault().Cliente_Id;
        }

        [Route("api/Clientes/{id}")]
        public bool Put(int id, [FromBody]stp_ClientsId_Result value)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            try
            { 
                db.stp_ClientsUpdate(id, value.Nome, value.Endereço, value.Tipo);
                return true;
            }
            catch
            {
                return false;
            }
        }

        // GET: api/Clientes/5
        [Route("api/Clientes/{id}")]
        public bool Delete(int id)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_ClientsDelete(id);

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

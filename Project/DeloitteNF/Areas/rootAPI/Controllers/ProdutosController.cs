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
    public class ProdutosController : ApiController
    {
        // GET: api/Produtos
        [Route("api/Produtos")]
        public IEnumerable<stp_ProductsList_Result> Get()
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            return db.stp_ProductsList();
        }

        // GET: api/Produtos/5
        [Route("api/Produtos/{id}")]
        public stpProductsId_Result Get(int id)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stpProductsId_Result> resp = db.stpProductsId(id);

            return resp.FirstOrDefault();

        }

        // POST: api/Produtos
        [Route("api/Produtos")]
        public decimal? Post([FromBody]stpProductsId_Result value)
        {


            DeloitteNFEntities db = new DeloitteNFEntities();
            IEnumerable<stp_ProductsInsert_Result> resp = db.stp_ProductsInsert(value.nomeprod, value.Unidade, value.Preco, value.Fornecedor_id);

            return resp.FirstOrDefault().Produto_Id;



        }

        // PUT: api/Produtos/5
        [Route("api/Produtos/{id}")]
        public bool Put(int id, [FromBody]stpProductsId_Result value)
        {
            DeloitteNFEntities db = new DeloitteNFEntities();
            try
            {
                db.stp_ProductsUpdate(id, value.nomeprod, value.Unidade, value.Preco, value.Fornecedor_id);
                return true;
            }
            catch
            {
                return false;
            }

        }

        // DELETE: api/Produtos/5
        [Route("api/Produtos/{id}")]
        public bool Delete(int id)
        {
            try
            {
                DeloitteNFEntities db = new DeloitteNFEntities();
                db.stp_STPProductsDelete(id);

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

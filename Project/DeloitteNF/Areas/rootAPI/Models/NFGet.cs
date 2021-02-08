using DeloitteNF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DeloitteNF.Areas.rootAPI.Models
{
    public class NFGet
    {

        public stp_InvoiceID_Result nf { get; set; }
        public IEnumerable<stp_InvoiceItemList_Result> itensnf { get; set; }

    }
}
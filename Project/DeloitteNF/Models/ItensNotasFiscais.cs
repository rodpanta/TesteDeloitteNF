//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DeloitteNF.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ItensNotasFiscais
    {
        public int ItemNotaFiscal_id { get; set; }
        public int NotaFiscal_id { get; set; }
        public int Quantidade { get; set; }
        public decimal Total { get; set; }
        public int Produto_id { get; set; }
    
        public virtual NotasFiscais NotasFiscais { get; set; }
        public virtual Produtos Produtos { get; set; }
    }
}

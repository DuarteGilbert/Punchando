//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PsDataCore.Mods.Pos
{
    using System;
    using System.Collections.Generic;
    
    public partial class VENTAS_DETALLE
    {
        public int VENTAID { get; set; }
        public int SERVICIOID { get; set; }
        public decimal CANTIDAD { get; set; }
        public decimal PRECIO { get; set; }
        public decimal CARGO { get; set; }
        public decimal TOTAL { get; set; }
        public Nullable<decimal> DESCUENTO { get; set; }
    
        public virtual SERVICIOS SERVICIOS { get; set; }
        public virtual VENTAS VENTAS { get; set; }
    }
}

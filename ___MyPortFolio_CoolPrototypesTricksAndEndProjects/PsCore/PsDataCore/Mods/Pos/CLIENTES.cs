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
    
    public partial class CLIENTES
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CLIENTES()
        {
            this.VENTAS = new HashSet<VENTAS>();
        }
    
        public int PERSONAID { get; set; }
        public Nullable<decimal> GASTADO { get; set; }
        public Nullable<decimal> ADEUDADO { get; set; }
        public Nullable<decimal> GANADO { get; set; }
        public Nullable<decimal> CREDITO { get; set; }
        public Nullable<int> SUCURSALID { get; set; }
        public Nullable<int> CODIGO { get; set; }
    
        public virtual COMPANIA_SUCURSALES COMPANIA_SUCURSALES { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VENTAS> VENTAS { get; set; }
    }
}

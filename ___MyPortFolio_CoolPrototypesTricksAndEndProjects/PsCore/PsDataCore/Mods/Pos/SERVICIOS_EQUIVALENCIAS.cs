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
    
    public partial class SERVICIOS_EQUIVALENCIAS
    {
        public int ID { get; set; }
        public Nullable<int> UNIDAD_MAESTRAID { get; set; }
        public Nullable<int> UNIDAD_DETALLEID { get; set; }
        public Nullable<int> EQUIVALENCIA { get; set; }
        public Nullable<int> SERVICIOID { get; set; }
    
        public virtual SERVICIOS SERVICIOS { get; set; }
        public virtual SERVICIOS_UNIDADES SERVICIOS_UNIDADES { get; set; }
        public virtual SERVICIOS_UNIDADES SERVICIOS_UNIDADES1 { get; set; }
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PsDataCore.Mods.Seg
{
    using System;
    using System.Collections.Generic;
    
    public partial class BARRIOS_PARAJES
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BARRIOS_PARAJES()
        {
            this.SUBBARRIOS = new HashSet<SUBBARRIOS>();
        }
    
        public int ID { get; set; }
        public string CODIGO { get; set; }
        public string NOMBRE { get; set; }
        public Nullable<int> SECCIONID { get; set; }
    
        public virtual SECCIONES SECCIONES { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SUBBARRIOS> SUBBARRIOS { get; set; }
    }
}

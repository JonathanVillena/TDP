//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MDM.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Opcion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Opcion()
        {
            this.Respuesta = new HashSet<Respuesta>();
        }
    
        public int IdOpcion { get; set; }
        public string Descripcion { get; set; }
        public Nullable<int> IdPregunta { get; set; }
        public Nullable<int> IdNivel { get; set; }
    
        public virtual Nivel Nivel { get; set; }
        public virtual Pregunta Pregunta { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Respuesta> Respuesta { get; set; }
    }
}

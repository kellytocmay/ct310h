//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EcomNet.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class order_items
    {
        public int order_item_id { get; set; }
        public int quantity_in_order { get; set; }
        public int id_order { get; set; }
        public int id_product { get; set; }
    
        public virtual order order { get; set; }
        public virtual product product { get; set; }
    }
}

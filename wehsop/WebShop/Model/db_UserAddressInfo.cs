//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebShop.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class db_UserAddressInfo
    {
        public db_UserAddressInfo()
        {
            this.db_OrderInfo = new HashSet<db_OrderInfo>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string phone { get; set; }
        public string ZipCode { get; set; }
        public Nullable<bool> isMain { get; set; }
        public int UserId { get; set; }
        public string proviceAndCity { get; set; }
        public string Gtel { get; set; }
    
        public virtual ICollection<db_OrderInfo> db_OrderInfo { get; set; }
        public virtual db_UserInfo db_UserInfo { get; set; }
    }
}
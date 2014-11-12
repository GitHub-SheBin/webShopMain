using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebShop.Model;
using System.Reflection;
using System.Text;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace WebShop.BLL
{
    public  static class publicBLL
    {

         public static webshopDBEntities  getdbContext()
        {

            return new webshopDBEntities();

       }

       /// <summary>
       /// 检查登录
       /// </summary>
       public static void ChkManage()
       {
           HttpContext context = System.Web.HttpContext.Current;
           bool IsAdmin = false;

           if (context.Session["Admin_UserName"] != null)
           {
               if (!string.IsNullOrEmpty(context.Session["Admin_UserName"].ToString()))
               {
                   IsAdmin = true;
               }
           }
           if (!IsAdmin)
           {
               context.Response.Write("<script language=\"javascript\">window.parent.location.href='Login.aspx';</script>");
               context.Response.End();
           }
       }

        
       public static string md5_pwd(this string str_pwd)
       {
           string return_str = "";
           MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
           return_str = BitConverter.ToString(md5.ComputeHash(UTF8Encoding.Default.GetBytes(str_pwd)));
           return_str = return_str.Replace("-", "");
           return return_str;
       }


       /// <summary>
       /// list转dataTable
       /// </summary>
       /// <typeparam name="T"></typeparam>
       /// <param name="entitys"></param>
       /// <returns></returns>
       public static DataTable ListToDataTable<T>(List<T> entitys)
       {
           //检查实体集合不能为空
           if (entitys == null || entitys.Count < 1)
           {
               return null;
           }
           //取出第一个实体的所有Propertie
           Type entityType = entitys[0].GetType();
           PropertyInfo[] entityProperties = entityType.GetProperties();

           //生成DataTable的structure
           //生产代码中，应将生成的DataTable结构Cache起来，此处略
           DataTable dt = new DataTable();
           for (int i = 0; i < entityProperties.Length; i++)
           {
               //dt.Columns.Add(entityProperties[i].Name, entityProperties[i].PropertyType);
               dt.Columns.Add(entityProperties[i].Name);
           }
           //将所有entity添加到DataTable中
           foreach (object entity in entitys)
           {
               //检查所有的的实体都为同一类型
               if (entity.GetType() != entityType)
               {
                   return null;
               }
               object[] entityValues = new object[entityProperties.Length];
               for (int i = 0; i < entityProperties.Length; i++)
               {
                   entityValues[i] = entityProperties[i].GetValue(entity, null);
               }
               dt.Rows.Add(entityValues);
           }
           return dt;
       }


       /// <summary>
       /// 随机生成N位随机数
       /// </summary>
       public static string createRnd(int inLength)
       {
           string allChar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,W,X,Y,Z";
           string[] allCharArray = allChar.Split(',');
           string outString = "";
           int temp = -1;

           Random rand = new Random();

           for (int i = 0; i < inLength; i++)
           {
               if (temp != -1)
               {
                   rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
               }
               int t = rand.Next(35);
               if (temp == t)
               {
                   return createRnd(inLength);
               }
               temp = t;
               outString += allCharArray[t];
           }
           return outString;
       }


        /// <summary>
        /// 对实体类中create系列和update系列进行赋值
        /// isCreate为true时，表示为创建实体类操作，将create系列属性赋值
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="isCreate"></param>
       public static void updateOrCreate(this object obj,bool isCreate) {
           Type tempType = obj.GetType();
           PropertyInfo createAdminId = tempType.GetProperty("createAdminId");
           PropertyInfo createAdminName = tempType.GetProperty("createAdminName");
           PropertyInfo createTime = tempType.GetProperty("createTime");
           PropertyInfo updateAdminId = tempType.GetProperty("updateAdminId");
           PropertyInfo updateTime = tempType.GetProperty("updateTime");
           HttpContext context = System.Web.HttpContext.Current;

           if (context.Session["Admin_UserName"]!=null) {
               var tempName = context.Session["Admin_UserName"].ToString();
               var tempItem = getdbContext().db_AdminInfo.Where(o => o.AdminName == tempName).FirstOrDefault();
               if(tempItem!=null){
                   updateAdminId.SetValue(obj, tempItem.Id, null);
                   updateTime.SetValue(obj, DateTime.Now, null);
                   if(isCreate){
                       createAdminId.SetValue(obj, tempItem.Id, null);
                       createAdminName.SetValue(obj, tempItem.AdminName, null);
                       createTime.SetValue(obj, DateTime.Now, null);
                   }
               }
           
           }

           
       }


        /// <summary>
        /// id的扩展方法，根据类型返回实体类
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="id"></param>
        /// <param name="enity"></param>
        /// <returns></returns>
       public static T getEnityById<T>(this int id) {
           var context = getdbContext();
          return (T)context.Set(typeof(T)).Find(id);
       }

       public static T getEnityById<T>(this int id, webshopDBEntities context)
       {

           return (T)context.Set(typeof(T)).Find(id);
       }

        /// <summary>
        /// 泛型分页方法
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="StartRecordIndex"></param>
        /// <param name="EndRecordIndex"></param>
        /// <param name="lam"></param>
        /// <returns></returns>
       public static List<T> getPageByT<T>(int StartRecordIndex,int EndRecordIndex,Func<T,int> lam) {
           var context = getdbContext();
           return context.Set(typeof(T)).OfType<T>().OrderBy(lam).Skip(StartRecordIndex - 1).Take(EndRecordIndex - StartRecordIndex+1).ToList<T>();
       }

       public static List<T> getPageByT<T>(int StartRecordIndex, int EndRecordIndex, Func<T, bool> WhereLam, Func<T, int> lam)
       {
           var context = getdbContext();
           return context.Set(typeof(T)).OfType<T>().Where(WhereLam).OrderBy(lam).Skip(StartRecordIndex - 1).Take(EndRecordIndex - StartRecordIndex + 1).ToList<T>();
       }

      /// <summary>
      /// 
      /// </summary>
      /// <typeparam name="T"></typeparam>
      /// <param name="lam"></param>
      /// <returns></returns>
       public static int getWhereCount<T>(Func<T,bool> lam) {
           var context = getdbContext();
           return context.Set(typeof(T)).OfType<T>().Where(lam).Count();
       }


       public static List<T> getWhereList<T>(Func<T,bool> lam) {
           var context = getdbContext();
           return context.Set(typeof(T)).OfType<T>().Where(lam).ToList<T>();
       }

       public static List<T> getWhereList<T>(Func<T, bool> lam,Func<T,object> order,bool orderType)
       {
           var context = getdbContext();
           if (orderType)
           {
               return context.Set(typeof(T)).OfType<T>().Where(lam).OrderBy(order).ToList<T>();
           }
           else {
               return context.Set(typeof(T)).OfType<T>().Where(lam).OrderByDescending(order).ToList<T>();
           }
           
       }

       public static List<T> getOrdePagerByList<T>(int StartRecordIndex,int EndRecordIndex,Func<T,bool> WhereLam,Func<T,object> OrderLam) {
           var context = getdbContext();
           return context.Set(typeof(T)).OfType<T>().Where(WhereLam).OrderBy(OrderLam).Skip(StartRecordIndex - 1).Take(EndRecordIndex - StartRecordIndex + 1).ToList<T>();
       
       }

       public static List<T> getOrdePagerByList<T>(int StartRecordIndex, int EndRecordIndex, Func<T, bool> WhereLam, Func<T, object> OrderLam,bool orderType)
       {
           var context = getdbContext();
           if (orderType)
           {
               return context.Set(typeof(T)).OfType<T>().Where(WhereLam).OrderBy(OrderLam).Skip(StartRecordIndex - 1).Take(EndRecordIndex - StartRecordIndex + 1).ToList<T>();
           }
           else {
               return context.Set(typeof(T)).OfType<T>().Where(WhereLam).OrderByDescending(OrderLam).Skip(StartRecordIndex - 1).Take(EndRecordIndex - StartRecordIndex + 1).ToList<T>();
           
           }
       }

       public static bool deleteSomeItemBYT<T>(Func<T,bool> lam) {
           var context = getdbContext();
           var tempList = getWhereList<T>(lam);
           foreach(var item in tempList){
               context.Set(typeof(T)).Remove(item);
           }
           try
           {
               context.SaveChanges();
               return true;
           }
           catch {
               return false;
           }
       }


        /// <summary>
        /// 根据id来删除其外键表对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="lam"></param>
       public static void deleteSomeItemWhereHaveImgBYT<T>(Func<T, bool> lam)
       {
           var context = getdbContext();
           var tempList = getWhereList<T>(lam);
         
          
           foreach (var item in tempList)
           {
               deleteImg(item);
               context.Set(typeof(T)).Remove(item);
           }
           try
           {
               context.SaveChanges();
           }
           catch { 
           }
       }


       public static bool deleteItemById<T>(int id) {
           var context = getdbContext();
           var tempItem = context.Set(typeof(T)).Find(id);
          
           try {
               context.Set(typeof(T)).Remove(tempItem);
               context.SaveChanges();
               return true;
           }
           catch {
               return false;
           }
       }

       public static bool RealdeleteItem<T>(Func<T,bool> where) {
           var context = getdbContext();
           var tempItem = context.Set(typeof(T)).OfType<T>().Where(where).ToList<T>();

           try
           {
               foreach(var item in tempItem){
                   context.Set(typeof(T)).Remove(item);
               }
              
               context.SaveChanges();
               return true;
           }
           catch
           {
               return false;
           }
       
       }

       public static bool deleteItemHaveImgById<T>(int id) {
           var context = getdbContext();
           var tempItem = context.Set(typeof(T)).Find(id);
           
           try
           {
               deleteImg(tempItem);
               context.Set(typeof(T)).Remove(tempItem);
               context.SaveChanges();
               return true;
           }
           catch {
               return false;
           }
       
       }


       public static bool deleteImg<T>(T Item) {
           Type tempType = Item.GetType();
           PropertyInfo imgUrl = tempType.GetProperty("imgUrl");
           string tempUrl = imgUrl.GetValue(Item, null).ToString() ;
           if(File.Exists(HttpContext.Current.Server.MapPath(tempUrl))){
               File.Delete(tempUrl);
               return true;
           }
           return false;
       }




       public static bool IsDeleteByT<T>(Func<T,bool> lam) {
           Type tempType = typeof(T);
           PropertyInfo IsDelete = tempType.GetProperty("isDelete");
           var context = getdbContext();
           List<T> tempList = context.Set(tempType).OfType<T>().Where(lam).ToList<T>();
           for (var i = 0; i < tempList.Count();i++) {
               IsDelete.SetValue(tempList[i], 1, null);
           }
           try {
               context.SaveChanges();
               return true;
           }
           catch {
               return false;
           }

       }





       public static void AddListItem<T>(this DropDownList list,Func<T,bool> lam) {
           List<T> tempList = getWhereList<T>(lam);
           list.Items.Add(new ListItem("无",string.Empty));
           Type tempT = typeof(T);
           PropertyInfo name = tempT.GetProperty("name");
           PropertyInfo id = tempT.GetProperty("id");
           foreach(var item in tempList){
               list.Items.Add(new ListItem(name.GetValue(item,null).ToString(),id.GetValue(item,null).ToString()));
           }
        
       }
    }
    }

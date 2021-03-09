using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api.Authentication
{
    public class Login
    {

        public static Models.Kullanicilar login(string user, string password)
        {
            using (Models.tdbilisimContext db = new Models.tdbilisimContext())
            {
                var kullanici = db.Kullanicilars.Where(p => p.KullaniciAdi == user && p.Sifre == password).FirstOrDefault();
                return kullanici;
            }
        }
    }
}
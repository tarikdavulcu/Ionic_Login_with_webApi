using api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace api.Controllers
{
    public class KullanicilarController : ApiController
    {
        Models.tdbilisimContext db = null;

        public KullanicilarController()
        {
            db = new Models.tdbilisimContext();
        }

        [Authorize]
        public List<Kullanicilar> GetKullanicilar() {
            List<Kullanicilar> getKullList = db.Kullanicilars.ToList();
            return getKullList;
        }

    }
}

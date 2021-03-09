using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Security.Claims;

namespace api.Authentication
{
    public class Saglayici:OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin",new[] {"*" });
            // buradda bi login medotu ekleyecez
            Models.Kullanicilar user = new Models.Kullanicilar();
            user = Authentication.Login.login(context.UserName, context.Password);
            if (user!=null)
            {
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim("name",user.KullaniciAdi));
                identity.AddClaim(new Claim("ID",user.KullaniciID.ToString()));
                identity.AddClaim(new Claim("Pwd",user.Sifre));
                context.Validated(identity);
            }
            else
            {
                context.SetError("Geçersiz İster","Hatalı Kullanıcı Bilgisi");
            }
        }
    }
}
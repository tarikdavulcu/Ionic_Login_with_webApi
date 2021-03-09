using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using api.Models.Mapping;

namespace api.Models
{
    public partial class tdbilisimContext : DbContext
    {
        static tdbilisimContext()
        {
            Database.SetInitializer<tdbilisimContext>(null);
        }

        public tdbilisimContext()
            : base("Name=tdbilisimContext")
        {
        }

        public DbSet<Kullanicilar> Kullanicilars { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new KullanicilarMap());
        }
    }
}

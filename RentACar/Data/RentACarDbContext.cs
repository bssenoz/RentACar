using System.Data.Entity; // EF 6 kullanıyorsan
using RentACar.Models;

namespace RentACar.Data
{
    public class RentACarDbContext : DbContext
    {
        public RentACarDbContext() : base("name=DefaultConnection") { }

        public DbSet<CarRequest> CarRequests { get; set; }
    }
}
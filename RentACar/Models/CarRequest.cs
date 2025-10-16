using System;
using System.ComponentModel.DataAnnotations;

namespace RentACar.Models
{
    public class CarRequest
    {
        [Key]
        public int Id { get; set; }

        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string CarType { get; set; }
        public string CarModel { get; set; }
    }
}
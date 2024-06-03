using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using YigitProject.Models;
using Newtonsoft.Json;
namespace YigitProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VoucherController : Controller
    {
        [HttpPost]
        public IActionResult Voucher(List<VoucherModel> vouchers)
        {         
            foreach (var voucher in vouchers)
            {
                Console.WriteLine($"Metin: {voucher.Description}");
                Console.WriteLine($"Koordinatlar: x={voucher.boundingPoly.Vertices[0].X}, y={voucher.boundingPoly.Vertices[0].Y}");
                Console.WriteLine();
            }
            return Json(vouchers);
        }
    }
}

using Microsoft.AspNetCore.Mvc;
using YigitProject.Models;
namespace YigitProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VoucherController : Controller
    {
        [HttpPost]
        public IActionResult Voucher(List<VoucherModel> vouchers)
        {
            string description = vouchers[0].Description;

            List<string> lines = new List<string>(description.Split('\n'));

            foreach (string line in lines)
            {
                Console.WriteLine(line);
            }
            return Json(vouchers);
        }
    }
}

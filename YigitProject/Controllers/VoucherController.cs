using Microsoft.AspNetCore.Mvc;
using YigitProject.Models;

namespace YigitProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VoucherController : Controller
    {
        [HttpPost]
        public IActionResult Voucher(List<VoucherModel> voucher)
        {
            return Json(voucher);
        }
    }
}

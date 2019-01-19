using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace app.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly ILogger<HomeController> _logger;
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        // GET api/values
        [HttpGet]
        public ActionResult<string> Get()
        {
            _logger.LogInformation(default(EventId), $"Üretilen değer: {Guid.NewGuid().ToString("N")}");
            return "Hello World!";
        }
    }
}

using Microsoft.AspNetCore.Mvc;
using RepositoryLayer;

namespace cantina.Controllers
{
    [Route("api/[controller]")]
    public class SampleDataController : Controller
    {
        [HttpGet("[action]")]
        public ActionResult WeatherForecasts()
        {
            var result = _repository.GetEmployeeList();
            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }

        IRepository _repository;
        public SampleDataController(IRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public ActionResult GetEmployeeList()
        {
            return null;
        }

        public class WeatherForecast
        {
            public string DateFormatted { get; set; }
            public int TemperatureC { get; set; }
            public string Summary { get; set; }

            public int TemperatureF
            {
                get
                {
                    return 32 + (int)(TemperatureC / 0.5556);
                }
            }
        }
    }
}

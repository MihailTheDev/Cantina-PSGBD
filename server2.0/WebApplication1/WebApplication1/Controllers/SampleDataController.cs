using Microsoft.AspNetCore.Mvc;
using Repositories;
using System;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    public class SampleDataController : Controller
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        IMenuRepository _repo;

        public SampleDataController(IMenuRepository repository)
        {
            _repo = repository;

        }

        [HttpGet("[action]")]
        public Object WeatherForecasts()
        {

            _repo.GenerateMenu();
            return _repo.GetMenuList();

        }
    }
}

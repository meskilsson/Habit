using HabitApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace HabitApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ActivitiesController : ControllerBase
{
    [HttpGet]
    public ActionResult<Activity> GetActivity()
    {
        var activity = new Activity
        {
            Id = 1,
            Name = "Go for a 30 minute walk",
            IsCompleted = false
        };

        return Ok(activity);
    }
}
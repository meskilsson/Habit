using HabitApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace HabitApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ActivitiesController : ControllerBase
{
    private static readonly List<Activity> activities =
    [
        new Activity
        {
            Id = 1,
            Name = "Go for a walk",
            IsCompleted = false
        },
        new Activity
        {
            Id = 2,
            Name = "Read for 30 minutes",
            IsCompleted = true
        }
    ];

    [HttpGet]
    public ActionResult<List<Activity>> GetActivities()
    {
        return Ok(activities);
    }

    [HttpGet("{id}")]
    public ActionResult<Activity> GetActivity(int id)
    {
        var activity = activities.FirstOrDefault(a => a.Id == id);

        if (activity == null)
        {
            return NotFound();
        }

        return Ok(activity);
    }
}
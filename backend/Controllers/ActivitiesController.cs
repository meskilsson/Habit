using HabitApi.Entities;
using Microsoft.AspNetCore.Mvc;
using HabitApi.Services.Activities;
using HabitApi.DTOs.Activities;

namespace HabitApi.Controllers;


[ApiController]
[Route("api/[controller]")]
public class ActivitiesController : ControllerBase
{

    private readonly IActivityService _activityService;

    public ActivitiesController(IActivityService activityService)
    {
        _activityService = activityService;
    }

    [HttpGet]
    public async Task<ActionResult<List<Activity>>> GetActivities()
    {
        var result = await _activityService.GetAllAsync();

        return Ok(result);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Activity>> GetActivity(int id)
    {
        var activity = await _activityService.GetByIdAsync(id);

        if (activity == null)
        {
            return NotFound();
        }

        return Ok(activity);
    }

    [HttpPost]
    public async Task<ActionResult<Activity>> CreateActivity(CreateActivityDto dto)
    {
        var activity = await _activityService.CreateAsync(dto);

        return CreatedAtAction(
            nameof(GetActivity),
            new { id = activity.Id },
            activity
        );
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<Activity>> UpdateActivity(int id, UpdateActivityDto dto)
    {
        var activity = await _activityService.UpdateAsync(id, dto);

        if (activity == null)
        {
            return NotFound();
        }

        return Ok(activity);
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteActivity(int id)
    {
        var deleted = await _activityService.DeleteAsync(id);

        if (!deleted)
        {
            return NotFound();
        }

        return NoContent();
    }

    [HttpDelete]
    public async Task<IActionResult> DeleteAllActivities()
    {
        await _activityService.DeleteAllAsync();

        return NoContent();
    }
}
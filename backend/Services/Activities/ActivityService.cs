using HabitApi.Data;
using HabitApi.DTOs.Activities;
using HabitApi.Entities;
using Microsoft.EntityFrameworkCore;

namespace HabitApi.Services.Activities;


public class ActivityService : IActivityService
{
    private readonly AppDbContext _context;

    public ActivityService(AppDbContext context)
    {
        _context = context;
    }

    public async Task<List<Activity>> GetAllAsync()
    {
        return await _context.Activities
        .OrderBy(activity => activity.Id)
        .ToListAsync();
    }

    public async Task<Activity?> GetByIdAsync(int id)
    {
        return await _context.Activities.FindAsync(id);
    }

    public async Task<Activity> CreateAsync(CreateActivityDto dto)
    {
        var activity = new Activity
        {
            Name = dto.Name,
            IsCompleted = dto.IsCompleted
        };

        _context.Activities.Add(activity);

        await _context.SaveChangesAsync();

        return activity;
    }
    public async Task<Activity?> UpdateAsync(
    int id,
    UpdateActivityDto dto
)
    {
        var activity = await _context.Activities.FindAsync(id);

        if (activity == null)
        {
            return null;
        }

        activity.Name = dto.Name;
        activity.IsCompleted = dto.IsCompleted;

        await _context.SaveChangesAsync();

        return activity;
    }

    public async Task<bool> DeleteAsync(int id)
    {
        var activity = await _context.Activities.FindAsync(id);

        if (activity == null)
        {
            return false;
        }

        _context.Activities.Remove(activity);

        await _context.SaveChangesAsync();

        return true;
    }

    public async Task<int> DeleteAllAsync()
    {
        var activities = await _context.Activities.ToListAsync();

        _context.Activities.RemoveRange(activities);

        await _context.SaveChangesAsync();

        return activities.Count;
    }
}
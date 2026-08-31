using HabitApi.DTOs.Activities;
using HabitApi.Entities;

namespace HabitApi.Services.Activities;

public interface IActivityService
{
    Task<List<Activity>> GetAllAsync();
    Task<Activity?> GetByIdAsync(int id);

    Task<Activity> CreateAsync(CreateActivityDto dto);

    Task<Activity?> UpdateAsync(int id, UpdateActivityDto dto);

    Task<bool> DeleteAsync(int id);

}
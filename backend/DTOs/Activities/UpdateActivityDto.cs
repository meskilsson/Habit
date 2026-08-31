namespace HabitApi.DTOs.Activities;


public class UpdateActivityDto
{
    public string Name { get; set; } = string.Empty;
    public bool IsCompleted { get; set; }
}
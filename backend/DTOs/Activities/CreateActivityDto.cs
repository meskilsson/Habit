namespace HabitApi.DTOs.Activities;

public class CreateActivityDto
{
    public string Name { get; set; } = string.Empty;
    public bool IsCompleted { get; set; }
}
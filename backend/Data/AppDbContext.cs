using HabitApi.Entities;
using Microsoft.EntityFrameworkCore;

namespace HabitApi.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options)

        // passes options to parent (DbContext)
        : base(options)
    {
    }

    public DbSet<Activity> Activities { get; set; }
}
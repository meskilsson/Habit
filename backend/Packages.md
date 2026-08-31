// EF Core PostgreSQL support package.

dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL

// EF Core's design-time tooling support for migrations.

dotnet add package Microsoft.EntityFrameworkCore.Design

// package that does not store secrets in the repository

dotnet user-secrets init

// CLI-tool

dotnet tool install --global dotnet-ef --version 10.0.11
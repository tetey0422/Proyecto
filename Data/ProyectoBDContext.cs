using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Data
{
    public class ProyectoBDContext : DbContext
    {
        public ProyectoBDContext(DbContextOptions<ProyectoBDContext> options)
            : base(options)
        {
        }

        // Define tus DbSets aquí basados en las tablas de tu base de datos
        public DbSet<Usuario> Usuario { get; set; }
        public DbSet<Empleado> Empleado { get; set; }
        public DbSet<Especialidad> Especialidad { get; set; }
        public DbSet<EmpleoEspecialidad> EmpleadoEspecialidad { get; set; }
        public DbSet<HorarioDisponible> HorarioDisponible { get; set; }
        public DbSet<Cita> Cita { get; set; }
    }
}

namespace CitasAPI.DTO
{
    public class HorarioDisponibleDTO
    {
        public int Id { get; set; }
        public string EmpleadoDocumento { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public string Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaActualizacion { get; set; }
    }
}

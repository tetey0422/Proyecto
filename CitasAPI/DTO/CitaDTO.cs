namespace CitasAPI.DTO
{
    public class CitaDTO
    {
        public int Id { get; set; }
        public string PacienteDocumento { get; set; }
        public string EmpleadoDocumento { get; set; }
        public int? EspecialidadId { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public string Estado { get; set; }
        public string Motivo { get; set; }
        public string Observaciones { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaActualizacion { get; set; }
    }
}

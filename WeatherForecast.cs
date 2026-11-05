namespace WeatherApi
{
    public class WeatherForecast
    {
        public DateOnly Date { get; set; }

        public int TemperatureC { get; set; }

        public string? Summary { get; set; }

        public DateTime UtcTime { get; set; }

        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
    }
}
// File: Models/MongoDBSettings.cs
namespace DotNetMongoCRUDApp.Models
{
    public class MongoDBSettings : IMongoDBSettings
    {
        public string ProductCollectionName { get; set; } = string.Empty;
        public string ConnectionString { get; set; } = string.Empty;
        public string DatabaseName { get; set; } = string.Empty;
    }
}


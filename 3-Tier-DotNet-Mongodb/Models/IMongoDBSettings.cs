// File: Models/IMongoDBSettings.cs
namespace DotNetMongoCRUDApp.Models
{
    public interface IMongoDBSettings
    {
        string ProductCollectionName { get; set; }
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}


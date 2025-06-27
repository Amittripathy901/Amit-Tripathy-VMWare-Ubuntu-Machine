// File: Models/Product.cs
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace DotNetMongoCRUDApp.Models
{
    public class Product
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; } = ObjectId.GenerateNewId().ToString();

        [BsonElement("Name")]
        public string Name { get; set; } = string.Empty;

        [BsonElement("Price")]
        public decimal Price { get; set; } = 0.0M;

        [BsonElement("Category")]
        public string Category { get; set; } = string.Empty;
    }
}


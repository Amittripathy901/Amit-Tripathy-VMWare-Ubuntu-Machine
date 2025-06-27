// File: Services/ProductService.cs
using DotNetMongoCRUDApp.Models;
using MongoDB.Driver;

namespace DotNetMongoCRUDApp.Services
{
    public class ProductService
    {
        private readonly IMongoCollection<Product> _products;

        public ProductService(IMongoDBSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);
            _products = database.GetCollection<Product>(settings.ProductCollectionName);
        }

        public List<Product> GetAllProducts()
        {
            return _products.Find(product => true).ToList();
        }

        public Product GetProductById(string id)
        {
            return _products.Find<Product>(product => product.Id == id).FirstOrDefault();
        }

        public Product CreateProduct(Product product)
        {
            _products.InsertOne(product);
            return product;
        }

        public void UpdateProduct(string id, Product productIn)
        {
            _products.ReplaceOne(product => product.Id == id, productIn);
        }

        public void DeleteProduct(string id)
        {
            _products.DeleteOne(product => product.Id == id);
        }
    }
}


package com.platzi.market.persistance;

import java.util.List;
import java.util.Optional;

import com.platzi.market.domain.Product;
import com.platzi.market.domain.repository.ProductRepository;
import com.platzi.market.persistance.crud.ProductoCrudRepository;
import com.platzi.market.persistance.entities.Producto;
import com.platzi.market.persistance.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductoRepository implements ProductRepository {
    @Autowired
    private ProductoCrudRepository productoCrudRepository;
    @Autowired
    private ProductMapper mapper;

    @Override
    public List<Product> getAll() {
        List<Producto> productos = (List<Producto>) productoCrudRepository.findAll();
        return mapper.toProducts(productos);
    }

    @Override
    public void delete(int productId) {
        productoCrudRepository.deleteById(productId);
    }

    @Override
    public Optional<List<Product>> getByCategory(int categoryId) {
        List<Producto> productos = productoCrudRepository.findByIdCategoriaOrderByNombreAsc(categoryId);
        return Optional.of(mapper.toProducts(productos));
    }

    @Override
    public Optional<List<Product>> getScarsedProducts(int quantity) {
        Optional<List<Producto>> productos = productoCrudRepository.findByStockLessThanAndEstado(quantity,
                true);
        return productos.map(producto -> mapper.toProducts(producto));
    }

    @Override
    public Optional<Product> getProduct(int productId) {
        return productoCrudRepository.findById(productId).map(producto -> mapper.toProduct(producto));
    }

    @Override
    public Product save(Product product) {
        Producto producto = productoCrudRepository.save(mapper.toProducto(product));
        return mapper.toProduct(producto);
    }
}

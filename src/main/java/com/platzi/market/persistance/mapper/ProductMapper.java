package com.platzi.market.persistance.mapper;

import java.util.List;

import com.platzi.market.domain.Product;
import com.platzi.market.persistance.entities.Producto;

import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = { CategoryMapper.class }) // Utiliza el mapper de category para el campo de Category
public interface ProductMapper {
    @Mapping(source = "idProducto", target = "productId")
    @Mapping(source = "nombre", target = "name")
    @Mapping(source = "idCategoria", target = "categoryId")
    @Mapping(source = "precioVenta", target = "price")
    @Mapping(source = "stock", target = "stock")
    @Mapping(source = "estado", target = "active")
    @Mapping(source = "categoria", target = "category")
    Product toProduct(Producto producto);

    // Utiliza el mapper que ya creamos
    List<Product> toProducts(List<Producto> productos);

    @InheritInverseConfiguration
    @Mapping(target = "codigoBarras", ignore = true)
    Producto toProducto(Product product);
}
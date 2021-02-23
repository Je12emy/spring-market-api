package com.platzi.market.persistance.crud;

import java.util.List;
import java.util.Optional;

import com.platzi.market.persistance.entities.Producto;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ProductoCrudRepository extends CrudRepository<Producto, Integer> {
    // @Query(value="SELECT * FROM PRODUCTOS WHERE id_categoria = ?", nativeQuery = true)
    // List<Producto> findByCategoria(int idCategoria);
    
    // QueryMethod
    List<Producto> findByIdCategoriaOrderByNombreAsc(int idCategoria);
    Optional<List<Producto>> findByCantidadStockLessThanAndEstado(int cantidadStock, boolean estado);
}

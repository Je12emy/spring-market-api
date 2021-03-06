package com.platzi.market.persistance.mapper;

import com.platzi.market.domain.Category;
import com.platzi.market.persistance.entities.Categoria;

import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface CategoryMapper {
    @Mapping(source = "idCategoria", target = "categoryId")
    @Mapping(source = "description", target = "category")
    @Mapping(source = "estado", target = "active")
    Category toCategory(Categoria categoria);

    @InheritInverseConfiguration
    @Mapping(target = "productos", ignore = true)
    Categoria toCategoria(Category category);
}

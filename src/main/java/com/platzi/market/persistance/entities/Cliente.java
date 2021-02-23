package com.platzi.market.persistance.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CLIENTES")
public class Cliente {
    @Id
    private String id;
    
    private String nombre;

    private String apellidos;

    private Integer celular;

    private String direccion;
    @Column(name = "correo_electronico")
    private String correoElectroino;

    @OneToMany(mappedBy = "cliente")
    private List<Compra> compras;
}

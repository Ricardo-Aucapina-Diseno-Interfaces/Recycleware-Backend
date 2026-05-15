package com.proyecto.daw.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "usuarios") 
@Data 
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 80)
    private String nombre;

    @Column(nullable = false, length = 9, unique = true)
    private String dni;

    @Column(nullable = false, length = 15)
    private String telefono;

    @Column(nullable = false, length = 80, unique = true)
    private String correo;

    @Column(name = "contrasenia", nullable = false, length = 80)
    private String password;

    @Column(nullable = false, length = 80)
    private String direccion;

    @Column(nullable = false, length = 80)
    private String localidad;

    @Column(name = "codigo_postal", nullable = false, length = 10)
    private String codigoPostal;

    @Column(name = "razon_social", length = 80)
    private String razonSocial;

    @Column(name = "nombre_contacto", length = 80)
    private String nombreContacto;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private Rol rol;

    @Column(name = "estado")
    private String estado = "PENDIENTE";
}
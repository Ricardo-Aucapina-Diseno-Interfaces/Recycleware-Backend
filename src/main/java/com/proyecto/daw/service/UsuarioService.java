package com.proyecto.daw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proyecto.daw.model.Usuario;
import com.proyecto.daw.repository.UsuarioRepository;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public List<Usuario> findAll() {
        return usuarioRepository.findAll();
    }

    public Usuario findById(int id) {
        return usuarioRepository.findById(id);
    }

    public Long count() {
        return usuarioRepository.count();
    }

    public List<Usuario> findByNameContaining(String name) {
        return usuarioRepository.findByNameContaining(name);
    }

    public Usuario save(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public Usuario findByCorreo(String correo) {
        return usuarioRepository.findByCorreo(correo);
    }

    public Usuario actualizarUsuario(Usuario datosNuevos) {
        return usuarioRepository.findById(datosNuevos.getId()).map(usuarioExistente -> {
            if (datosNuevos.getCorreo() != null && !datosNuevos.getCorreo().equals(usuarioExistente.getCorreo())) {
                usuarioExistente.setCorreo(datosNuevos.getCorreo());
            }

            usuarioExistente.setNombre(datosNuevos.getNombre());
            usuarioExistente.setTelefono(datosNuevos.getTelefono());
            usuarioExistente.setDireccion(datosNuevos.getDireccion());
            usuarioExistente.setLocalidad(datosNuevos.getLocalidad());
            usuarioExistente.setCodigoPostal(datosNuevos.getCodigoPostal());
            usuarioExistente.setNombreContacto(datosNuevos.getNombreContacto());
            usuarioExistente.setRazonSocial(datosNuevos.getRazonSocial());


            return usuarioRepository.save(usuarioExistente);
        }).orElse(null);
    }

    public void borrarUsuario(int id){
        Usuario usuario = usuarioRepository.findById(id);
        if (usuario != null)
            usuarioRepository.delete(usuario);
    }
}

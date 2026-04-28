package com.proyecto.daw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import com.proyecto.daw.model.Usuario;
import com.proyecto.daw.service.UsuarioService;

import jakarta.validation.Valid;

@RequestMapping("/usuario")
@RestController
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("")
    public List<Usuario> showUsuarios() {
        return usuarioService.findAll();
    }

    @GetMapping("/{id}")
    public Usuario showUsuario(@PathVariable int id) {
        return usuarioService.findById(id);
    }

    @GetMapping("/count")
    public Map<String, Object> countUsuarios() {
        Map<String, Object> obj = new HashMap<>();
        obj.put("Usuarios", usuarioService.count());

        return obj; 
    }

    @GetMapping("/name/contiene/{cadena}")
    public List<Usuario> showUsuariosNameContiene(@PathVariable("cadena") String name) {
        return usuarioService.findByNameContaining(name);
    }


    @PostMapping("")
    public ResponseEntity<Map<String, Object>> createUsuario(@Valid @RequestBody Usuario usuario) {
        Map<String, Object> response = new HashMap<>();

        if (usuario == null) {
            response.put("error", "El cuerpo de la solicitud no puede estar vacío");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }

        if (usuario.getNombre() == null || usuario.getNombre().trim().isEmpty()
                || usuario.getCorreo() == null || usuario.getCorreo().trim().isEmpty()
                || usuario.getPassword() == null || usuario.getPassword().trim().isEmpty()) {
            response.put("error", "Los campos 'Nombre', 'email' y 'password' son obligatorios");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }

        try {
            String passwordEncriptada = passwordEncoder.encode(usuario.getPassword());
            usuario.setPassword(passwordEncriptada);

            Usuario usuPost = usuarioService.save(usuario);

            response.put("mensaje", "Usuario creado con éxito");
            response.put("insertUsuario", usuPost);
            return ResponseEntity.status(HttpStatus.CREATED).body(response);

        } catch (Exception e) {
            response.put("error", "Error al crear el usuario: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> loginUsuario(@RequestBody Map<String, String> credenciales) {
        String correo = credenciales.get("email");
        String password = credenciales.get("password");

        Map<String, Object> response = new HashMap<>();

        Usuario usuario = usuarioService.findByCorreo(correo);

        if (usuario == null || !passwordEncoder.matches(password, usuario.getPassword())) {
            response.put("error", "Correo o contraseña incorrectos");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }

        response.put("mensaje", "Login exitoso");
        response.put("usuario", usuario);

        return ResponseEntity.ok(response);
    }

    @PutMapping
    public ResponseEntity<Usuario> actualizarUsuario(@RequestBody Usuario usuarioActualizado) {
       
        Usuario usuarioGuardado = usuarioService.actualizarUsuario(usuarioActualizado);

        if (usuarioGuardado == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(usuarioGuardado);
    }

    @PostMapping("/cambiar-password")
    public ResponseEntity<Map<String, Object>> cambiarPassword(@RequestBody Map<String, String> datos) {
        Map<String, Object> response = new HashMap<>();

        int id = Integer.parseInt(datos.get("id"));
        String actual = datos.get("passwordActual");
        String nueva = datos.get("nuevaPassword");

        Usuario usuario = usuarioService.findById(id);

        if (!passwordEncoder.matches(actual, usuario.getPassword())) {
            response.put("error", "La contraseña actual no es correcta.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }

        usuario.setPassword(passwordEncoder.encode(nueva));
        usuarioService.save(usuario);

        response.put("mensaje", "Contraseña actualizada correctamente");
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, String>> deleteUsuario(@PathVariable int id){
        Usuario usuario = usuarioService.findById(id);

        if (usuario == null){
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", "Usuario no encontrado con ID: " + id));
        }

        usuarioService.borrarUsuario(id);
        return ResponseEntity.ok(Map.of("mensaje", "Usuario eliminado con éxito"));
    }
}

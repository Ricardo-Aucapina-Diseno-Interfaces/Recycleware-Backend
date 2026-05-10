package com.proyecto.daw.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proyecto.daw.model.Producto;
import com.proyecto.daw.model.Request;
import com.proyecto.daw.model.RequestState;
import com.proyecto.daw.model.Usuario;
import com.proyecto.daw.repository.RequestRepository;
import com.proyecto.daw.repository.RequestStateRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RequestService {

    @Autowired
    private RequestRepository requestRepository;

    @Autowired
    private RequestStateRepository requestStateRepository;

    @Autowired
    private UsuarioService UsuarioService;

    @Autowired
    private ProductoService productoService;

   
    public List<Request> findAll() {
        return requestRepository.findAll();
    }

 
    public Request crearSolicitud(int idSolicitante, int idProducto, String motivo) {
       
        Usuario solicitante = UsuarioService.findById(idSolicitante);
        Producto producto = productoService.findById(idProducto);

        
        RequestState estadoPendiente = requestStateRepository.findById(1).orElse(null);

        if (solicitante == null || producto == null || estadoPendiente == null) {
            throw new IllegalArgumentException("Error: No se ha encontrado el usuario, el producto o el estado.");
        }

        Request nuevaSolicitud = new Request();
        nuevaSolicitud.setApplicant(solicitante);
        nuevaSolicitud.setProduct(producto);
        nuevaSolicitud.setReason(motivo);
        nuevaSolicitud.setState(estadoPendiente);

        return requestRepository.save(nuevaSolicitud);
    }

    public List<Request> obtenerSolicitudesPorUsuario(int idSolicitante) {
        return requestRepository.findByApplicantId(idSolicitante);
    }

    public Request updateStatus(int idSolicitud, int idNuevoEstado) {
        
        Request solicitud = requestRepository.findById(idSolicitud).orElse(null);
        if (solicitud == null) {
            throw new IllegalArgumentException("Error: No se ha encontrado la solicitud con ID " + idSolicitud);
        }

        RequestState nuevoEstado = requestStateRepository.findById(idNuevoEstado).orElse(null);
        if (nuevoEstado == null) {
            throw new IllegalArgumentException("Error: No se ha encontrado el estado con ID " + idNuevoEstado);
        }

        if (nuevoEstado.getName().equals("Aprobada") || nuevoEstado.getName().equals("Entregada")) {
            productoService.marcarProductoNoDisponibleById(solicitud.getProduct().getId());
        }

        solicitud.setState(nuevoEstado);



        return requestRepository.save(solicitud);
    }

    public long countEntregadas() {
        return requestRepository.countByStateName("Entregada");
    }

    public void delete(int id){
        Request solicitud = requestRepository.findById(id).orElse(null);
        if (solicitud == null)
            throw new IllegalArgumentException("Error: No se puede eliminar. La solicitud con ID " + id + " no existe.");
        requestRepository.delete(solicitud);
    }

    @Transactional
    public Request updateSolicitud(int id, Map<String, Object> detallesNuevos){
        Request solicitudExistente = requestRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Error: No se encontro la solicitud con el ID " + id));

        if (detallesNuevos.containsKey("reason"))
            solicitudExistente.setReason((String) detallesNuevos.get("reason"));

        if (detallesNuevos.get("applicant") instanceof Map<?,?> datosSolicitante) {
            if (datosSolicitante.get("id") != null) {
                int idSolicitante = Integer.parseInt(datosSolicitante.get("id").toString());
                Usuario nuevoSolicitante = UsuarioService.findById(idSolicitante);
                if (nuevoSolicitante == null)
                    throw new IllegalArgumentException("Usuario solicitante no encontrado.");
                solicitudExistente.setApplicant(nuevoSolicitante);
            }
        }

        if (detallesNuevos.get("product") instanceof Map<?,?> datosProducto) {
            if (datosProducto.get("id") != null) {
                int idProduct = Integer.parseInt(datosProducto.get("id").toString());
                Producto nuevoProducto = productoService.findById(idProduct);
                if (nuevoProducto == null) {
                    throw new IllegalArgumentException("Producto no encontrado.");
                }
                solicitudExistente.setProduct(nuevoProducto);
            }
        }

        if (detallesNuevos.get("state") instanceof Map<?,?> datosEstado) {
            if (datosEstado.get("id") != null) {
                int idState = Integer.parseInt(datosEstado.get("id").toString());
                RequestState nuevoEstado = requestStateRepository.findById(idState)
                        .orElseThrow(() -> new IllegalArgumentException("Estado de solicitud no encontrado."));

                if (nuevoEstado.getName().equals("Aprobada") || nuevoEstado.getName().equals("Entregada")) {
                    productoService.marcarProductoNoDisponibleById(solicitudExistente.getProduct().getId());
                }

                solicitudExistente.setState(nuevoEstado);
            }
        }

        return requestRepository.save(solicitudExistente);
    }
}
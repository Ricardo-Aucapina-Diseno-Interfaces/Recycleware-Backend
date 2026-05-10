package com.proyecto.daw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.proyecto.daw.model.Request;
import com.proyecto.daw.service.RequestService;

@RestController
@RequestMapping("/solicitudes")
public class RequestController {

    @Autowired
    private RequestService requestService;

    @GetMapping("/todas")
    public ResponseEntity<List<Request>> getAllRequests() {
        List<Request> requests = requestService.findAll();
        return ResponseEntity.status(HttpStatus.OK).body(requests);
    }

    @PostMapping("")
    public ResponseEntity<Map<String, Object>> createRequest(@RequestBody Map<String, Object> payload) {
        Map<String, Object> response = new HashMap<>();

        try {
            int idSolicitante = Integer.parseInt(payload.get("idSolicitante").toString());
            int idProducto = Integer.parseInt(payload.get("idProducto").toString());
            String motivo = payload.get("motivo").toString();

            
            if (motivo == null || motivo.trim().isEmpty()) {
                response.put("error", "El motivo de la solicitud es obligatorio.");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
            }

            
            Request nuevaSolicitud = requestService.crearSolicitud(idSolicitante, idProducto, motivo);

            response.put("mensaje", "Solicitud creada con éxito. ¡Mucha suerte!");
            response.put("solicitud", nuevaSolicitud);
            
            return ResponseEntity.status(HttpStatus.CREATED).body(response);

        } catch (IllegalArgumentException e) {

            response.put("error", e.getMessage());
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
            
        } catch (Exception e) {
            
            response.put("error", "Error al procesar los datos de la solicitud. Revisa el formato.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

    @GetMapping("/usuario/{id}")
    public ResponseEntity<List<Request>> getRequestsByUser(@PathVariable("id") int id) {
        List<Request> misSolicitudes = requestService.obtenerSolicitudesPorUsuario(id);
        return ResponseEntity.status(HttpStatus.OK).body(misSolicitudes);
    }

    @PutMapping("/{id}/status")
    public ResponseEntity<?> updateRequestStatus(@PathVariable("id") int id, @RequestBody Map<String, Integer> body) {
        try {
            Integer newStateId = body.get("idEstado");
            
            if (newStateId == null) {
                Map<String, String> errorResponse = new HashMap<>();
                errorResponse.put("error", "El campo 'idEstado' es obligatorio.");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorResponse);
            }

            Request solicitudActualizada = requestService.updateStatus(id, newStateId);
            
       
            return ResponseEntity.status(HttpStatus.OK).body(solicitudActualizada);

        } catch (IllegalArgumentException e) {
            
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", e.getMessage());
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorResponse);
            
        } catch (Exception e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "Error interno al intentar actualizar el estado.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }

    @GetMapping("/entregadas/count")
    public ResponseEntity<Map<String, Long>> countEntregadas() {
        long count = requestService.countEntregadas();
        Map<String, Long> response = new HashMap<>();
        response.put("total", count);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, String>> deleteRequest(@PathVariable("id") int id){
        try{
            requestService.delete(id);
            return ResponseEntity.ok(Map.of("Mensaje", "Solicitud eliminada con éxito."));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "Error al eliminar la solicitud."));
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> updateRequest(@PathVariable("id") int id, @RequestBody Map<String, Object> detallesNuevos){
        try{
            Request solicitudActualizada = requestService.updateSolicitud(id, detallesNuevos);
            return ResponseEntity.ok(solicitudActualizada);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "Error interno al intentar actualizar la solicitud."));
        }
    }
}
package com.proyecto.daw.service;

import com.proyecto.daw.exception.ResourceNotFoundException;
import com.proyecto.daw.model.Donation;
import com.proyecto.daw.model.Rol;
import com.proyecto.daw.model.Usuario;
import com.proyecto.daw.model.DonationState;
import com.proyecto.daw.repository.DonationRepository;
import com.proyecto.daw.repository.DonationStateRepository;
import com.proyecto.daw.repository.UsuarioRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DonationService {

    @Autowired
    private DonationRepository donationRepository;
    @Autowired
    private UsuarioRepository UsuarioRepository;
    @Autowired
    private DonationStateRepository DonationStateRepository;

   
    public List<Donation> findAll() {
        return donationRepository.findAll();
    }

    
    public Donation findById(Integer id) {
        return donationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Donación no encontrada con ID: " + id));
    }

   
    public List<Donation> findByUsuarioId(Integer UsuarioId) {
        return donationRepository.findByDonanteId(UsuarioId);
    }

    public List<Object[]> obtenerRankingEmpresas() {
        return donationRepository.findRankingEmpresas();
    }

   
    @Transactional
    public Donation save(Donation donation) {
        
        donation.setId(null);

        
        if (donation.getDonante() != null && donation.getDonante().getId() != null) {
            Usuario Usuario = UsuarioRepository.findById(donation.getDonante().getId())
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "El donante con ID " + donation.getDonante().getId() + " no existe."));
            donation.setDonante(Usuario);
        }

        
        if (donation.getEstado() != null && donation.getEstado().getId() != null) {
            DonationState state = DonationStateRepository.findById(donation.getEstado().getId())
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "El estado con ID " + donation.getEstado().getId() + " no existe."));
            donation.setEstado(state);
        }

        
        return donationRepository.save(donation);
    }

    
    @Transactional
    public Donation updateStatus(Integer donationId, Integer newStateId) {
        
        Donation donation = donationRepository.findById(donationId)
                .orElseThrow(() -> new ResourceNotFoundException("Donación no encontrada"));

        
        DonationState newState = DonationStateRepository.findById(newStateId)
                .orElseThrow(() -> new ResourceNotFoundException("Estado no encontrado"));

        
        donation.setEstado(newState);
        return donationRepository.save(donation);
    }

    
    @Transactional
    public void delete(Integer id) {
        Donation donation = findById(id); 
        donationRepository.delete(donation);
    }

    
    public java.util.Map<String, Object> obtenerUltimaDonacionFormateada() {
        Donation ultima = donationRepository.findTopByEstadoIdAndDonanteRolOrderByFechaDonacionDesc(3, Rol.EMPRESA);

        if (ultima == null) {
            return null;
        }

        java.util.Map<String, Object> respuesta = new java.util.HashMap<>();

        String nombreDonante = ultima.getDonante().getRazonSocial() != null ?
                ultima.getDonante().getRazonSocial() :
                ultima.getDonante().getNombre();

        respuesta.put("donante", nombreDonante);
        respuesta.put("cantidad", ultima.getCantidadProductos());
        respuesta.put("categoria", ultima.getDescripcion());

        return respuesta;
    }

    @Transactional
    public Donation actualizar(Integer id, Donation detallesNuevos){
        Donation donacionExistente = donationRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("Donación no encontrada con ID: " + id));
        if (detallesNuevos.getCantidadProductos() != null) {
            donacionExistente.setCantidadProductos(detallesNuevos.getCantidadProductos());
        }
        if (detallesNuevos.getDescripcion() != null) {
            donacionExistente.setDescripcion(detallesNuevos.getDescripcion());
        }
        if (detallesNuevos.getPeso() != null) {
            donacionExistente.setPeso(detallesNuevos.getPeso());
        }
        if (detallesNuevos.getDonante() != null && detallesNuevos.getDonante().getId() != null) {
            Usuario nuevoDonante = UsuarioRepository.findById(detallesNuevos.getDonante().getId())
                    .orElseThrow(() -> new ResourceNotFoundException("Usuario donante no encontrado"));
            donacionExistente.setDonante(nuevoDonante);
        }
        if (detallesNuevos.getEstado() != null && detallesNuevos.getEstado().getId() != null) {
            DonationState nuevoEstado = DonationStateRepository.findById(detallesNuevos.getEstado().getId())
                    .orElseThrow(() -> new ResourceNotFoundException("Estado de donación no encontrado"));
            donacionExistente.setEstado(nuevoEstado);
        }
        return donationRepository.save(donacionExistente);
    }
}
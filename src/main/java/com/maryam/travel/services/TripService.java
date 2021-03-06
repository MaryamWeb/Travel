package com.maryam.travel.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maryam.travel.models.Trip;
import com.maryam.travel.models.User;
import com.maryam.travel.repositories.TripRepository;
import com.maryam.travel.repositories.UserRepository;

@Service
public class TripService {

	@Autowired
	private TripRepository tripRepo;
	@Autowired
	private UserRepository userRepo;
	
	public Trip createTrip(Trip trip) {
		return tripRepo.save(trip); 
	}
	
	public ArrayList<Trip> getTrips() {
		return (ArrayList<Trip>) tripRepo.allTrips();
	}
	public Trip findTrip(Long id) {
		return tripRepo.findById(id).orElse(null);
	}
	public List<Trip> searchByCountry(String query) {
		return tripRepo.findByCountry(query);
	}
	public void joinTrip(Long trip_id, Long user_id) {
		User u = userRepo.findById(user_id).orElse(null);
		Trip t = findTrip(trip_id);
		List<User> party = t.getUsers();
		party.add(u);
		t.setUsers(party);
		tripRepo.save(t);
	}
	public void unjoinTrip(Long trip_id, Long user_id) {
		User u = userRepo.findById(user_id).orElse(null);
		Trip t = findTrip(trip_id);
		List<User> party = t.getUsers();
		party.remove(u);
		t.setUsers(party);
		tripRepo.save(t);
	}
	public List<Object[]> getUserTrips(Long id) {
		return tripRepo.isOverlap(id);
	}
}
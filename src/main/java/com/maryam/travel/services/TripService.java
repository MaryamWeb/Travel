package com.maryam.travel.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

 
import com.maryam.travel.models.Trip;
import com.maryam.travel.repositories.TripRepository;

@Service
public class TripService {

	@Autowired
	private TripRepository tripRepo;
	
	public Trip createTrip(Trip trip) {
		return tripRepo.save(trip);
	}
	
	public ArrayList<Trip> getTrips() {
		return (ArrayList<Trip>) tripRepo.findAll();
	}
}
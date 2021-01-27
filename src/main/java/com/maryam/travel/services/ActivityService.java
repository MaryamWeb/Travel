package com.maryam.travel.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.maryam.travel.models.Activity; 
import com.maryam.travel.models.Trip;
import com.maryam.travel.models.User;
import com.maryam.travel.repositories.ActivityRepository;
import com.maryam.travel.repositories.TripRepository;
import com.maryam.travel.repositories.UserRepository;

@Service
public class ActivityService {

	@Autowired
	private TripRepository tripRepo;
	@Autowired
	private ActivityRepository actRepo;
	@Autowired
	private UserRepository userRepo;
	
	 
	public Activity createAct(Activity act) {
		return actRepo.save(act); 
	}
 
	public List<Activity> getTripAct(Long trip_id) {
		return actRepo.findByTrip(trip_id);
	}
	
}
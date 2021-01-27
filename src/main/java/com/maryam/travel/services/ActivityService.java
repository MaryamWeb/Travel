package com.maryam.travel.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.maryam.travel.models.Activity; 
import com.maryam.travel.repositories.ActivityRepository;


@Service
public class ActivityService {
	@Autowired
	private ActivityRepository actRepo;

	
	 
	public Activity createAct(Activity act) {
		return actRepo.save(act); 
	}
 
	public ArrayList<Activity> getAct() {
		return (ArrayList<Activity>) actRepo.findAll();
	}
}
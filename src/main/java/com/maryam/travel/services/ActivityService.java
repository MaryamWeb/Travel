package com.maryam.travel.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.maryam.travel.models.Activity;
import com.maryam.travel.models.User;
import com.maryam.travel.repositories.ActivityRepository;
import com.maryam.travel.repositories.UserRepository;

@Service
public class ActivityService {
	@Autowired
	private ActivityRepository actRepo;
	@Autowired
	private UserRepository userRepo;

	public Activity createAct(Activity act) {
		return actRepo.save(act);
	}

	public ArrayList<Activity> getAct() {
		return (ArrayList<Activity>) actRepo.allActivities();
	}
	public Activity findActivity(Long id) {
		return actRepo.findById(id).orElse(null);
	}
	public void joinActivity(Long activity_id, Long user_id) {
		User u = userRepo.findById(user_id).orElse(null);
		Activity a = findActivity(activity_id);
		List<User> partyact = a.getUsers();
		partyact.add(u);
		a.setUsers(partyact);
		actRepo.save(a);
	}
	public void unjoinActivity(Long activity_id, Long user_id) {
		User u = userRepo.findById(user_id).orElse(null);
		Activity a = findActivity(activity_id);
		List<User> partyact = a.getUsers();
		partyact.remove(u);
		a.setUsers(partyact);
		actRepo.save(a);
	}
	public List<Activity> getActInTrip(Long id) {
		return actRepo.travelAct(id);
	}
	public List<Activity> getUserActInTrip(Long id) {
		return actRepo.userTravelAct(id);
	}
}
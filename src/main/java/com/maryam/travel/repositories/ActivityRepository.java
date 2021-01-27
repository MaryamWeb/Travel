package com.maryam.travel.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.maryam.travel.models.Activity;
import com.maryam.travel.models.Trip;

@Repository
public interface ActivityRepository extends CrudRepository<Activity, Long> {
	List<Activity> findByTrip(Long trip_id);
}
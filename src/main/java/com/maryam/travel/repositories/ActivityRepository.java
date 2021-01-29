package com.maryam.travel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import com.maryam.travel.models.Activity;

@Repository
public interface ActivityRepository extends CrudRepository<Activity, Long> {
	@Query(value="SELECT * FROM activities Where trip_id = ?1", nativeQuery=true)
	List<Activity> travelAct(Long id);
	
	@Query(value="SELECT * FROM activities Where user_id = ?1", nativeQuery=true)
	List<Activity> userTravelAct(Long id);
}
package com.maryam.travel.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

import com.maryam.travel.models.Trip;

@Repository
public interface TripRepository extends CrudRepository<Trip, Long> {
	@Query(value="SELECT * FROM trips ORDER BY start", nativeQuery=true)
	List<Trip> allTrips();
	
	List<Trip> findByCountry(String query);
}
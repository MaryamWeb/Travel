package com.maryam.travel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.maryam.travel.models.Trip;

@Repository
public interface TripRepository extends CrudRepository<Trip, Long> {

}
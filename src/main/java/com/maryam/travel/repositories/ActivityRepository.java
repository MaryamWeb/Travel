package com.maryam.travel.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.maryam.travel.models.Activity;

@Repository
public interface ActivityRepository extends CrudRepository<Activity, Long> {}
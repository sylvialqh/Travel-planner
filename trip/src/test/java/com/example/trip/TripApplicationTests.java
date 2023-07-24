package com.example.trip;

import com.example.trip.controller.ThingsTodoController;
import com.example.trip.controller.UserController;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@SpringBootTest
@RunWith(SpringRunner.class)
class TripApplicationTests {
	@Autowired
	UserController userController;
	@Autowired
	ThingsTodoController thingsTodoController;


	@Test
	void contextLoads() {
		Assertions.assertThat(userController).isNot(null);

	}

}

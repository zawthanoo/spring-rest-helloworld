package com.mutu.spring.rest.api;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Zaw Than Oo
 * @since 01-DEC-2018
 */

@RestController
public class ApiController {
	@Value("${test-secret.username}")
	private String username;
	@Value("${test-secret.password}")
	private String password;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String hello() {
		return "Hi! " + username + ":" + password;
	}
}

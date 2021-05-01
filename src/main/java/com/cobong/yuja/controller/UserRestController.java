package com.cobong.yuja.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cobong.yuja.model.User;
import com.cobong.yuja.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class UserRestController {
private final UserService userService;
	
	@GetMapping("/api/user/all")
	public ResponseEntity<?> all() {
		return new ResponseEntity<>(userService.findAll(),HttpStatus.OK);
	}

	@GetMapping("/api/user/{id}")
	public ResponseEntity<?> detail(@PathVariable Long id) {
		return new ResponseEntity<>(userService.findById(id),HttpStatus.OK);
	}
	@PostMapping("/api/user")
	public ResponseEntity<?> insert(User user) {
		return new ResponseEntity<>(userService.join(user),HttpStatus.OK);
	}
	@PutMapping("/api/user/{id}")
	public ResponseEntity<?> modify(User user,@PathVariable Long id) {
		userService.modify(id, user);
		return new ResponseEntity<>(userService.modify(id, user),HttpStatus.OK);
	}
	@DeleteMapping("/api/user/{id}")
	public ResponseEntity<?> delete(@PathVariable Long id) {
		return new ResponseEntity<>(userService.delete(id),HttpStatus.OK);
	}

}

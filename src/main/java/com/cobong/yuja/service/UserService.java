package com.cobong.yuja.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cobong.yuja.model.User;
import com.cobong.yuja.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	private final UserRepository userRepository;
	
	@Transactional
	public User join(User user) {
		User userEntity = userRepository.save(user);
		return userEntity;
	}
	@Transactional(readOnly = true)
	public User findById(Long id) {
		return userRepository.findById(id).orElseThrow(()->new IllegalArgumentException("That's Nono"));
	}
	@Transactional(readOnly = true)
	public List<User> findAll() {
		return userRepository.findAll();
	}
	@Transactional
	public User modify(Long id,User user) {
		User userEntity= userRepository.findById(id).orElseThrow(()->new IllegalArgumentException("That's Nono"));
		userEntity.setPassword(user.getPassword());
		userEntity.setEmail(user.getEmail());
		return userEntity;
	}
	@Transactional
	public String delete(Long id) {
		userRepository.deleteById(id);
		return "Success";
	}
}

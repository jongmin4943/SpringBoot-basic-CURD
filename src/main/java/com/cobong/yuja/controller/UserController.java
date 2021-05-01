package com.cobong.yuja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.cobong.yuja.model.User;
import com.cobong.yuja.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("users", userService.findAll());
		return "index";
	}
	@GetMapping("/rest")
	public String rest(Model model) {
		return "rest";
	}
	@GetMapping("/user/{id}")
	public String detail(Model model,@PathVariable Long id) {
		model.addAttribute("user", userService.findById(id));
		return "detail";
	}
	//조인
	@PostMapping("/join")
	public String insert(User user) {
		User userEntity = userService.join(user);
		Long id = userEntity.getId();
		return "redirect:/user/"+id;
	}
	@GetMapping("/join")
	public String insertForm() {
		return "join";
	}
	
	//수정
	@GetMapping("/modify/{id}")
	public String modifyForm(Model model,@PathVariable Long id) {
		model.addAttribute("user", userService.findById(id));
		return "modify";
	}
	@PostMapping("/modify/{id}")
	public String modify(User user,@PathVariable Long id) {
		userService.modify(id, user);
		return "redirect:/user/"+id;
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		userService.delete(id);
		return "redirect:/";
	}
}

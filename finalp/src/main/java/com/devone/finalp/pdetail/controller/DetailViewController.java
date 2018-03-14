package com.devone.finalp.pdetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.devone.finalp.pdetail.model.service.DetailViewServiceImpl;

@Controller
public class DetailViewController {

	@Autowired
	private DetailViewServiceImpl detailviewService;
}

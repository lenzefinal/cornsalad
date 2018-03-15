package com.devone.finalp.member_status.controller;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;

public class SMTPAuthenticator extends Authenticator{
	public SMTPAuthenticator() {
		super();
	}
	
	  public PasswordAuthentication getPasswordAuthentication() {
		    String username = "rkdqhfka7";
		    String password = "slfonvsdliopaknc";
		    return new PasswordAuthentication(username, password);
	}
}

package com.foodjoa.member.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberVO {

	private String id;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private String profile;
	private int point;
	private Timestamp joinDate;
}

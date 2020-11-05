package com.ch.s4.transfer;

import org.springframework.stereotype.Component;

@Component
public class Subway {
	
	public void buyBread() {
		System.out.println("빵구매");
	}
	
	public void takeSubway() {
		System.out.println("--------------");
		System.out.println("지하철 자리찾기");
		System.out.println("지하철에서 게임하기");
		System.out.println("--------------");
	}

}

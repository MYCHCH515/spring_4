package com.ch.s4.transfer;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ch.s4.MyTestCase;
import com.ch.s4.card.Card;

public class TransferTest extends MyTestCase{
	@Autowired
	private Bus bus;
	
	@Autowired
	private Subway subway;
	
	//@Autowired
	private Card card;
	
	@Autowired
	private Taxi taxi;
	
	@Test
	public void test() {
		
		bus.takeBus();
		subway.takeSubway();
		taxi.getTaxi();
		
	}
	
	
	

}

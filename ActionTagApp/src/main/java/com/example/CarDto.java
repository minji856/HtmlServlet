package com.example;

import java.util.Date;

public class CarDto {
	private String plateNumber;
	// Date 로 해도되는데 주차시간을 알아야해서 long
	private long parkingTime;
	
	// 기본 생성자는 필요있던 간에 명시해주자
	public CarDto() {}
	
	public CarDto(String plateNumber, long parkingTime) {
		// this 를 사용하기 위해 별도의 setter 를 안 만든것
		this.plateNumber = plateNumber;
		this.parkingTime = parkingTime;
	}
	// 차번호
	public String getPlateNumber() {
		return plateNumber;
	}
	
	public Date getParkingTime() {
		return new Date(parkingTime);
	}
}

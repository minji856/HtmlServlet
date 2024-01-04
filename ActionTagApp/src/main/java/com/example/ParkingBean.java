package com.example;

import java.util.Vector;

public class ParkingBean {
	private Vector carList = new Vector();
	
	// 차가 몇대가 들어 올지 모르니까 변수에 저장 못하고, 저장소가 필요하다
	// 여러개 저장해야 되서 배열로 저장 근데 같은 타입이여야 한다. => 배열은 안됨
	// carDto를 안 만들엇으면 map 이라는 컬렉션을 쓰면 된다
	// vector 얘는 유일하게 동기화 처리되는 컬렉션 쓰면 좋음
	public void setEnter(String plateNumber) {
		// 두개의 정보를 합쳐서 하나의 객체로 
		carList.add(new CarDto(plateNumber, System.currentTimeMillis()));
	}
	// 나간 차번호. 근데 보따리에 차번호만 저장된게 아니라 시간과 함께 객체로 되어있다.
	public void setExit(String plateNumber) {
		CarDto car = null;
		for(int i=0; i<carList.size(); i++) {
			car = (CarDto)carList.get(i);
			if(plateNumber.equals(car.getPlateNumber())) {
				carList.remove(i);
				break;
			}
		}
	}
	// 객수
	public int getTotal() { return carList.size(); }
	// 차 번호를 조회하기 위한
	public CarDto getCar() {
		return null;
	}
	// vector 형식을 carDto로 옮겨줌
	// 내가 직접 태그를 만드는 방법 밖에없음 JSTL bean 태그 안됨
	public CarDto[] getCarList() { 
		// 빈 보따리 에 차 갯수만큼 옮겨주기
		CarDto[] cars = new CarDto[carList.size()];
		for(int i=0; i<cars.length; i++) {
			cars[i] = (CarDto)carList.get(i);
		}
		return cars;
		
		// return carList; 한줄로 끝내도됨
	}
}
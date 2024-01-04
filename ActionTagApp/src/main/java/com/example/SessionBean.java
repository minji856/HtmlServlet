package com.example;

public class SessionBean {
	private long startTime; // 경과한 시간
	private long instTime;	// 처음 시작한 시간 사용자가 처음 시작한 시간을 저장한 변수
	private long lastAccessTime; // 메서드가 호출되고 나서 경과하는 시간 마지막 접근한 뒤 경과한 시간 
	
	// 사용자가 처음으로 접속했을 때 타이머 버튼을 눌려 놓겠다.
	// 3개의 변수의 처음 시작은 다 똑같다 세션 시작입니다에서 bean이 생성되게 해야함
	// instTime(처음 접속한 시간)은 절대 바뀌지 않는다. 한번 저장해놓으면 끝까지 final로 해주면 좋다 -> 변경하지 못 하게
	// instTime 객체가 생선된 후 란 의미
	public SessionBean(){
		startTime = System.currentTimeMillis();
		instTime = startTime;
		lastAccessTime = startTime;
	}
	// elasped 경과한 시간. 얘를 호출하면 다시 현재시간을 저장해서 가장 처음에 저장한 것을 빼준는 메서드
	public long getElapsedTime(){
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime - startTime)/1000;
	}
	
	// 무조건 매개변수가 있어야해서 그냥 형식적으로 적어둔 것이다 - 규칙땜에
	// 넘어오는게 있냐 없냐를 받는거고 정수형으로 받으면 타입이 안 맞는다
	public void setRestart(boolean b){
		startTime = System.currentTimeMillis();
		lastAccessTime = System.currentTimeMillis();
	}
	// 타이머가 시작된 이후에 경과된 시간 - 토탈시간 최초로 접속한 시간 ~ 지금까지
	public long getElapsedTimeAfterInst(){
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime - instTime)/1000;
	}
	// 각 메서드마다 lastAccesTimr이 있다 어떤 함수를 호출하던 거기서 부터 시간을 재겠다.
	// 자신이 호출된 시간도 호출함
	public long getElapsedTimeAfterLastAccess(){
		long current = System.currentTimeMillis();
		long elapsed = (current-lastAccessTime)/1000;
		
		lastAccessTime = System.currentTimeMillis();
		
		return elapsed;
	}
}

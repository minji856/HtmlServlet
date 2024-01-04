package com.example;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.net.URL;

public class ApplicationBean {
	private int visitCount = 0;
	private String path;
	
	/* //방문자가 들어올 때마다. 메모리에 저장하면 안 된다. 총 방문자 숫자를 저장할 수 있게
	public int getVisitCount() {
		return visit ++;
	}*/
	
	// getClass는 현재 클래스에 대한 정보. resource 는 현재 클래스의 위치
	public ApplicationBean() {
		BufferedReader br = null;
		try{
			URL url = getClass().getResource("/");
			path = url.getPath().substring(1) + "counter.txt";
			  
			br = new BufferedReader(new FileReader(path)); 
			String strCounter = br.readLine(); 
			visitCount = Integer.parseInt(strCounter);
		
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(br != null){
				try{
					br.close();
				}
				catch(Exception err){}
			}
		}
	}
	
	@Override
	protected void finalize() throws Throwable {
		setFile();
	}
	
	// set메서드 안에 매개변수가 없어서 bean 프로퍼티가 아니다. 즉 jsp에서 못 쓴다.
	public void setFile(){
		PrintWriter pw = null;
		
		try{
			pw = new PrintWriter(path);
			pw.println(visitCount);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(pw != null){
				try{
					pw.close();
				}
				catch(Exception err){}
			}
		}
	}
	// setCounter는 bean 프로퍼티 => Jsp 에서 사용하겠다 란 듯
	// int num 매개변수 필요없지만 규칙 때문에 만든것
	public void setCounter(int num) {
		visitCount++;
		setFile();
		/* 원래 이런게 필요하다
		 * if(visitCount % 10 == 0) { setFile(); }
		 */
	}
	// bean 프로퍼티
	public int getCounter() {
		return visitCount;
	}
	
	/* class 위치 테스트용
	 * public static void main(String[] args) { new ApplicationBean(); }
	 */
}

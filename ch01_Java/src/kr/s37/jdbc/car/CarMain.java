package kr.s37.jdbc.car;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class CarMain {
	private BufferedReader br;
	private CarDAO dao;
	//생성자
	public CarMain() {
		try {
			br = new BufferedReader(
					new InputStreamReader(System.in));
			dao = new CarDAO();
			callMenu();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			if(br!=null)try {br.close();}catch(IOException e) {}
		}
	}
	//메뉴
	public void callMenu()throws IOException{
		while(true) {
			System.out.print("1.자동차 정보 등록,2.목록 보기,"
				+ "3.자동차 상세 정보,4.정보 수정,5.정보 삭제,6.종료>");
			try {
				int no = Integer.parseInt(br.readLine());
				if(no == 1) {//자동차 정보 등록
					
				}else if(no == 2) {//목록 보기
					
				}else if(no == 3) {//자동차 상세 정보
					
				}else if(no == 4) {//정보 수정
					
				}else if(no == 5) {//정보 삭제
					
				}else if(no == 6) {//종료
					System.out.println("프로그램을 종료합니다.");
					break;
				}else {
					System.out.println("잘못 입력했습니다.");
				}
			}catch(NumberFormatException e) {
				System.out.println("숫자만 입력 가능");
			}
		}
	}
	public static void main(String[] args) {
		new CarMain();
	}
}









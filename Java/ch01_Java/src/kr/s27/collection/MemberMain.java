package kr.s27.collection;

import java.util.ArrayList;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class MemberMain {
	/*
	 * [실습]
	 * 메뉴 : 1.회원정보 입력,2.회원정보 출력,3.종료
	 * 메서드명 : 메뉴 callMenu()
	 *         회원정보 입력 register()
	 *         회원정보 출력 printUserInfo()
	 * 입력시 조건 체크 : 나이는 1살이상 입력 가능        
	 */
	ArrayList<Member> list;
	BufferedReader br;
	
	public MemberMain() {
		list = new ArrayList<Member>();
		try {
			br = new BufferedReader(
					new InputStreamReader(System.in));
			callMenu();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(br!=null)try {br.close();}catch(IOException e) {}
		}
	}
	//메뉴
	public void callMenu()throws IOException{
		while(true) {
			System.out.print("1.회원정보 입력,2.회원정보 출력,3.종료>");
			try {
				int num = Integer.parseInt(br.readLine());
				if(num == 1) {//회원정보 입력
					register();
				}else if(num == 2) {//회원정보 출력
					printUserInfo();
				}else if(num == 3) {//종료
					System.out.println("프로그램 종료");
					break;
				}else {
					System.out.println("잘못 입력했습니다.");
				}
			}catch(NumberFormatException e) {
				System.out.println("숫자만 입력하세요!");
			}
		}
	}
	//회원정보 입력
	public void register()throws IOException{
		Member mb = new Member();
		System.out.print("이름:");
		mb.setName(br.readLine());
		
		mb.setAge(parseInputData("나이:"));
		
		System.out.print("직업:");
		mb.setJob(br.readLine());
		
		System.out.print("주소:");
		mb.setAddress(br.readLine());
		
		System.out.print("전화번호:");
		mb.setPhone(br.readLine());
		
		//Member 객체를 ArrayList에 저장
		list.add(mb);
	}
	
	//나이 조건 체크
	public int parseInputData(String item)throws IOException{
		while(true) {
			System.out.print(item);
			try {
				int age = Integer.parseInt(br.readLine());
				if(age<=0) {
					System.out.println("나이는 1살이상 입력 가능");
					continue;
				}
				return age;
			}catch(NumberFormatException e) {
				System.out.println("[숫자만 입력 가능]");
			}
		}
	}
	
	
	//회원정보 출력
	public void printUserInfo() {
		System.out.println(
				"회원목록 : 총회원수("+list.size()+")");
		System.out.println("---------------------------");
		System.out.println("이름\t나이\t직업\t주소\t전화번호");
		System.out.println("---------------------------");
		for(Member m : list) {
			System.out.print(m.getName()+"\t");
			System.out.print(m.getAge() + "\t");
			System.out.print(m.getJob() + "\t");
			System.out.print(m.getAddress() + "\t");
			System.out.println(m.getPhone());
		}
	}
	
	public static void main(String[] args) {
		new MemberMain();
	}
}




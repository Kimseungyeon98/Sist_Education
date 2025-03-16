package kr.s03.operation;

public class IfMain07 {
	public static void main(String[] args) {
		/*
		 * [실습]
		 * 생년월일을 입력하고 만 나이를 출력하는 프로그램을 작성하시오.
		 * 만 나이 = (현재 연도 - 태어난 연도) - (생일이 지났으면 0,
		 *                               생일이 지나지 않았으면 1)
		 * [입력 예시]
		 * 출생 연도 입력:2000
		 * 월 입력:3
		 * 입 입력:12
		 * 
		 * [출력 예시]                              
		 * 만 나이는 23                                                        
		 */
		//현재 날짜 정보
		int nowYear = 2024;
		int nowMonth = 2;
		int nowDate = 21;
		
		java.util.Scanner input = 
				new java.util.Scanner(System.in);
		System.out.print("연도 입력:");
		int birthYear = input.nextInt();
		
		System.out.print("월 입력:");
		int birthMonth = input.nextInt();
		
		System.out.print("일 입력:");
		int birthDate = input.nextInt();
		
		//현재 연도와 태어난 연도 연산
		int age = nowYear - birthYear;
		
		/*
		if(nowMonth < birthMonth) {
			//태어난 월과 현재 월을 비교
			age--; //age-=1
		}else if(nowMonth == birthMonth && nowDate < birthDate) {
			//태어난 월과 현재 월이 같을 경우 일 비교
			age--; //age-=1
		}
		*/
		
		if(nowMonth < birthMonth || 
		  (nowMonth == birthMonth && nowDate < birthDate)) {
			age--;
		}
		
		System.out.printf("만 나이는 %d%n", age);
		
		input.close();
	}
}





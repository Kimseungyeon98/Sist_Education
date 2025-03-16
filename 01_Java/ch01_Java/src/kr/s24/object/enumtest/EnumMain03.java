package kr.s24.object.enumtest;

enum Gender{
	MALE,FEMAIL;
	
	//메서드 재정의
	@Override
	public String toString() {
		switch(this) {
		case MALE:
			return "남자";
		default : 
			return "여자";
		}
	}
}

public class EnumMain03 {
	public static void main(String[] args) {
		System.out.println(Gender.MALE);
		System.out.println(Gender.FEMAIL);
		System.out.println("-------------");
		
		System.out.println(Gender.MALE.toString());
		System.out.println(Gender.FEMAIL.toString());
	}
}






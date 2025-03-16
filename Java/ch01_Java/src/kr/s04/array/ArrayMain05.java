package kr.s04.array;

public class ArrayMain05 {
	public static void main(String[] args) {
		int[] score = {79,88,91,33,100,55,95};
		int max = score[0];//최대값이 저장되는 변수
		int min = score[0];//최소값이 저장되는 변수
		
		for(int i=1;i<score.length;i++) {
			//최대값 구하기
			if(score[i] > max) {
				max = score[i];
			}
			//최소값 구하기
			if(score[i] < min) {
				min = score[i];
			}
		}//end of for
		
		//최대값, 최소값 출력
		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);
		
	}//end of main
}










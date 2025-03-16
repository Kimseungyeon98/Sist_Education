package kr.s21.object.util;

import java.util.StringTokenizer;

public class StringTokenizerMain02 {
	public static void main(String[] args) {
		String source = "2024-03-04 16:03:20";
		StringTokenizer st = 
				new StringTokenizer(source,"- :");
		while(st.hasMoreTokens()) {
			                   //잘려진 문자열 반환
			System.out.println(st.nextToken());
		}
	}
}







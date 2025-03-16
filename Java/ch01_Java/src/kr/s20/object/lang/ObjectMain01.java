package kr.s20.object.lang;

public class ObjectMain01 {
	public static void main(String[] args) {
		ObjectMain01 ob = new ObjectMain01();
		System.out.println(ob.getClass());
		System.out.println(ob.getClass().getName());//클래스명 반환
		System.out.println(ob.hashCode());//10진수의 유니크한 값 반환
		                   //10진수 -> 16진수
		System.out.println(Integer.toHexString(ob.hashCode()));
		System.out.println(ob.toString());
		System.out.println(ob);
	}
}

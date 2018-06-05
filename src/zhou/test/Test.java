package zhou.test;

public class Test {
	public static void main(String[] args) {
		System.out.println(System.currentTimeMillis());
		String strID = "apple_00a";
		String[] strings = strID.split("-");
		for (String string : strings) {
			System.out.println(string);
		}
	}
}

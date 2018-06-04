package zhou.functionclass;

import java.util.Random;

public class RondomOrderNum {
	//根据手机号随机订单
	public static String RondomOrderNumber(String str) {
		long time = System.currentTimeMillis();
		int index = new Random().nextInt()%12;
		String orderNum = str.substring(0, index)+time+str.substring(index+1,str.length());
		return orderNum;
	}
	public static void main(String[] args) {
		System.out.println(RondomOrderNum.RondomOrderNumber("13312341234"));
	}
}

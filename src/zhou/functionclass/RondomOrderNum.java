package zhou.functionclass;

import java.util.Random;

public class RondomOrderNum {
	//根据手机号随机订单
	public static String RondomOrderNumber(String str) {
		long time = System.currentTimeMillis();
		//System.out.println(time);
		int index = new Random().nextInt(9)+1;
//		System.out.println(index);
		String orderNum = str.substring(0, index)+time+str.substring(index,str.length());
//		System.out.println(str.substring(0,index));
//		System.out.println(str);
//		System.out.println(str.substring(index,str.length()));
		return orderNum;
	}
	public static void main(String[] args) {
		System.out.println(RondomOrderNum.RondomOrderNumber("13312341234"));
	}
}

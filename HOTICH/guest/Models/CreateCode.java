package Models;

import java.util.Random;

public class CreateCode 
{
	public CreateCode(){
		
	}
	
	public String Code()
	{
		String Code = "";
		 Random rand = new Random();
		 int count=0;
		 while(count != 5)
		 {
			 int randomNum = rand.nextInt((90 -65) + 1) + 65;
			 
			 Code = Code + (char)randomNum;
			 
			 count++;
			 
		 }
		 
		count=0;
		return Code.toUpperCase();
	}
	
	private static String toASCII(int value) {
	    int length = 4;
	    StringBuilder builder = new StringBuilder(length);
	    for (int i = length - 1; i >= 0; i--) {
	        builder.append((char) ((value >> (8 * i)) & 0xFF));
	    }
	    return builder.toString();
	}

}

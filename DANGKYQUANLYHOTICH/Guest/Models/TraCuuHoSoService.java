package Models;

import java.util.Random;

public class TraCuuHoSoService 
{
	public TraCuuHoSoService()
	{
		
	}
	
	public String GetCodeRamdoom()
	{
		String codeReturn = "";
		Random Rand = new  Random();
		int count =0;
		while(count<5)
		{
			//rand.nextInt((max - min) + 1) + min;
			int randNum = Rand.nextInt((57-49)+1)+49;
			codeReturn = codeReturn + (char)randNum;
			
			count++;
		}
		count=0;
		return codeReturn;
	}

}



public class RemoveChar
{
	public static void main(String[] args)
	{
		String str = "qwe rhg shdig sedef";
		String str1 = removeCharAt(str,4);
		System.out.println("result:"+str1);
	}
	public static String removeCharAt(String s,int pos)
	{
		return s.substring(0,pos)+s.substring(pos+1);
	}
}
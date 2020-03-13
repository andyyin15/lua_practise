public class StringCom{
	public static void main(String[] args)
	{

		String str = "Hello world";
		String anotherstr = "hello world";
		//Object obj =  str;
		 System.out.println( +str.compareTo(anotherstr) );
		 System.out.println( +str.compareToIgnoreCase(anotherstr) );
		 System.out.println( +str.compareTo(str.toString()));
	}
}
public class ReplaceTest
{
	public static void main(String[] args)
	{
		String str = "q wertasdfg";
		
		System.out.println(str.replace('q','p'));
		String str_re = new StringBuffer(str).reverse().toString();
		System.out.println(str_re);

		System.out.println(str.indexOf('w'));

	}
}
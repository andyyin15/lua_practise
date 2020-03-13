public class SearchStr{
	public static void main(String[] args)
	{
		String str1 = "hello everyone come om";
		int lastString = str1.lastIndexOf("come");
		if (lastString == -1)
		{
			System.out.println("come not found");
		}
		else
		{
			System.out.println("Last occurrence of come is at index "+ lastString);
		}
	}
}
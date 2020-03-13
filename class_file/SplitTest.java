public class SplitTest
{
	public static void main(String[] args)
	{
		String str = "qwe-asd-zxc";
		String[] temp;
		temp = str.split("-");
		for (int i=0;i<temp.length;i++)
		{
			System.out.println(temp[i]);
		}
	}
}
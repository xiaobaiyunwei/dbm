
public class StringTest {

	public static void main(String[] args) {
		String str = "4 \"EXISTS\" \"79c2da49d40c923b18fde340146182f2\"";
		System.out.println(str.split("\\s+")[0].length()+1);
		System.out.println(str.split("\\s+")[1]);
	}

}

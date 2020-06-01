
public class StringTest {

	public static void main(String[] args) {
		String str = "423 \"DEL\" \"live_manage_session:c61d7a4b-2400-4add-a7f2-f043f5a66a13:idx\"";
		System.out.println(str.split("\\s+")[0].length()+1);
	
		System.out.println(str.substring(str.split("\\s+")[0].length()+1,str.length()));
		System.out.println(str.indexOf("\\s+"));
		System.out.println(str.substring(str.indexOf("\\s+")+1,str.length()));
	}

}

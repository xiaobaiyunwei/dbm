import java.util.Arrays;
import java.util.List;

/**
 * @author guiguketang
 * @date 2020/11/6 16:29
 */
public class Test {
    public static void main(String[] args) {
        /*int count=1033;
        int batch=100;
        System.out.println(count/batch);
        for(int i=0;i<count/batch+1;i++){
            System.out.println(i*100+"||"+(i+1)*100);
        }*/

        String str = "majorID,businessID,siteID,majorName,shortName,status,sequence,creator,createTime";
        String str_array[] = str.split(",");
        //List<String> new_list = Arrays.asList(str_array);

        for(int i=0;i<str_array.length;i++){
            if(str_array[i].toLowerCase().indexOf("time")>0) {
                System.out.println("the time is "+str_array[i]);
            }else {
                if (i != str_array.length - 1) {
                    System.out.println(str_array[i] + ",");
                } else {
                    System.out.println(str_array[i]);
                }
            }
        }


    }
}

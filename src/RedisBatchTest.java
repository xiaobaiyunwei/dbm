import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
/**
 * @author guiguketang
 * @date 2020/12/23 18:32
 * 生成完导入命令以后，在redis服务器执行下面命令即可
 * cat input/redis_input.txt | bin/redis-cli -p 6370 -a yourpasswd –pipe
 *
 */
public class RedisBatchTest {
    public static void main(String[] args) {
        String outputFile = "d:\\redis_input.txt";
        RedisBatchTest test = new RedisBatchTest();
        test.generateFile(outputFile);
    }
    /**
     * 格式化成输入字符串
     *
     * @return
     */
    private String getString(String key, String value) {
        StringBuilder sb = new StringBuilder();
        sb.append("*3").append("\r\n");
        sb.append("$3").append("\r\n");
        sb.append("SET\r\n");
        sb.append("$").append(key.getBytes().length).append("\r\n");
        sb.append(key).append("\r\n");
        sb.append("$").append(value.getBytes().length).append("\r\n");
        sb.append(value).append("\r\n");
        return sb.toString();
    }

    public void generateFile(String file) {
        BufferedWriter w = null;
        String key = null;
        String value = null;
        StringBuilder sb = new StringBuilder();
        try {
            w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
            for (int i = 1; i <= 1000000; i++) {
                key = "test_batch_2" +i;
                value = "v_" + i + "helloServiceTest"; // 这是key对应的value
                sb.append(this.getString(key, value));
                if (i % 10 == 0) {
                    w.write(sb.toString());
                    w.flush();
                    sb.delete(0, sb.length());
                    System.out.println("Current write: " + i);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                w.flush();
                w.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}

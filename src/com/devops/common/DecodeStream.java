package com.devops.common;
import java.io.CharArrayWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.IllegalCharsetNameException;
import java.nio.charset.UnsupportedCharsetException;
import java.security.AccessController;
import java.util.BitSet;
import sun.security.action.GetPropertyAction;

public class DecodeStream {
	static BitSet dontNeedEncoding;
	static String dfltEncName = null;
	/**
	 * 获得字符串的十六进制
	 * @param paramString1
	 * @param paramString2
	 * @return
	 */
	private static String getCNhexString(String paramString1, String paramString2){
		int i = 0;
		StringBuffer localStringBuffer = new StringBuffer(paramString1.length());
		CharArrayWriter localCharArrayWriter = new CharArrayWriter();
		if (paramString2 == null)
			throw new NullPointerException("charsetName");
		Charset localCharset = null;
		try {
			localCharset = Charset.forName(paramString2);
		} catch (IllegalCharsetNameException localIllegalCharsetNameException) {
			try {
				throw new UnsupportedEncodingException(paramString2);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} catch (UnsupportedCharsetException localUnsupportedCharsetException) {
			try {
				throw new UnsupportedEncodingException(paramString2);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		int j = 0;
		while (j < paramString1.length()) {
			int k = paramString1.charAt(j);
			if (dontNeedEncoding.get(k)) {
				if (k == 32) {
					k = 43;
					i = 1;
				}
				localStringBuffer.append((char) k);
				++j;
			} else {
				do {
					localCharArrayWriter.write(k);
					if ((k < 55296) || (k > 56319) || (j + 1 >= paramString1.length()))
						continue;
					int l = paramString1.charAt(j + 1);
					if ((l < 56320) || (l > 57343))
						continue;
					localCharArrayWriter.write(l);
					++j;
				} while ((++j < paramString1.length())
						&& (!(dontNeedEncoding.get(k = paramString1.charAt(j)))));
				localCharArrayWriter.flush();
				String str = new String(localCharArrayWriter.toCharArray());
				byte[] arrayOfByte = str.getBytes(localCharset);
				for (int i1 = 0; i1 < arrayOfByte.length; ++i1) {
					localStringBuffer.append('%');
					char c = Character.forDigit(arrayOfByte[i1] >> 4 & 0xF, 16);
					if (Character.isLetter(c))
						c = (char) (c - ' ');
					localStringBuffer.append(c);
					c = Character.forDigit(arrayOfByte[i1] & 0xF, 16);
					if (Character.isLetter(c))
						c = (char) (c - ' ');
					localStringBuffer.append(c);
				}
				localCharArrayWriter.reset();
				i = 1;
			}
		}
		
		return ((i != 0) ? localStringBuffer.toString() : paramString1);
	}
	
	static {
		dontNeedEncoding = new BitSet(256);
		dfltEncName = (String) AccessController.doPrivileged(new GetPropertyAction("file.encoding"));
	}
	
	/**
	 * 获得字符串
	 * @param paramString1 要转换的字符串
	 * @param paramString2 编码格式
	 * @return
	 */
	public static String getHexString(String paramString1, String paramString2) {
		String hexStr = getCNhexString(paramString1, paramString2);
		StringBuffer bf = new StringBuffer();
		String[] hex_tmp = hexStr.split("%");
		for(int i=0; i<hex_tmp.length; i++){
			if(hex_tmp[i]!=null&&hex_tmp[i]!=""&&hex_tmp[i].length()>0){
				bf.append(hex_tmp[i]);
			}
		}
		return bf.toString();
	}
	
	/**
	 * 十六进制转换为二进制
	 * @param hex
	 * @return
	 */
	public static byte[] getBytesFromHex(String hex){
		byte[] bs = new byte[hex.length()/2];
		int m=0;
		for(int i=0; i<hex.length(); i=i+2){
			bs[m] = (byte) Integer.parseInt(hex.charAt(i)+""+hex.charAt(i+1)+"", 16);
			m++;
		}
		return bs;
	}
}

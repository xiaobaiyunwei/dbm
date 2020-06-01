package com.devops.demo.domain;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

/**
 * UDP客户端
 * @author csy
 *
 * 2014-12-18 下午6:59:31
 * info:
 */
public class UdpClient {
	
	public boolean udpSendMessage(String str, String ip, int port){
		try {
			DatagramSocket client = new DatagramSocket();
			str = UDP.HANDLER + str;
			byte[] sendByte = str.getBytes();
			InetAddress addr = InetAddress.getByName(ip);
			DatagramPacket sendPacket = new DatagramPacket(sendByte, sendByte.length, addr, port);
			client.send(sendPacket);
			client.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
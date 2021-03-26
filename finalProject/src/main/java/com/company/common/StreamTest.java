package com.company.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class StreamTest {
	public static void textRead(String[] args) throws Exception {
		/*
		 * FileReader fr = new FileReader("D:\\Temp\\sample.txt"); int c; while ((c =
		 * fr.read()) != -1) { System.out.println((char)c); } fr.close();
		 */

		BufferedReader br = new BufferedReader(new FileReader("D:\\\\Temp\\\\sample.txt"));
		String line;
		while (true) {
			line = br.readLine();
			if (line == null)
				break;
			System.out.println(line);
		}
		br.close();
	}

	public static void textCopy(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader("D:\\\\Temp\\\\sample.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("D:\\\\Temp\\\\sample2.txt"));
		String line;
		while (true) {
			line = br.readLine();
			if (line == null)
				break;
			bw.write(line + "\n");
		}
		br.close();
		bw.close();
		System.out.println("복사완료");
	}

	public static void fileCopy(String[] args) throws Exception {
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream("D:\\\\Temp\\\\images.jpg"));
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("D:\\\\Temp\\\\images2.jpg"));
		int cnt;
		byte[] b = new byte[100];
		while (true) {
			cnt = bis.read(b);
			if (cnt == -1)
				break;
			bos.write(b);
		}
		bis.close();
		bos.close();
	}

	public static void main(String[] args) throws Exception {
	    Random rand = new Random();
	    String num = "";
	    for(int i = 0; i < 32; i++) {
	    	String ran = Integer.toString(rand.nextInt(10));
	    	num += ran;
	    }
	    System.out.println(num);
	}
}
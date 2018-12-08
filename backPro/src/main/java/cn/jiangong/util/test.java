package cn.jiangong.util;

import java.util.Scanner;
import java.util.Vector;

public class test {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int n = s.nextInt();
        Vector<Integer> vector = new Vector<Integer>();
        while(true){
            if(n%26==0){
                vector.add(26+64);
                n/=26;
                n-=1;
            }else {
                vector.add(n%26+64);
                System.out.println(n/26);
                n/=26;
            }
            if (n==0){
                break;
            }
        }
        for (int i = vector.size()-1; i >=0 ; i--) {
            int x = 65;
            char c = (char)x;
            System.out.println(c);
            System.out.println();
        }
    }
}

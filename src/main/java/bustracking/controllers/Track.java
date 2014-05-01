package bustracking.controllers;
import java.lang.*;


public class Track extends Thread
{
	public static void main (String args[]) {
        Thread t1=new Thread();
        t1.start();
    }
	 public void run() {
			for (int i = 0; i < 10; i++) {
			    System.out.println(i + " " + getName());
		            try {
				sleep((int)(Math.random() * 1000));
			    } catch (InterruptedException e) {}
			}
			System.out.println("DONE! " + getName());
		    }
}
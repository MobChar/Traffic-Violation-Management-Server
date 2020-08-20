package server_configure;

import java.rmi.RemoteException;
import java.util.LinkedList;
import java.util.Queue;
import java.util.logging.Logger;

import server_services.ServerServicesImpl;
import server_services.Task;

public class TaskManager {
	private static Queue<Task> tasks=new LinkedList<Task>();
	public static void start() {
	     Thread thr = new Thread(()-> {
	    	 while(true) {
		    	 if(!tasks.isEmpty()) {
		    		 try {
						tasks.poll().toDo();
					} catch (RemoteException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    	 }
		    	 try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    	 }
	     });
	     thr.setPriority(Thread.MAX_PRIORITY);    
	     thr.start();
	}
	public static void addTask(Task task) {
		tasks.add(task);
	}
}

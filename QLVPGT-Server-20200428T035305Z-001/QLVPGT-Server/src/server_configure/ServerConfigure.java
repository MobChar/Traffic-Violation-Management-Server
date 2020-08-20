package server_configure;

import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import client_services.CallBackHandler;
import model.ItemCoSoLuuTru;
import model.ItemDiem;
import model.ItemDieuLuat;
import model.ItemKhoan;
import server_services.ServerServicesImpl;

public class ServerConfigure {
	public static void main (String args[]) throws RemoteException, MalformedURLException {
		
		Registry regis=LocateRegistry.createRegistry(1090);
		ServerServicesImpl services=new ServerServicesImpl();
		regis.rebind("QLVPGT",services);
		
		
		TaskManager.start();
		
	}
}



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalexam.hargett;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


/**
 *
 * @author class
 * 
 */
public class ConnectionDB {
    public static Connection establishDBConnection() throws SQLException,ClassNotFoundException{
       Class.forName("com.mysql.jdbc.Driver");

       Connection connect = null;
       Properties connectProp = new Properties();
       connectProp.put("dbms","mysql");
       connectProp.put("user","root");
       connectProp.put("password","");
       connectProp.put("useSSL","false");       
       
       connect = DriverManager.getConnection(
                   "jdbc:" + "mysql" + "://" + "localhost" + ":" + 3306 + "/", connectProp);       
       System.out.println("Connected to database");
       return connect;
    }
    
    public static ArrayList<ImperialWalker> createDBStormtrooper()
    throws SQLException, ClassNotFoundException{
        ArrayList<ImperialWalker> stList = new ArrayList<>();
        
        String sql = "select * from imperial_walker_type, imperial_walkers_assign";
        
        Connection conn = ConnectionDB.establishDBConnection();
        Statement useStatement = conn.createStatement();
        useStatement.executeQuery("Use stormtrooper_java");
        Statement mystat = conn.createStatement();
        ResultSet rs = mystat.executeQuery(sql);
        
        while(rs.next()){
            String WalkerID = rs.getString("WID");
            String WalkerType = rs.getString("WType");
            String WalkerTypeID = rs.getString("WTypeID");
            int Height = rs.getInt("Height");
            int Length = rs.getInt("Length");
            int width = rs.getInt("Width");
            int weight = rs.getInt("Weight");
            int Crew = rs.getInt("Crew");
            int TroopCapacity = rs.getInt("TroopCapacity");
            int MaximumSpeed = rs.getInt("MaximumSpeed");
            int OpRange = rs.getInt("OpRange");
            String WalkerStatus = rs.getString("Status");
             ImperialWalker IW = new ImperialWalker(WalkerID,WalkerTypeID,WalkerType,
                    Height,Length,width,weight,Crew,TroopCapacity,
                    MaximumSpeed,OpRange,WalkerStatus);
            switch(WalkerType){
                case "AT-AT":
                    IW = new ImperialWalker(WalkerID,WalkerTypeID,WalkerType,
                    Height,Length,width,weight,Crew,TroopCapacity,
                    MaximumSpeed,OpRange,WalkerStatus);
                    stList.add(IW);
                    break;
                case "AT-ST":
                    IW = new ImperialWalker(WalkerID,WalkerTypeID,WalkerType,
                    Height,Length,width,weight,Crew,TroopCapacity,
                    MaximumSpeed,OpRange,WalkerStatus);
                    stList.add(IW);
                    break; 
            }
        }
        conn.close();
        return stList;
    }
}

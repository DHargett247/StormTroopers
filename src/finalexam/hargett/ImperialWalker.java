/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalexam.hargett;

import java.util.ArrayList;


public class ImperialWalker { 
String WID;
String WTypeID;
String WType;
int Height;
int Length;
int width;
int weight;
int Crew;
int TroopCapacity;
int MaximumSpeed;
int OpRange;
String Status;
    public ImperialWalker(String WID, String WTypeID, String WType, int Height, 
            int Length, int width, int weight, int Crew, int TroopCapacity, 
            int MaximumSpeed, int OpRange, String Status) {
        this.WID = WID;
        this.WTypeID = WTypeID;
        this.WType = WType;
        this.Height = Height;
        this.Length = Length;
        this.width = width;
        this.weight = weight;
        this.Crew = Crew;
        this.TroopCapacity = TroopCapacity;
        this.MaximumSpeed = MaximumSpeed;
        this.OpRange = OpRange;
        this.Status = Status;
    }

    public void displayInfo(){
        System.out.print(this.WID +"\t");
        System.out.print(this.WType+"\t");
        System.out.print(this.Status);
        System.out.println();
    }
    public static void displayAT(ArrayList<ImperialWalker> IW){
      
            for(ImperialWalker w : IW)
                w.displayInfo();
            
    }
    public static void displayST(ArrayList<ImperialWalker> IW){
       
            for(ImperialWalker w : IW)
                    w.displayInfo();}
        
    }

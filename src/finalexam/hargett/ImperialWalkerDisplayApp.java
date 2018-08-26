/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalexam.hargett;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;

/**
 *
 * @author class
 */
public class ImperialWalkerDisplayApp {
    public static void IWApp(){
        JFrame jfrm = new JFrame("Stormtrooper Creator");
        jfrm.getContentPane().setLayout(new FlowLayout());
        jfrm.setSize(400,200);
        jfrm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        JButton AT_Walker = new JButton("Create AT Walker");
        JButton ST_Walker = new JButton("Create ST Walker");
        jfrm.getContentPane().add(AT_Walker);
        jfrm.getContentPane().add(ST_Walker);
                
        jfrm.setVisible(true);
        
        AT_Walker.addActionListener(new ActionListener() { 
            @Override
            public void actionPerformed(ActionEvent ae) {
                try {
                    ArrayList<ImperialWalker> WI = ConnectionDB.createDBStormtrooper();
                    
                    ImperialWalker.displayAT(WI);
                } catch (SQLException ex) {
                    Logger.getLogger(ImperialWalkerDisplayApp.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(ImperialWalkerDisplayApp.class.getName()).log(Level.SEVERE, null, ex);
                }
            } 
        });
        ST_Walker.addActionListener(new ActionListener() { 
            @Override
            public void actionPerformed(ActionEvent ae) {
                try {
                    ArrayList<ImperialWalker> WI = ConnectionDB.createDBStormtrooper();
                    ImperialWalker.displayST(WI);
                } catch (SQLException ex) {
                    Logger.getLogger(ImperialWalkerDisplayApp.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(ImperialWalkerDisplayApp.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }); //END ACTIONLISTENER CREATE        
    }//END METHOD     
    
}

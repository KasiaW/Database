/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pizza;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Dimension;

import java.awt.Font;
import java.awt.GridLayout;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.text.NumberFormat;
import java.util.Locale;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.SwingConstants;

/**
 *
 * @author lucapellegrini
 */


//TESTT
public class Pizzas extends JPanel {

    private JLabel saying;
    public static JLabel PRICE;
    public static JLabel CountLabel;
    public static JLabel TEST;
    private int count = 0;
    private double price;
    private double CRprice = 0, SAprice = 0, CHprice = 0, MEprice = 0, VGprice = 0;
    public double TOTALPRICE;
    NumberFormat fmt = NumberFormat.getCurrencyInstance();
  
    
    
    
    private static JRadioButton P = new JRadioButton("Personal");
    private static JRadioButton S = new JRadioButton("Small");
    private static JRadioButton M = new JRadioButton("Medium");
    private static JRadioButton L = new JRadioButton("Large");
    ButtonGroup group = new ButtonGroup();
    
    private JRadioButton NY = new JRadioButton("New York");
    private JRadioButton C = new JRadioButton("Chicago");
    private JRadioButton N = new JRadioButton("Neapolitan");
    private JRadioButton WW = new JRadioButton("Whole Wheat");
    private JRadioButton SO = new JRadioButton("Sourdough");
    ButtonGroup group1 = new ButtonGroup();
    
    private JRadioButton TB = new JRadioButton("Tomato Basil");
    private JRadioButton A = new JRadioButton("Alfredo");
    private JRadioButton PE = new JRadioButton("Pesto");
    private JRadioButton B = new JRadioButton("Barbecue");
    private JRadioButton OO = new JRadioButton("Olive Oil");
    ButtonGroup group2 = new ButtonGroup();
    
    private JCheckBox MO = new JCheckBox("Mozzarella");
    private JCheckBox PA = new JCheckBox("Parmesan");
    private JCheckBox SG = new JCheckBox("Smoked Gouda");
    private JCheckBox FE = new JCheckBox("Feda");
    private JCheckBox CH = new JCheckBox("Chevre");
    
    private JCheckBox PEP = new JCheckBox("Pepperoni");
    private JCheckBox IS = new JCheckBox("Italian Sausage");
    private JCheckBox GC = new JCheckBox("Grilled Chicken");
    private JCheckBox CB = new JCheckBox("Canadian Bacon");
    private JCheckBox GB = new JCheckBox("Ground Beef");
    
    private JCheckBox AH = new JCheckBox("Artichoke Hearts");
    private JCheckBox RG = new JCheckBox("Roasted Garlic");
    private JCheckBox RP = new JCheckBox("Roasted Red Peppers");
    private JCheckBox RO = new JCheckBox("Red Onion");
    private JCheckBox ST = new JCheckBox("Sun-dried Tomatoes");
    private JCheckBox FT = new JCheckBox("Fresh Tomatoes");
    private JCheckBox OL = new JCheckBox("Olives");
    private JCheckBox MU = new JCheckBox("Mushrooms");
    private JCheckBox EP = new JCheckBox("Eggplant");
    private JCheckBox AR = new JCheckBox("Arugula");
    
    private JPanel SizePanel = new JPanel();
    private JPanel Panel1 = new JPanel();
    private JPanel Crust = new JPanel();
    private JPanel Sauce = new JPanel();
    private JPanel Cheese = new JPanel();
    private JPanel Meats = new JPanel();
    private JPanel Veggies = new JPanel();
    private JPanel Toppings = new JPanel();
    private JPanel Panel2 = new JPanel();
    private JPanel Current = new JPanel();
  
    private static JButton order = new JButton("Order this pizza");


    public Pizzas() {
    
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setPreferredSize(new Dimension(200, 300));
    PRICE = new JLabel();
    TEST = new JLabel();
    CountLabel = new JLabel();

    //It creates SIZE PANEL
        SizePanel.setBorder(BorderFactory.createEtchedBorder());
        saying = new JLabel("Size: ");
        saying.setFont(new Font("Times New Roman", Font.BOLD, 20));
        group.add(P);
        group.add(S);
        group.add(M);
        group.add(L);
        SizePanel.add(saying);
        SizePanel.add(P);
        SizePanel.add(S);
        SizePanel.add(M);
        SizePanel.add(L);;

        this.add(SizePanel);
        SizePanel.setMaximumSize(new Dimension(750, 40));
        SizePanel.setVisible(true);

//It creates Crust Panel
        Crust.setBorder(BorderFactory.createTitledBorder("Crust"));
        Crust.setLayout(new GridLayout(5, 1));
        group1.add(NY);
        group1.add(C);
        group1.add(N);
        group1.add(WW);
        group1.add(SO);

        Crust.add(NY);
        Crust.add(C);
        Crust.add(N);
        Crust.add(WW);
        Crust.add(SO);

//It creates the Sauce Panel
        Sauce.setBorder(BorderFactory.createTitledBorder("Sauce"));
        Sauce.setLayout(new GridLayout(5, 1));
        group2.add(TB);
        group2.add(A);
        group2.add(PE);
        group2.add(B);
        group2.add(OO);

        Sauce.add(TB);
        Sauce.add(A);
        Sauce.add(PE);
        Sauce.add(B);
        Sauce.add(OO);

//It creates the Cheese Panel
        Cheese.setBorder(BorderFactory.createTitledBorder("Cheese"));
        Cheese.setLayout(new GridLayout(5, 1));
        Cheese.add(MO);
        Cheese.add(PA);
        Cheese.add(SG);
        Cheese.add(FE);
        Cheese.add(CH);

        
//It creates the GRID
        Panel1.setLayout(new GridLayout(1, 3));
        Panel1.setMaximumSize(new Dimension(750, 170));
        Panel1.add(Crust);
        Panel1.add(Sauce);
        Panel1.add(Cheese);
        this.add(Panel1);
        this.add(Box.createRigidArea(new Dimension(750, 50)));

//It creates Meats PANEL
        Meats.setBorder(BorderFactory.createTitledBorder("Meats  "));
        Meats.setLayout(new GridLayout(5, 1));
        Meats.add(PEP);
        Meats.add(IS);
        Meats.add(GC);
        Meats.add(CB);
        Meats.add(GB);

//It creates Veggies PANEL
        Veggies.setBorder(BorderFactory.createTitledBorder("Veggies"));
        Veggies.setLayout(new GridLayout(5, 2));
        Veggies.add(AH);
        Veggies.add(FT);
        Veggies.add(RG);
        Veggies.add(OL);
        Veggies.add(RP);
        Veggies.add(MU);
        Veggies.add(RO);
        Veggies.add(EP);
        Veggies.add(ST);
        Veggies.add(AR);

//It creates Toppings PANEL
        Toppings.setLayout(new GridLayout(1, 3));
        Toppings.setBorder(BorderFactory.createTitledBorder("Toppings"));
        Toppings.add(Meats);
        Toppings.add(Veggies);
        Toppings.setMaximumSize(new Dimension(750, 170));
        this.add(Toppings);
        this.add(Box.createRigidArea(new Dimension (750, 75)));
                
        
//Creates Current Panel
        Current.setBorder(BorderFactory.createTitledBorder("Current Order"));
        Current.setLayout(new GridLayout(2, 2));
        Current.setMaximumSize(new Dimension (750, 120));
        JLabel l1 = new JLabel("Number of Pizzas: ");
        JLabel l2 = new JLabel("Total Price of Pizzas: ");
        
        l1.setFont(new Font("Times New Roman", Font.BOLD, 20));
        l2.setFont(new Font("Times New Roman", Font.BOLD, 20));
        CountLabel.setFont(new Font("Times New Roman", Font.BOLD, 20));
        TEST.setFont(new Font("Times New Roman", Font.BOLD, 20));
        
        l1.setHorizontalAlignment(SwingConstants.RIGHT);
        l2.setHorizontalAlignment(SwingConstants.RIGHT);
        CountLabel.setHorizontalAlignment(SwingConstants.LEFT);
        TEST.setHorizontalAlignment(SwingConstants.LEFT);
        JPanel FL1 = new JPanel(new GridLayout (1,2));
        FL1.add(l1);
        FL1.add(CountLabel);
        JPanel SL1 = new JPanel (new GridLayout (1,2));
        SL1.add(l2);
        SL1.add(TEST);
        Current.add(FL1);
        Current.add(SL1);
        

        Panel2.setLayout(new BorderLayout());
        Panel2.add(Current, BorderLayout.SOUTH);
        Panel2.add(order, BorderLayout.NORTH);
        ButtonListener listener = new ButtonListener();
        order.addActionListener(listener);
        Panel2.setMaximumSize(new Dimension(750, 200));
        this.add(Panel2);
       }

  // It creats the listener
    public class ButtonListener implements ActionListener
            {

        public void actionPerformed (ActionEvent event) {
        //SIZE PRICES
        if (P.isSelected())
        price = 10;
        if (S.isSelected())
        price = 4;
        if (M.isSelected())
        price = 6;    
        if (L.isSelected())
        price = 8;    
        
        count++;
          
        CountLabel.setText("" + count);
       
        //CRUST PRICES
        if (NY.isSelected())
        CRprice += 0.50;
        if (C.isSelected())   
        CRprice += 0.70;
        if (N.isSelected())
        CRprice += 0.90;
        if (WW.isSelected())
        CRprice += 1;
        if (SO.isSelected())
        CRprice += 1.20;
        
        //SAUCE PRICES          
        if (TB.isSelected())
        SAprice += 0.50;
        if (A.isSelected())   
        SAprice += 0.70;
        if (PE.isSelected())
        SAprice += 0.90;
        if (B.isSelected())
        SAprice += 0.87;
        if (OO.isSelected())
        SAprice += 1;
        
        //CHEESE PRICES
        if (MO.isSelected())
        CHprice += 0.50;
        if (PA.isSelected())   
        CHprice += 0.50;
        if (SG.isSelected())
        CHprice += 0.50;
        if (FE.isSelected())
        CHprice += 0.50;
        if (CH.isSelected())
        CHprice += 0.50;
                
        //MEATS PRICES
        if (PEP.isSelected())
        MEprice += 1;
        if (IS.isSelected())
        MEprice += 1.10;
        if (GC.isSelected())
        MEprice += 1.20;
        if (CB.isSelected())
        MEprice += 1.50;
        if (GB.isSelected())
        MEprice += 2;
        
        //Veggies PRICES
        if (AH.isSelected())
        VGprice += 2.0;
        if (RG.isSelected())
        VGprice += 2.2;
        if (RP.isSelected())
        VGprice += 2.3;        
        if (RO.isSelected())
        VGprice += 2.4;
        if (ST.isSelected())
        VGprice += 2.5;
        if (FT.isSelected())
        VGprice += 2.1;
        if (OL.isSelected())
        VGprice += 1.7;
        if (MU.isSelected())    
        VGprice += 1.8;
        if (AR.isSelected())
        VGprice += 2;    
        
        //It sets the text of a label
        TOTALPRICE = (price + CRprice + SAprice + CHprice + VGprice);
      
        PRICE.setText("" + fmt.format(TOTALPRICE));
        TEST.setText("" + fmt.format(TOTALPRICE));
        
        }}}
    
//    }}

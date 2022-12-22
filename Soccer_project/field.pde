import java.util.Random;
import java.util.Scanner;
import java.lang.Math;



public class Field {
  
    public int int_random;
    public String data;
    public boolean outcome;

    public void goal(int x, int y){
        String[][] soccer_field = new String[11][11];
        soccer_field[5][5] = "ball";
        //System.out.println(soccer_field[6][6]);

        int[] select_numbers = new int[5];
        //Random rand = new Random();
        //int int_random = rand.nextInt(0, 7); // this includes -1 to take acccount for poisitioning
        int_random = goalstart();
        for (int i = 0; i < 5; i++){
            select_numbers[i] = int_random + i;
        }
        
        // System.out.println("select number: " + select_numbers[0]);

        for (int number: select_numbers){
            soccer_field[number][10] = "goal";
        }

        
        int x_pos = (x - 1);
        int pos = (y - 1);
        int y_pos = Math.abs(10 - pos);
         
        int rise = (5 - y_pos);
        int run = (5 - x_pos);

        double slope = (double) rise / run;
        double spot = ( 5 * slope ) + 5;
        int y_spot = (int) spot; 
        int y_hit_spot = 10 - y_spot;  // array notation

        // System.out.println("Hitspot : " + y_hit_spot);
        // System.out.println(soccer_field[y_hit_spot][10]);

//--------------------------------------
        outcome = false;

        for ( int number : select_numbers){
            if ( y_hit_spot == number ){
                outcome = true;
            }
        }

        if (outcome == true){
            System.out.println("NICEEEE, YOU MADE A GOALLL");
            
        }
        else{
            System.out.println("OHH NOO! You Missed");
        }


//---------------------------------------------------------\
        System.out.println();
        System.out.println("DATA: \n" + "The Goal is between " + (select_numbers[0] + 1) + " and " + (select_numbers[4] + 1) + " elements");
        System.out.println("You kicked the ball to element " + (y_hit_spot + 1));
        data = "The Goal is between " + (select_numbers[0] + 1) + " & " + (select_numbers[4] + 1) + " and" + " You kicked the ball to element " + (y_hit_spot + 1);
    }
    
    
    public int goalstart(){
       Random rand = new Random();
       int number = rand.nextInt(0, 7);
       return number;
    }

    
    

    
}

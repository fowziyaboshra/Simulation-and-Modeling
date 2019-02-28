x = [0:pi/12:2*pi];
f = sin(x);
plot(x,f);
hold on;

x_low = 0;  
x_high = 2*pi;
y_high = 1;
y_low = -1;

f_of_b1 = sin(x_high);

hits = 0;
prompt = 'Enter trials number : ';
total = input(prompt);

for i = 1:total
    x1=(rand()* (x_high-x_low)) ; 
    y1=rand()* (y_high-y_low) + y_low;   

    f_of_xrand1 = sin(x1);
    #first half
    if  ((y1 >= 0 && y1 <= f_of_xrand1) || (y1 <= 0 && y1 >= f_of_xrand1) )
      hits=hits+1;
      plot(x1,y1,'g*');
      hold on;
    #2nd half
    elseif((x1 <= x_high/2 && y1 >=0) || (x1 >= x_high/2 && y1 <= 0))
     plot(x1,y1,'r*');
     hold on;
    end
   
 end
 
 r = (x_high-x_low)*f_of_b1;
 value = (hits)*r/total




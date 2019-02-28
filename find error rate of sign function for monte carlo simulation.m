x_low = 0;  
x_high = 2*pi;
y_high = 1;
y_low = -1;

#actual value of the integration
actual_value = -cos(x_high)+cos(x_low);
f_of_b1 = sin(x_high);
j = 10;
r = (x_high-x_low)*f_of_b1 #area of the rectangle
while j < 10000 #set the trials number highest range
  hits = 0;
  n = j;
  for i = 1:n
    x1=(rand()* (x_high-x_low)) ; 
    y1=rand()* (y_high-y_low) + y_low;   

    f_of_xrand1 = sin(x1);
   
    if ((y1 >= 0 && y1 <= f_of_xrand1) || (y1 <= 0 && y1 >= f_of_xrand1)) #is the point hit or miss
      hits=hits+1; 
    end  
  end
   
   value = (hits)*r/n; #area under the function
   error = abs(value - actual_value);
   plot(j,error,'b.') 
   hold on
   j = j+10;  
end

xlabel('trailNumber');
ylabel('errors');

axis([0 1000 0 100]);
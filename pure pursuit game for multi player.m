a_x = 0; a_y = 1000;
b_x = 12000; b_y = 2000;
c_x = 10000; c_y = 10000;
d_x = 5000;d_y = 15000;

plot(a_x,a_y,'r','MarkerSize',35);
hold on;

plot(b_x,b_y,'g','MarkerSize',35);
hold on;

plot(c_x,c_y,'b','MarkerSize',35);
hold on;

plot(d_x,d_y,'m','MarkerSize',35);
hold on;

vel_a = vel_b = vel_c = vel_d = 60;
attack_dis=1000;
simu_time=300;

for i = 1:simu_time
  d_x = d_x - vel_d;
  plot(d_x,d_y,'m','MarkerSize',35);
  hold on;
  
  dist_betn_c_and_d = sqrt((c_x-d_x)^2 + (c_y-d_y)^2)
  if dist_betn_c_and_d <= attack_dis
        disp('C wins');
  else
        c_x = c_x + vel_c * ((d_x - c_x)/dist_betn_c_and_d);
        c_y = c_y + vel_c * ((d_y - c_y)/dist_betn_c_and_d);
        plot(c_x,c_y,'b','MarkerSize', 35);
        hold on;      
  end
  dist_betn_b_and_c = sqrt((c_x-b_x)^2 + (c_y-b_y)^2)
  
  if dist_betn_b_and_c <= attack_dis
    disp('B wins');
  else
    b_x = b_x + vel_b * ((c_x - b_x)/dist_betn_b_and_c);
    b_y = b_y + vel_b * ((c_y - b_y)/dist_betn_b_and_c);
    plot(b_x,b_y,'g','MarkerSize', 35);
    hold on;
  end
  dist_betn_a_and_b = sqrt((a_x-b_x)^2 + (a_y-b_y)^2)
  
  if dist_betn_a_and_b <= attack_dis
     disp('A wins');
  else
     a_x = a_x + vel_a * ((b_x - a_x)/dist_betn_a_and_b);
     a_y = a_y + vel_a * ((b_y - a_y)/dist_betn_a_and_b);
     plot(a_x,a_y,'r','MarkerSize', 35);
     hold on;
  end
  i
end
axis([-10000 15000 0 15000]);
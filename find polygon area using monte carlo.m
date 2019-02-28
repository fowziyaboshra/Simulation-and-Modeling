x1 = 1;y1 = 0;
x2 = 0;y2 = - 1;
x3 = -1;y3 = 0;
x4 = 0;y4 = 1;

#square draw
line ([-1 1], [1 1], "linestyle", "-", "color", "b");
line ([1 1], [-1 1], "linestyle", "-", "color", "b");
line ([-1 1], [-1 -1], "linestyle", "-", "color", "b");
line ([-1 -1], [-1 1], "linestyle", "-", "color", "b");
hold on;

#parallelogram draw
line ([0 1], [1 0], "linestyle", "-", "color", "m");
line ([1 0], [0 -1], "linestyle", "-", "color", "m");
line ([0 -1], [-1 0], "linestyle", "-", "color", "m");
line ([-1 0], [0 1], "linestyle", "-", "color", "m");
hold on;

axis([-1.5 1.5 -1.5 1.5]);

#calculate area of parallelogram

area_of_parallelogram = abs((x1 * (y2 - y3) + x2 * (y3 - y1) +  
       x3 * (y1 - y2)) / 2.0) + abs((x1 * (y3 - y4) + 
       x3 * (y4 - y1) + x4 * (y1 - y3)) / 2.0);

prompt = 'Enter trials number : ';
n = input(prompt);
hit = 0;
for i = 1:n
  x_rand = rand()*(x1-x3)+x3;
  y_rand = rand()*(y4-y2)+y2;
  
  area_of_point = abs((x_rand * (y1 - y2) + x1 * (y2 - y_rand) +  
       x2 * (y_rand - y1)) / 2.0) + abs((x_rand * (y2 - y3) + x2 * (y3 - y_rand) +  
       x3 * (y_rand - y2)) / 2.0) + abs((x_rand * (y3 - y4) + x3 * (y4 - y_rand) +  
       x4 * (y_rand - y3)) / 2.0) + abs((x_rand * (y4 - y1) + x4 * (y1 - y_rand) +  
       x1 * (y_rand - y4)) / 2.0);
  if ( area_of_parallelogram >= area_of_point )
    hit = hit + 1;
    plot(x_rand,y_rand,'g*');
    hold on;
  else
    plot(x_rand,y_rand,'r*');
    hold on;
  end
end
area_of_rect = (x1-x3) * (y4 - y2)
result = (hit/n)*area_of_rect



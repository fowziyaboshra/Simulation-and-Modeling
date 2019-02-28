xprompt = 'Enter Trials Number : ';
total = input(prompt);
hits = 0;
f = x.^2 + 5;
x_low = 2;
x_high = 5;
x = linspace(0,6,100);
y = (x.^2+5);
plot(x,y);
hold on
ylim([0,40]);
f_of_b = x_high.^2 + 5;
i = 1;
while i <= total
    x_rand = (rand()* (x_high-x_low)) + x_low;
    y_rand = rand()* f_of_b;
    f_of_xrand = (x_rand.^2 +5);
    if f_of_xrand >= y_rand
        hits = hits+1;
        plot(x_rand,y_rand,'g.')
    else
        plot(x_rand,y_rand,'r.');
    end
    i = i+1;
end
r = (x_high-x_low)*f_of_b;
area = (r*hits)/total;
disp(area)
      

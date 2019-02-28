prompt = 'Enter Trials Number : '
total = input(prompt);
hits = 0;
x = linspace(0,1,100);
y = sqrt(1-x.^2);
plot(x,y);
hold on
i = 1;
while i<=total
    x_rand = rand();
    %disp(x_rand)
    y_rand = rand();
    if (x_rand.^2 +y_rand.^2)<= 1
        hits= hits+1;
        plot(x_rand,y_rand,'g.')
    else
        plot(x_rand,y_rand,'r.');
    end
    i=i+1;
end
%disp(hits)
disp('Value of Pi is : ')
pi_value = (4*hits)/total;
disp(pi_value)

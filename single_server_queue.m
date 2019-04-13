function SSQTemplateImp(n,pa,ps)% ps is the service rate and pa is the arrival rate
rand('state',0) % produce same sequence of random numbers every time you run the code..
disp('This is a single server queue')
arr = [0.4,1.6,2.1,3.8,4.0,5.6,5.8,7.2,9.1,10,11,12,13,1,4];
ser = [2.0,0.7,0.2,1.1,3.7,0.6,0.4,.6,.9,.3];
% we need some data structure and statistical counters
serverBusy = 0; % whether the server is busy or not
cDelay = 0; % delay calculate for each customer
customersServed = 0; % customers served till now
Queue = [] % the queue which is initially empty
currentTime = 0;%initially time 0
% initially there are no departure and arrival scheduled
% we generate the initial arrival only , service rates will be generated only when they are entering in the service
%and initially there is no departure 

%nextArrival = currentTime + 1/geometric(pa) %arrival time for 1st customer,using geometric dist.
nextArrival = arr(1)
nextDeparture = realmax %assign infinite
currentTime = nextArrival % simulation time use next event time advance mechanism
prevTime = currentTime;
total_delay = 0 ;
observe_customer = 0;
weighted_queue = 0;
server_utili = 0;
i = 0;top = 1;
j = 1;
while customersServed<n
	% decide the next event arrival or departure
	if nextArrival<nextDeparture
        prevTime = currentTime;
        server_utili += serverBusy * (currentTime - prevTime);
        currentTime = nextArrival
    else
        prevTime = currentTime;
        server_utili += serverBusy * (currentTime - prevTime);
		    currentTime = nextDeparture
	end
		
	if currentTime == nextArrival % next event arrival
        % check if the server is busy or not
            % server idle :
            if serverBusy == 0
                      % 1.set delay = 0 for this customer.
                      cDelay = 0;
                      total_delay = total_delay + cDelay;
                      % 2.mark the server busy
                      serverBusy = 1;
                      % 3.schedule a departure time for this customer
                     % nextDeparture = currentTime + 1/geometric(ps)
                     serv = ser(j)
                     nextDeparture = currentTime+ser(j)
                     
            % server busy :
            else
                      % 1. put the new job(arrival time) into the queue
                      weighted_queue += length(Queue) * (currentTime - prevTime);
                      Queue(top) = nextArrival
                      top = top+1;
                      observe_queue = length(Queue)*(currentTime - prevTime);
            end
		       % generate next arrival
           % nextArrival = nextArrival + 1/geometric(pa)
           arrv = arr(i+1)
           nextArrival = arr(i+1)
    else
        customersServed = customersServed + 1;
        
        serverBusy = 0;
        
        % check if the queue is empty or not 
            % if Queue is not empty :
            if length(Queue) ~= 0
                    % 1. subtract the first element from the Queue.
                    Queue;
                    weighted_queue += length(Queue) * (currentTime - prevTime);
                    pop_value = Queue(1)
                    top = top-1;
                    j=j+1
                    % 2. compute delay of the customer you have subtructed
                    cDelay = currentTime - pop_value;
                    total_delay = total_delay + cDelay;
                    % from step-1
                    % 3. schedule a departure for this customer
                    %nextDeparture = currentTime + 1/geometric(ps)
                    serv = ser(j)
                    nextDeparture = currentTime+ser(j)
                    
                    % 4. move each customer in Queue 1 place up
                    Queue = Queue(2:length(Queue))
                    %make server busy
                    serverBusy = 1;
            % if Queue is empty :
            else
                    % 1. set the next event as arrival event.
                    nextDeparture = realmax;
            end
    end  
  i = i+1;  
end
total_delay 
currentTime
disp('Average Delay:') % you have to find it out
average_delay = (total_delay / currentTime);
disp(average_delay);
%customer_in_queue 
weighted_queue
disp('Average number of customers in queue : ') % you have to find it out
average_no_of_customer_in_queue = (weighted_queue/currentTime);
disp(average_no_of_customer_in_queue);
disp('Server Utilization : ') % you have to find it out
server_utilization = server_utili/currentTime;
disp(server_utilization);
end
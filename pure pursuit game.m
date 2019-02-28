
def_x=0;def_y=0;
plot(def_x,def_y,'r','MarkerSize',25);
hold on;
tar_x=10000;tar_y=10000;
plot(tar_x,tar_y,'g','MarkerSize',25);
hold on;

attack_dis=1000;
simu_time=300;
velocity_of_def=60;
velocity_of_tar=50;
del_t = 1;

del_s_of_tar = velocity_of_tar*del_t;
del_s_of_def = velocity_of_def*del_t;

for i=1:simu_time
  distance_of_def_and_tar = (sqrt((tar_x - def_x)*(tar_x - def_x)+(tar_y - def_y)*(tar_y - def_y)));
  if((distance_of_def_and_tar <= attack_dis))
     disp('Defense A wins');
     break;
  end
  del_s_of_tar = del_s_of_tar + 1;
  del_s_of_def = del_s_of_def + 1;
  def_x = def_x + del_s_of_def * ((tar_x - def_x)/distance_of_def_and_tar);
  def_y = def_y + del_s_of_def * ((tar_y - def_y)/distance_of_def_and_tar);
  
  plot(def_x,def_y,'r','MarkerSize',35);
  hold on;
  
  tar_x = tar_x - del_s_of_tar;
  
  plot(tar_x,tar_y,'g','MarkerSize',35);
  hold on;
  
end

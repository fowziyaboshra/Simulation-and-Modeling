prompt = 'Number of generation : ';
n = input(prompt);

prompt = 'Number of rows and columns : ';
r_c = input(prompt);

zero = zeros(r_c);
%initial value
zero(2,3) = 1;
zero(2,4) = 1;
zero(2,5) = 1;
zero(3,2) = 1;
zero(3,3) = 1;
zero(3,4) = 1;
zero(5,5) = 0;
mat = zero;
for g = 1:n
  gen = g;
    printf("Generation %d \n", gen)
    disp(mat);
    for i=1:r_c
        for j=1:r_c
          count = 0;
          if (i == 1)
            if(j == 1) #first row and first column
              if(zero(i,j+1) == 1)
                count = count + 1;
              end
              if(zero(i+1,j) == 1)
                count = count + 1;
              end
              if(zero(i+1,j+1) == 1)
                count = count + 1;
              end
            elseif(j == r_c) #first row and last column
              if(zero(i,j-1) == 1)
                count = count + 1;
              end
              if(zero(i+1,j) == 1)
                count = count + 1;
              end
              if(zero(i+1,j-1) == 1)
                count = count + 1;
              end
            else #first row any middle column
              if(zero(i,j-1) == 1)
                count = count + 1;
              end
              if(zero(i+1,j-1) == 1)
                count = count + 1;
              end
              if(zero(i+1,j) == 1)
                count = count + 1;
              end
              if(zero(i+1,j+1) == 1)
                count = count + 1;
              end
              if(zero(i,j+1) == 1)
                count = count + 1;
              end             
            end
          elseif(i == r_c) 
             if(j == 1) #last row, first column
                if(zero(i-1,j) == 1)
                  count = count + 1;
                end
                if(zero(i-1,j+1) == 1)
                  count = count + 1;
                end
                if(zero(i,j+1) == 1)
                  count = count + 1;
                end
             elseif(j == r_c)#last row, last column
                if(zero(i,j-1) == 1)
                  count = count + 1;
                end
                if(zero(i-1,j-1) == 1)
                  count = count + 1;
                end
                if(zero(i-1,j) == 1)
                  count = count + 1;
                end
             else # last row any middle column
                if(zero(i,j-1) == 1)
                  count = count + 1;
                end
                if(zero(i-1,j-1) == 1)
                  count = count + 1;
                end
                if(zero(i-1,j) == 1)
                  count = count + 1;
                end
                if(zero(i-1,j+1) == 1)
                  count = count + 1;
                end
                if(zero(i,j+1) == 1)
                  count = count + 1;
                end               
             end
          else 
             if(j == 1) #any middle row first column
               if(zero(i-1,j) == 1)
                  count = count + 1;
                end 
                if(zero(i-1,j+1) == 1)
                  count = count + 1;
                end 
                if(zero(i,j+1) == 1)
                  count = count + 1;
                end 
                if(zero(i+1,j+1) == 1)
                  count = count + 1;
                end 
                if(zero(i+1,j) == 1)
                  count = count + 1;
                end
               elseif( j == r_c ) #any middle row last column
                  if(zero(i-1,j) == 1)
                    count = count + 1;
                  end
                  if(zero(i-1,j-1) == 1)
                    count = count + 1;
                 end
                 if(zero(i,j-1) == 1)
                    count = count + 1;
                 end
                 if(zero(i+1,j-1) == 1)
                    count = count + 1;
                 end
                 if(zero(i+1,j) == 1)
                    count = count + 1;
                 end
               else # any center cell
                 if(zero(i-1,j-1) == 1)
                    count = count + 1;
                 end
                 if(zero(i,j-1) == 1)
                    count = count + 1;
                 end
                 if(zero(i+1,j-1) == 1)
                    count = count + 1;
                 end
                 if(zero(i+1,j) == 1)
                    count = count + 1;
                 end
                 if(zero(i+1,j+1) == 1)
                    count = count + 1;
                 end
                 if(zero(i,j+1) == 1)
                    count = count + 1;
                 end
                 if(zero(i-1,j+1) == 1)
                    count = count + 1;
                 end
                 if(zero(i-1,j) == 1)
                    count = count + 1;
                 end
             end
          end
          if ( zero(i,j) == 0) # dead cell condistion
            if( count == 3)
              mat(i,j) = 1;
            end
          else #live cell condition
            if( count < 2 || count >3)
              mat(i,j) = 0;
            end
          end
        end
    end
    
    zero = mat;
    
end
students = [...
   'Alec    ';
   'Victor  ';
   'Jeff    ';
   'Vincy   ';
   'Luis    ';
   'Andrew  ';
   'Alice   ';
   'Jasper  ';
   'Justin  ';
   'Kevin   ';
   'Raymond ';
   'Michelle';
   'Cynthia ';
   'Kyleen  ';
   'Rayed   ';
   'Hana    ';
   'Jack    ';
   'Mary    ';
   'Young   ';
   'Edwin   ';
   'Kalan   ';
   'Pat     ';
   'Anjali  ';
   'Mush    ';
   'Ethan   ';
   'Divya   ';
   'Oscar   ';
   'Harrison';
   'Roy     ';
   'Amanda  ';
   'Himal   ';
   'Brian   '];
num = size(students,1);
nump = num/2;

pairs = randperm(num);
p = [pairs(1:(nump)) ; pairs((nump+1):num)].';

clc;
for n=1:nump
    disp(['Pair #',num2str(n),':  ',...
    students(p(n,1),:),' & ',students(p(n,2),:)]);
end



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

%% QUESTIONS
%
%  How would you draw just 1 name out of the list?
%  Modify the script to create groups of 3?
%  Make the script flexible to create groups of size N?

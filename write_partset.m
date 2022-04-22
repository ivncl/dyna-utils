function []=write_partset(sid,da1,da2,da3,da4,solver,pids,filename,permission)

% % % % % % write *SET_PART_LIST to file
% % % *SET_PART_LIST
% % % $#     sid       da1       da2       da3       da4    solver      
% % %          1       0.0       0.0       0.0       0.0MECH
% % % $#    pid1      pid2      pid3      pid4      pid5      pid6      pid7      pid8
% % %          0         0         0         0         0         0         0         0
% % % *END

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*SET_PART_LIST\n');
fprintf(fid,'$#     sid       da1       da2       da3       da4    solver\n');
fprintf(fid,'%10d%10d%10d%10d%10d%s\n',sid,da1,da2,da3,da4,solver);
fprintf(fid,'$#    pid1      pid2      pid3      pid4      pid5      pid6      pid7      pid8\n');

N=length(pids);
Nrows=ceil(N/8);

[pos_matrix,vector]=vector2matrix(pids,8);

for i=1:Nrows
    fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d\n',vector(pos_matrix(i,1)), ...
        vector(pos_matrix(i,2)),vector(pos_matrix(i,3)),vector(pos_matrix(i,4)), ...
        vector(pos_matrix(i,5)),vector(pos_matrix(i,6)),vector(pos_matrix(i,7)), ...
        vector(pos_matrix(i,8)));
end
  
fclose(fid);  
function []=write_coord_sys(row1,row2,filename,permission)

% % % % *DEFINE_COORDINATE_SYSTEM
% % % %          1       0.0       0.0       0.0       0.0       0.0       0.0         0
% % % %        0.0       0.0       0.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DEFINE_COORDINATE_SYSTEM\n');
fprintf(fid,'%10d%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10d\n',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'%10.2f%10.2f%10.2f\n',row2(1),row2(2),row2(3));
  
fclose(fid);  
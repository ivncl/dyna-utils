function []=write_define_vector(row1,filename,permission)

% % % % % % write *DEFINE_VECTOR to file
% % % *DEFINE_VECTOR
% % % $#     vid        xt        yt        zt        xh        yh        zh       cid
% % %          1       0.0       0.0       0.0    1000.0       0.0       0.0         0


if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DEFINE_VECTOR\n');
fprintf(fid,'$#     vid        xt        yt        zt        xh        yh        zh       cid\n');
fprintf(fid,'%10d%10f%10f%10f%10f%10f%10f%10d\n',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
  
fclose(fid);  
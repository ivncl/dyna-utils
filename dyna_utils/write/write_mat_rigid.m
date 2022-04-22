function []=write_mat_rigid(row1,row2,row3,title,filename,permission)

% % % *MAT_RIGID_TITLE
% % % box_5tons
% % % $#     mid        ro         e        pr         n    couple         m     alias
% % %          23.13000E-7  210000.0       0.3       0.0       0.0       0.0          
% % % $#     cmo      con1      con2    
% % %        0.0         0         0
% % % $#lco or a1        a2        a3        v1        v2        v3  
% % %        0.0       0.0       0.0       0.0       0.0       0.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*MAT_RIGID_TITLE\n');
fprintf(fid,'%s\n',title);
fprintf(fid,'$#     mid        ro         e        pr         n    couple         m     alias\n');
fprintf(fid,'%10d%.4E%10f%10f%10f%10f%10f%10f',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7));
fprintf(fid,'\n');
fprintf(fid,'$#     cmo      con1      con2\n');
fprintf(fid,'%10f%10d%10d\n',row2(1),row2(2),row2(3));
fprintf(fid,'$#lco or a1        a2        a3        v1        v2        v3 \n');
fprintf(fid,'%10f%10f%10f%10f%10f%10f\n',row3(1),row3(2),row3(3),row3(4),row3(5),row3(6));
  
fclose(fid);  
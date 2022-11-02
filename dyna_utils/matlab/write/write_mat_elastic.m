function []=write_mat_elastic(mid,ro,e,pr,da,db,filename,permission)

% % % *MAT_ELASTIC_TITLE
% % % fuel_bay00L
% % % $#     mid        ro         e        pr        da        db  not used        
% % %   200000016.6800e-06      1e+5      0.33       0.0       0.0       0.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*MAT_ELASTIC\n');
fprintf(fid,'$#     mid        ro         e        pr        da        db  not used\n');
fprintf(fid,'%10d%.4e%10f%10f%10f%10f       0.0\n',mid,ro,e,pr,da,db);
  
fclose(fid);  
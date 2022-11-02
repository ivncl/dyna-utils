function []=write_database_generic(dt,binary,lcur,ioopt,type,filename,permission)

% % % % *DATABASE_GLSTAT
% % % % $#      dt    binary      lcur     ioopt     
% % % % 1.00000E-5         3         0         1
% % % % *DATABASE_MATSUM
% % % % $#      dt    binary      lcur     ioopt     
% % % % 1.00000E-5         3         0         1
% % % % *DATABASE_SECFORC
% % % % $#      dt    binary      lcur     ioopt     
% % % % 1.00000E-5         3         0         1

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DATABASE_%s\n',type);
fprintf(fid,'$#      dt    binary      lcur     ioopt\n');
fprintf(fid,'%.4E%10d%10d%10d\n',dt,binary,lcur,ioopt);
  
fclose(fid);
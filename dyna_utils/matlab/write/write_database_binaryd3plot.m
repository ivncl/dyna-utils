function []=write_database_binaryd3plot(row1,row2,filename,permission)

% % % % *DATABASE_BINARY_D3PLOT
% % % % $#      dt      lcdt      beam     npltc    psetid      
% % % %       0.01         0         0         0         0
% % % % $#   ioopt      rate    cutoff    window      type      pset    
% % % %          0       0.0       0.0       0.0         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DATABASE_BINARY_D3PLOT\n');
fprintf(fid,'$#      dt      lcdt      beam     npltc    psetid\n');
fprintf(fid,'%10f%10d%10d%10d%10d\n',row1(1),row1(2),row1(3),row1(4),row1(5));
fprintf(fid,'$#   ioopt      rate    cutoff    window      type      pset\n');
fprintf(fid,'%10d%10f%10f%10f%10d%10d\n',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6));
  
fclose(fid);


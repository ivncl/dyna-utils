function []=write_define_curve(row1,datas,filename,permission)

% % % % % % write *DEFINE_CURVE to file
% % % % *DEFINE_CURVE
% % % % $#    lcid      sidr       sfa       sfo      offa      offo    dattyp     lcint
% % % %          1         0       1.0       1.0       0.0       0.0         0         0
% % % % $#                a1                  o1  
% % % %                  0.0                 0.0
% % % %                 0.05             80000.0
% % % %                 0.15             80000.0
% % % %                  0.2                 0.0
% % % %                  0.5                 0.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DEFINE_CURVE\n');
fprintf(fid,'$#    lcid      sidr       sfa       sfo      offa      offo    dattyp     lcint\n');
fprintf(fid,'%10d%10d%10f%10f%10f%10f%10d%10d\n',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'$#                a1                  o1 \n');

for i=1:size(datas,1)
    fprintf(fid,'%20f%20f\n',datas(i,1),datas(i,2));
end
  
fclose(fid);  
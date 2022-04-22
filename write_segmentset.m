function []=write_segmentset(sid,da1,da2,da3,da4,solver,nids,title,filename,permission)

% % *SET_SEGMENT_TITLE
% % left_wall_internal_face
% % $#     sid       da1       da2       da3       da4    solver       its         - 
% %          1       0.0       0.0       0.0       0.0MECH               0          
% % $#      n1        n2        n3        n4        a1        a2        a3        a4 
% %     187674    187671    187584    187604       0.0       0.0       0.0       0.0
% %     186399    186396    186309    186329       0.0       0.0       0.0       0.0
 
if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*SET_SEGMENT_TITLE\n');
fprintf(fid,'%s\n',title);
fprintf(fid,'$#     sid       da1       da2       da3       da4    solver       its         -\n');
fprintf(fid,'%10d%10d%10d%10d%10d%s%10d\n',sid,da1,da2,da3,da4,solver,0);
fprintf(fid,'$#      n1        n2        n3        n4        a1        a2        a3        a4\n');

for i=1:size(nids,1)
    fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d\n',nids(i,1),nids(i,2),nids(i,3),nids(i,4),0,0,0,0);
end
  
fclose(fid);  
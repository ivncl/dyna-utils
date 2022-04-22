function []=write_load_nodepoint(row1,filename,permission)

% % % % *LOAD_NODE_POINT
% % % % $#     nid       dof      lcid        sf       cid        m1        m2        m3
% % % %          0         1         0       1.0         0         0         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*LOAD_NODE_POINT\n');
fprintf(fid,'$#     nid       dof      lcid        sf       cid        m1        m2        m3\n');
fprintf(fid,'%10d%10d%10d%10f%10d%10d%10d%10d\n',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
  
fclose(fid);


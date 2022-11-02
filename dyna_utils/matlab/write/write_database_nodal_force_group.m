function []=write_database_nodal_force_group(nsid,cid,filename,permission)

% % % % *DATABASE_NODAL_FORCE_GROUP
% % % % $#    nsid       cid   
% % % %          3         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DATABASE_NODAL_FORCE_GROUP\n');
fprintf(fid,'$#    nsid       cid\n');
fprintf(fid,'%10d%10d\n',nsid,cid);
  
fclose(fid);
function []=write_boundary_spc_set_id(id,heading,nsid,cid,dofx,dofy, ...
    dofz,dofrx,dofry,dofrz,filename,permission)

% % % % *BOUNDARY_SPC_SET_ID
% % % % $#      id                                                               heading
% % % %          1Vincolo
% % % % $#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
% % % %          1         0         1         1         1         1         1         1

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*BOUNDARY_SPC_SET_ID\n');
fprintf(fid,'$#      id                                                               heading\n');
fprintf(fid,'%10d%s\n',id,heading);
fprintf(fid,'$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d\n',nsid,cid,dofx,dofy,dofz,dofrx,dofry,dofrz);

  
fclose(fid);
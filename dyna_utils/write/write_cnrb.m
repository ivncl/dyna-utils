function []=write_cnrb(pid,nsid,cid,pnode,iprt,drflag,rrflag,filename,permission)

% % % % % % write cnrb to file
% % % *CONSTRAINED_NODAL_RIGID_BODY
% % % $#     pid       cid      nsid     pnode      iprt    drflag    rrflag      
% % %  701151901         0 701151901   2000567         0         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*CONSTRAINED_NODAL_RIGID_BODY\n');
fprintf(fid,'$#     pid       cid      nsid     pnode      iprt    drflag    rrflag\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d\n',pid,cid,nsid,pnode,iprt,drflag,rrflag);

fclose(fid);
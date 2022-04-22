function []=write_cnrb_inertia(pid,nsid,cid,pnode,iprt,drflag,rrflag, ...
    xc,yc,zc,tm,ircs,nodeid, ...
    ixx,ixy,ixz,iyy,iyz,izz, ...
    vtx,vty,vtz,vrx,vry,vrz, ...
    filename,permission)

% % % % % % write cnrb to file
% % % *CONSTRAINED_NODAL_RIGID_BODY
% % % $#     pid       cid      nsid     pnode      iprt    drflag    rrflag      
% % %  701151901         0 701151901   2000567         0         0         0
% % % *CONSTRAINED_NODAL_RIGID_BODY_INERTIA
% % % $#     pid       cid      nsid     pnode      iprt    drflag    rrflag      
% % %  701151901         0 701151901         0         0         0         0
% % % $#      xc        yc        zc        tm      ircs    nodeid      
% % %       20.0      -3.0       5.0       0.0         0         0
% % % $#     ixx       ixy       ixz       iyy       iyz       izz   
% % %        0.0       0.0       0.0       0.0       0.0       0.0
% % % $#     vtx       vty       vtz       vrx       vry       vrz   
% % %        0.0       0.0       0.0       0.0       0.0       0.0
% % % *END


if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*CONSTRAINED_NODAL_RIGID_BODY_INERTIA\n');
fprintf(fid,'$#     pid       cid      nsid     pnode      iprt    drflag    rrflag\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d\n',pid,cid,nsid,pnode,iprt,drflag,rrflag);
fprintf(fid,'%10.2f%10.2f%10.2f%10f%10d%10d\n',xc,yc,zc,tm,ircs,nodeid);
fprintf(fid,'%10f%10f%10f%10f%10f%10f\n',ixx,ixy,ixz,iyy,iyz,izz);
fprintf(fid,'%10f%10f%10f%10f%10f%10f\n',vtx,vty,vtz,vrx,vry,vrz);

fclose(fid);
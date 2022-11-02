function []=write_boundary_prescribed_motion_rigid(pid,dof,vad,lcid, ...
    sf,vid,death,birth,filename,permission)

% % *BOUNDARY_PRESCRIBED_MOTION_RIGID
% % $#     pid       dof       vad      lcid        sf       vid     death     birth
% %   10000300         3         2         1       1.0         01.00000E28       0.0
  
if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*BOUNDARY_PRESCRIBED_MOTION_RIGID\n');
fprintf(fid,'$#     pid       dof       vad      lcid        sf       vid     death     birth\n');
fprintf(fid,'%10d%10d%10d%10d%10f%10d%.4E%10f\n',pid,dof,vad,lcid,sf,vid,death,birth);


fclose(fid);


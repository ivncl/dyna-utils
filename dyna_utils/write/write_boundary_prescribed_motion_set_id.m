function []=write_boundary_prescribed_motion_set_id(id,heading,nsid,dof,vad,lcid, ...
    sf,vid,death,birth,filename,permission)

% % % % *BOUNDARY_PRESCRIBED_MOTION_SET_ID
% % % % $#      id                                                               heading
% % % %          0Spostamento
% % % % $#    nsid       dof       vad      lcid        sf       vid     death     birth
% % % %          2         1         2         1       1.0         01.00000E28       0.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*BOUNDARY_PRESCRIBED_MOTION_SET_ID\n');
fprintf(fid,'$#      id                                                               heading\n');
fprintf(fid,'%10d%s\n',id,heading);
fprintf(fid,'$#    nsid       dof       vad      lcid        sf       vid     death     birth\n');
fprintf(fid,'%10d%10d%10d%10d%10f%10d%8E%10f\n',nsid,dof,vad,lcid,sf,vid,death,birth);

  
fclose(fid);


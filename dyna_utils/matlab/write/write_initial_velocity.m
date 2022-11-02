function []=write_initial_velocity(row1,row2,filename,permission)

% % % *INITIAL_VELOCITY_GENERATION
% % % $#nsid/pid      styp     omega        vx        vy        vz     ivatn      icid
% % %          4         2       0.0       0.0       0.0   -4000.0         0         0
% % % $#      xc        yc        zc        nx        ny        nz     phase    irigid
% % %        0.0       0.0       0.0       0.0       0.0       0.0         0         0



if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*INITIAL_VELOCITY_GENERATION\n');
fprintf(fid,'$#nsid/pid      styp     omega        vx        vy        vz     ivatn      icid\n');
fprintf(fid,'%10d%10d%10f%10f%10f%.3E%10d%10d',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'\n');
fprintf(fid,'$#      xc        yc        zc        nx        ny        nz     phase    irigid\n');
fprintf(fid,'%10f%10f%10f%10f%10f%10f%10d%10d',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6),row2(7),row2(8));
fprintf(fid,'\n');
  
fclose(fid);  
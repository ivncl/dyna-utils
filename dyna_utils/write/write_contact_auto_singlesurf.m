function []=write_contact_auto_singlesurf(row1,row2,row3,filename,permission)

% % % *CONTACT_AUTOMATIC_SINGLE_SURFACE
% % % $#     cid                                                                 title
% % % $#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
% % %          3         0         2         0         0         0         0         0
% % % $#      fs        fd        dc        vc       vdc    penchk        bt        dt
% % %        0.0       0.0       0.0       0.0       0.0         0       0.01.00000E20
% % % $#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
% % %        1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*CONTACT_AUTOMATIC_SINGLE_SURFACE\n');
fprintf(fid,'$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'\n');
fprintf(fid,'$#      fs        fd        dc        vc       vdc    penchk        bt        dt\n');
fprintf(fid,'%10f%10f%10f%10f%10f%10d%10f%.4E',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6),row2(7),row2(8));
fprintf(fid,'\n');
fprintf(fid,'$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf\n');
fprintf(fid,'%10f%10f%10f%10f%10f%10f%10f%10f',row3(1),row3(2),row3(3),row3(4),row3(5),row3(6),row3(7),row3(8));
fprintf(fid,'\n');

  
fclose(fid);  
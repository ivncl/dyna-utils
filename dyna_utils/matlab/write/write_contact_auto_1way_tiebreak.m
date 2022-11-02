function []=write_contact_auto_1way_tiebreak(cid,row1,row2,row3,row4,filename,permission)

% % % *CONTACT_AUTOMATIC_ONE_WAY_SURFACE_TO_SURFACE_TIEBREAK_ID
% % % $#     cid                                                                 title
% % %          2                                                                      
% % % $#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
% % %          0         0         0         0         0         0         0         0
% % % $#      fs        fd        dc        vc       vdc    penchk        bt        dt
% % %        0.0       0.0       0.0       0.0       0.0         0       0.01.00000E20
% % % $#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
% % %        1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0
% % % $#  option      nfls      sfls     param    eraten    erates     ct2cn        cn
% % %          2     500.0     300.0       0.0       0.0       0.0       0.0       0.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*CONTACT_AUTOMATIC_ONE_WAY_SURFACE_TO_SURFACE_TIEBREAK_ID\n');
fprintf(fid,'$#     cid                                                                 title\n');
fprintf(fid,'%10d\n',cid);
fprintf(fid,'$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'\n');
fprintf(fid,'$#      fs        fd        dc        vc       vdc    penchk        bt        dt\n');
fprintf(fid,'%10f%10f%10f%10f%10f%10d%10f%.4E',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6),row2(7),row2(8));
fprintf(fid,'\n');
fprintf(fid,'$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf\n');
fprintf(fid,'%10f%10f%10f%10f%10f%10f%10f%10f',row3(1),row3(2),row3(3),row3(4),row3(5),row3(6),row3(7),row3(8));
fprintf(fid,'\n');
fprintf(fid,'$#  option      nfls      sfls     param    eraten    erates     ct2cn        cn\n');
fprintf(fid,'%10d%10f%10f%10f%10f%10f%10f%10f',row4(1),row4(2),row4(3),row4(4),row4(5),row4(6),row4(7),row4(8));
fprintf(fid,'\n');
  
fclose(fid);  
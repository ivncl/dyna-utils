function []=write_database_cross_section_plane_id(id,title,row2,row3,permission,filename)

% % % % *DATABASE_CROSS_SECTION_PLANE_ID
% % % % $#    csid                                                                 title
% % % %          1Sezione in mezzo
% % % % $#    psid       xct       yct       zct       xch       ych       zch    radius
% % % %          1       0.0       0.0       0.0      15.0       0.0       0.0       0.0
% % % % $#    xhev      yhev      zhev      lenl      lenm        id     itype     
% % % %        0.0      15.0       0.0       0.0       0.0         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DATABASE_CROSS_SECTION_PLANE_ID\n');
fprintf(fid,'$#    csid                                                                 title\n');
fprintf(fid,'%10d%s\n',id,title);
fprintf(fid,'$#    psid       xct       yct       zct       xch       ych       zch    radius\n');
fprintf(fid,'%10d%10f%10f%10f%10f%10f%10f%10f\n',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6),row2(7),row2(8));
fprintf(fid,'%10f%10f%10f%10f%10f%10f%10d\n',row3(1),row3(2),row3(3),row3(4),row3(5),row3(6),row3(7));

fclose(fid);
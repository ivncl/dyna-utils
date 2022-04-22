function []=write_database_extent_binary(row1,row2,row3,row4,filename,permission)

% % % % *DATABASE_EXTENT_BINARY
% % % % $#   neiph     neips    maxint    strflg    sigflg    epsflg    rltflg    engflg
% % % %          0         0         3         1         1         1         1         1
% % % % $#  cmpflg    ieverp    beamip     dcomp      shge     stssz    n3thdt   ialemat
% % % %          0         0         0         1         1         1         2         1
% % % % $# nintsld   pkp_sen      sclp     hydro     msscl     therm    intout    nodout
% % % %          0         0       1.0         0         0         0           
% % % % $#    dtdt    resplt     neipb     
% % % %          0         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*DATABASE_EXTENT_BINARY\n');
fprintf(fid,'$#   neiph     neips    maxint    strflg    sigflg    epsflg    rltflg    engflg\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d\n',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'$#  cmpflg    ieverp    beamip     dcomp      shge     stssz    n3thdt   ialemat\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d\n',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6),row2(7),row2(8));
fprintf(fid,'$# nintsld   pkp_sen      sclp     hydro     msscl     therm    intout    nodout\n');
fprintf(fid,'%10d%10d%10f%10d%10d%10d%10d%10d\n',row3(1),row3(2),row3(3),row3(4),row3(5),row3(6),row3(7),row3(8));
fprintf(fid,'$#    dtdt    resplt     neipb\n');
fprintf(fid,'%10d%10d%10d\n',row4(1),row4(2),row4(3));
  
fclose(fid);
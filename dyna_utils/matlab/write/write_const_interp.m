function []=write_const_interp(icid,dnid,ddof,cidd,ityp,idnsw,fgm,inid,idof,wght,filename,permission)

% % % % % % write *CONSTRAINED_INTERPOLATION to file
% % % *CONSTRAINED_INTERPOLATION
% % % $#    icid      dnid      ddof      cidd      ityp     idnsw       fgm   
% % %          1         0    123456         0         1         0         0
% % % $#    inid      idof    twghtx    twghty    twghtz    rwghtx    rwghty    rwghtz
% % %          0       123       1.0       1.0       1.0       1.0       1.0       1.0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*CONSTRAINED_INTERPOLATION\n');
fprintf(fid,'$#    icid      dnid      ddof      cidd      ityp     idnsw       fgm\n');
fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d',icid,dnid,ddof,cidd,ityp,idnsw,fgm);
fprintf(fid,'\n');
fprintf(fid,'$#    inid      idof    twghtx    twghty    twghtz    rwghtx    rwghty    rwghtz\n');
fprintf(fid,'%10d%10d%10f%10f%10f%10f%10f%10f\n',inid,idof,wght(1),wght(2),wght(3),wght(4),wght(5),wght(6));

fclose(fid);
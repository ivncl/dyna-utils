function []=write_part(title,pid,secid,mid,eosid,hgid,grav,adpopt,tmid,permission,filename)

% % % *PART
% % % $#                                                                         title
% % % ShearTie_WS136L_FlangeMid
% % % $#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
% % %    1302004   1302004      7451         0         0         0         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*PART\n');
fprintf(fid,'$#\n');
fprintf(fid,'%s\n',title);
fprintf(fid,'$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid\n');
fprintf(fid,'%10d%10d%10d%10.1f%10d%10d%10d%10d',pid,secid,mid,eosid,hgid,grav,adpopt,tmid);
fprintf(fid,'\n');

fclose(fid);
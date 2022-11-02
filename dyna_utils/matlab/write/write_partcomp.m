function []=write_partcomp(pid,elform,shrf,nloc,marea,hgid,adpopt,ithelfrm,data,title,filename,permission)

% % % *PART_COMPOSITE
% % % $#                                                                         title
% % % title
% % % $#     pid    elform      shrf      nloc     marea      hgid    adpopt  ithelfrm
% % %    1000000        16       0.0       0.0       0.0         0         0         0
% % % $#    mid1    thick1        b1     tmid1      mid2    thick2        b2     tmid2
% % %        700     0.200       0.0         0         0       0.0       0.0         0
% % %        800     0.188       0.0         0         0       0.0       0.0         0
% % %        800     0.188      45.0         0         0       0.0       0.0         0
% % %        800     0.188     -45.0         0         0       0.0       0.0         0
% % %        800     0.188      90.0         0         0       0.0       0.0         0
% % %        800     0.188     -45.0         0         0       0.0       0.0         0
% % %        800     0.188      45.0         0         0       0.0       0.0         0
% % %        800     0.188       0.0         0         0       0.0       0.0         0
% % %        800     0.188      90.0         0         0       0.0       0.0         0
% % %        800     0.188      90.0         0         0       0.0       0.0         0
% % %        800     0.188       0.0         0         0       0.0       0.0         0
% % %        700     0.200       0.0         0         0       0.0       0.0         0
% % %        700     0.200       0.0         0         0       0.0       0.0         0
% % %        800     0.188       0.0         0         0       0.0       0.0         0
% % %        800     0.188      90.0         0         0       0.0       0.0         0
% % %        800     0.188      90.0         0         0       0.0       0.0         0
% % %        800     0.188       0.0         0         0       0.0       0.0         0
% % %        800     0.188       0.0         0         0       0.0       0.0         0
% % %        800     0.188      45.0         0         0       0.0       0.0         0
% % %        800     0.188     -45.0         0         0       0.0       0.0         0
% % %        800     0.188      90.0         0         0       0.0       0.0         0
% % %        800     0.188     -45.0         0         0       0.0       0.0         0
% % %        800     0.188      45.0         0         0       0.0       0.0         0
% % %        700     0.200       0.0         0         0       0.0       0.0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*PART_COMPOSITE\n');
fprintf(fid,'$#\n');
fprintf(fid,'%s\n',title);
fprintf(fid,'$#     pid    elform      shrf      nloc     marea      hgid    adpopt  ithelfrm\n');
fprintf(fid,'%10d%10d%10.1f%10.1f%10.1f%10d%10d%10d',pid,elform,shrf,nloc,marea,hgid,adpopt,ithelfrm);
fprintf(fid,'\n');
fprintf(fid,'$#    mid1    thick1        b1     tmid1      mid2    thick2        b2     tmid2\n');
for i=1:size(data,1)
%     fprintf(fid,'%10d%10.3f%10.1f%10d%10d%10.1f%10.1f%10d\n',data(i,1),data(i,2)*25.4,data(i,3),data(i,4),data(i,5),data(i,6),data(i,7),data(i,8));
    fprintf(fid,'%10d%10.3f%10.1f%10d%10d%10.1f%10.1f%10d\n',data(i,1),data(i,2),data(i,3),data(i,4),data(i,5),data(i,6),data(i,7),data(i,8));

end

fclose(fid);
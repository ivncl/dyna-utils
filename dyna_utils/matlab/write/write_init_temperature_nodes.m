function []=write_init_temperature_nodes(nids,temps,locs,filename,permission)

% % % *INITIAL_TEMPERATURE_NODE
% % % $#     nid      temp       loc   
% % %          0       0.0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

N=length(nids);

fprintf(fid,'*INITIAL_TEMPERATURE_NODE\n');
fprintf(fid,'$#   nid               x               y               z      tc      rc\n');
for i=1:N
    fprintf(fid,'%10d%10f%10d\n',nids(i),temps(i),locs(i));
end

fclose(fid);

 
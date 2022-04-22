function []=write_nodes(nids,coords,tc,rc,filename,permission)

% % % % % % % write *NODE key to file
% % % % *NODE
% % % % $#   nid               x               y               z      tc      rc  
% % % %        1        6645.999        2.628905        4940.287       0       0
% % % %        2        6468.327        1.105805        4697.612       0       0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

N=length(nids);

fprintf(fid,'*NODE\n');
fprintf(fid,'$#   nid               x               y               z      tc      rc\n');
for i=1:N
    fprintf(fid,'%8d%16e%16e%16e%8d%8d\n',nids(i),coords(i,1),coords(i,2),coords(i,3),tc(i),rc(i));
end

fclose(fid);

 
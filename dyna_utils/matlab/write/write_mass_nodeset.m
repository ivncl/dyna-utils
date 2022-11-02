function []=write_mass_nodeset(eids,nsids,masses,pids,filename,permission)

% % % % *ELEMENT_MASS_NODE_SET
% % % % $#   eid    nsid            mass     pid   
% % % %        5       5             0.1       0
% % % %        6       6             0.1       0
% % % %       11      11             0.1       0
% % % %       12      12             0.1       0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*ELEMENT_MASS_NODE_SET\n');
fprintf(fid,'$#   eid    nsid            mass     pid \n');
for i=1:size(eids,1)
    fprintf(fid,'%8d%8d%16f%8d\n',eids(i),nsids(i),masses(i),pids(i));
end
  
fclose(fid);  
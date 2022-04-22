function []=write_mass_element(eids,nids,masses,pids,filename,permission)

% % % % % *ELEMENT_MASS
% % % % % $#   eid     nid            mass     pid   
% % % % % 9999999999999999             0.6       0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*ELEMENT_MASS\n');
fprintf(fid,'$#   eid     nid            mass     pid \n');
for i=1:size(eids,1)
    fprintf(fid,'%8d%8d%16f%8d\n',eids(i),nids(i),masses(i),pids(i));
end
  
fclose(fid);  
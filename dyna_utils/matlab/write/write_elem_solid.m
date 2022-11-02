function []=write_elem_solid(eid,pid,n1,n2,n3,n4,n5,n6,n7,n8,filename,permission)

% % % % % % % write *ELEMENT_SOLID key to file
% % % *ELEMENT_SOLID
% % % $#   eid     pid      n1      n2      n3      n4      n5      n6      n7      n8
% % %        1       1       1       2      13      12     122     123     134     133

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

N=length(eid);

fprintf(fid,'*ELEMENT_SOLID\n');
fprintf(fid,'$#   eid     pid      n1      n2      n3      n4      n5      n6      n7      n8\n');
for i=1:N
    fprintf(fid,'%8d%8d%8d%8d%8d%8d%8d%8d%8d%8d\n',eid(i),pid(i),n1(i),n2(i),n3(i),n4(i),n5(i),n6(i),n7(i),n8(i));
end

fclose(fid);



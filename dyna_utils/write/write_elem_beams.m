function []=write_elem_beams(eids,pids,n1,n2,n3,rt1,rr1,rt2,rr2,local,filename,permission)

% % % % % % write *ELEMENT_BEAM to file
% % % *ELEMENT_BEAM
% % % $#   eid     pid      n1      n2      n3     rt1     rr1     rt2     rr2   local
% % % 39751000 6071519  397510  329469       0       0       0       0       0       2
% % % 40068400 6071519  400684  329468       0       0       0       0       0       2

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

N=length(eids);

fprintf(fid,'*ELEMENT_BEAM\n');
fprintf(fid,'$#   eid     pid      n1      n2      n3     rt1     rr1     rt2     rr2   local\n');
for i=1:N
    fprintf(fid,'%8d%8d%8d%8d%8d%8d%8d%8d%8d%8d\n',eids(i),pids(i),n1(i),n2(i),n3(i),rt1(i),rr1(i),rt2(i),rr2(i),local(i));
end

fclose(fid);
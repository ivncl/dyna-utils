function []=write_beamset(set_id,beams_ids,filename,permission)

% % % % % % write *SET_NODE_LIST to file
% % % *SET_NODE_LIST
% % % $#     sid       da1       da2       da3       da4    solver      
% % %  701151901       0.0       0.0       0.0       0.0MECH
% % % $#    nid1      nid2      nid3      nid4      nid5      nid6      nid7      nid8
% % %      14472     86052     86057     86070     86071     86080     86081     86094
% % %      86095     86096     86113     86115     86117     86155     86157     86162
% % %      86163     86164     86165     86166     86167     86168     86169     86170
% % %      86171     86248     86250     86252     86319     86320     86322     86323
% % %      86325     86326     86364     86366     86368    170162         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*SET_BEAM\n');
fprintf(fid,'$#     sid\n');
fprintf(fid,'%10d\n',set_id);
fprintf(fid,'$#      k1        k2        k3        k4        k5        k6        k7        k8\n');

N=length(beams_ids);
Nrows=ceil(N/8);

[pos_matrix,vector]=vector2matrix(beams_ids,8);

for i=1:Nrows
    fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d\n',vector(pos_matrix(i,1)), ...
        vector(pos_matrix(i,2)),vector(pos_matrix(i,3)),vector(pos_matrix(i,4)), ...
        vector(pos_matrix(i,5)),vector(pos_matrix(i,6)),vector(pos_matrix(i,7)), ...
        vector(pos_matrix(i,8)));
end
  
fclose(fid);  
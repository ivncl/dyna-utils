function []=write_database_history_set(entities_ids,type,filename,permission)

% % % % *DATABASE_HISTORY_BEAM_SET
% % % % $#     id1       id2       id3       id4       id5       id6       id7       id8
% % % %          0         0         0         0         0         0         0         0
% % % %          0         0         0         0         0         0         0         0
% % % % *DATABASE_HISTORY_NODE_SET
% % % % $#     id1       id2       id3       id4       id5       id6       id7       id8
% % % %          0         0         0         0         0         0         0         0
% % % %          0         0         0         0         0         0         0         0

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

if string(type)=="BEAM"
    fprintf(fid,'*DATABASE_HISTORY_BEAM_SET\n');
else
    if string(type)=="NODE"
        fprintf(fid,'*DATABASE_HISTORY_NODE_SET\n');
    end
end
fprintf(fid,'$#     id1       id2       id3       id4       id5       id6       id7       id8\n');

[pos_matrix,vector]=vector2matrix(entities_ids,8);

for i=1:size(pos_matrix,1)
    fprintf(fid,'%10d%10d%10d%10d%10d%10d%10d%10d\n',vector(pos_matrix(i,1)), ...
        vector(pos_matrix(i,2)),vector(pos_matrix(i,3)),vector(pos_matrix(i,4)), ...
        vector(pos_matrix(i,5)),vector(pos_matrix(i,6)),vector(pos_matrix(i,7)), ...
        vector(pos_matrix(i,8)));
end
  
fclose(fid);
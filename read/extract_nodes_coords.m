function [nodes,coords]=extract_nodes_coords(filename)

% % % extract nodes and coordinates from .k file

% scan file
fid=fopen(filename,'r');
scan=textscan(fid,'%s','Delimiter','\n','Whitespace','');
scan=scan{1,1};
fclose(fid);
N_rows=size(scan,1);

datas=[];
node_key=0;
for i=1:N_rows
    row=scan{i,1};
    if node_key==0
        if contains(row,'*NODE')
            node_key=1;
        end
    else
        if contains(row,'*') && contains(row,'*NODE')==0
            node_key=0;
        else
            if contains(row,'*')==0 && row(1)~='$' && node_key==1
                nums=str2num(row);
                datas=[datas
                    nums(1:4)];
            end
        end
    end
end

coords=datas(:,2:4);

[C,IA] = unique(coords,'rows');

fprintf('%d unique nodes found. %d coincident nodes ignored.\n',length(C),size(coords,1)-length(C));   

nodes=datas(IA,1);
coords=datas(IA,2:4);

AA=[nodes coords];
BB=sortrows(AA);
nodes=BB(:,1);
coords=BB(:,2:4);

 

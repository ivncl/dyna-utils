function [eids,pids,connectivity]=extract_solidelements_data(filename)

% % % extract nodes and coordinates from .k file 
% % % for shell_beta and regular shell elems

% scan file
fid=fopen(filename,'r');
scan=textscan(fid,'%s','Delimiter','\n','Whitespace','');
scan=scan{1,1};
fclose(fid);
N_rows=size(scan,1);

datas=[];
element_key=0;
for i=1:N_rows-1
    row=scan{i,1};
    if element_key==0
        if contains(row,'*ELEMENT_SOLID')
            element_key=1;
        end
    else
        if contains(row,'*')
            element_key=0;
        else
            if contains(row,'*')==0 && row(1)~='$' && element_key==1
                if length(row)<32
                    data_ids=[str2num(row(1:8)) str2num(row(9:16))];
                else
                    datas=[datas
                        data_ids ...
                        str2num(row)];
                end
            end
        end
    end
end

connectivity=datas(:,3:10);
[C,IA] = unique(connectivity,'rows');

fprintf('%d unique elements found. %d coincident elements ignored.\n',length(C),size(connectivity,1)-length(C));   

eids=datas(IA,1);
pids=datas(IA,2);
connectivity=datas(IA,3:10);

AA=[eids pids connectivity];
BB=sortrows(AA);
eids=BB(:,1);
pids=BB(:,2);
connectivity=BB(:,3:10);


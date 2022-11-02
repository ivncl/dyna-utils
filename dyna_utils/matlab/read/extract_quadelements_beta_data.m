function [eids,pids,nodes,angles]=extract_quadelements_beta_data(filename)

% % % extract nodes and coordinates from .k file 
% % % for shell_beta and regular shell elems

% scan file
fid=fopen(filename,'r');
scan=textscan(fid,'%s','Delimiter','\n','Whitespace','');
scan=scan{1,1};
fclose(fid);
N_rows=size(scan,1);

% shell_beta
datas=[];
element_key=0;
for i=1:N_rows-1
    row=scan{i,1};
    row2=scan{i+1,1};
    if contains(row2,'$')
        row2=scan{i+2,1};
    end
    if element_key==0
        if contains(row,'*ELEMENT_SHELL_BETA')
            element_key=1;
        end
    else
        if contains(row,'*') && contains(row,'*ELEMENT_SHELL_BETA')==0
            element_key=0;
        else
            if contains(row,'*')==0 && row(1)~='$' && element_key==1
                if length(str2num(row2(65:end)))==1
                    datas=[datas
                        str2num(row(1:8)) str2num(row(9:16)) str2num(row(17:24)) ...
                        str2num(row(25:32)) str2num(row(33:40)) str2num(row(41:48)) ...
                        str2num(row2(65:end))];
                end
            end
        end
    end
end

eids_beta=datas(:,1);
pids_beta=datas(:,2);
nodes_beta=datas(:,3:6);
angles_beta=datas(:,7);

% regular shell
datas=[];
element_key=0;
for i=1:N_rows
    row=scan{i,1};
    if element_key==0
        if contains(row,'*ELEMENT_SHELL') && contains(row,'*ELEMENT_SHELL_')==0
            element_key=1;
        end
    else
        if (contains(row,'*') && contains(row,'*ELEMENT_SHELL')==0) || contains(row,'*ELEMENT_SHELL_')
            element_key=0;
        else
            if contains(row,'*')==0 && row(1)~='$' && element_key==1
                datas=[datas
                    str2num(row(1:8)) str2num(row(9:16)) str2num(row(17:24)) ...
                    str2num(row(25:32)) str2num(row(33:40)) str2num(row(41:48))];
            end
        end
    end
end

eids_reg=datas(:,1);
pids_reg=datas(:,2);
nodes_reg=datas(:,3:6);
angles_reg=zeros(size(eids_reg));

eids=[eids_beta
    eids_reg];
pids=[pids_beta
    pids_reg];
nodes=[nodes_beta
    nodes_reg];
angles=[angles_beta
    angles_reg];
    




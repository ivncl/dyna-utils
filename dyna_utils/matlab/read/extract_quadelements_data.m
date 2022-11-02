function [eids,pids,nodes]=extract_quadelements_data(filename)

% % % extract nodes and coordinates from .k file

% scan file
fid=fopen(filename,'r');
scan=textscan(fid,'%s','Delimiter','\n','Whitespace','');
scan=scan{1,1};
fclose(fid);
N_rows=size(scan,1);

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
                    str2num(row(1:10)) str2num(row(11:20)) str2num(row(21:30)) ...
                    str2num(row(31:40)) str2num(row(41:50)) str2num(row(51:60))];
            end
        end
    end
end

eids=datas(:,1);
pids=datas(:,2);
nodes=datas(:,3:6);



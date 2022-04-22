function []=write_control_term(endtim,endcyc,dtmin,endeng,endmas,filename,permission)

% % % *CONTROL_TERMINATION
% % % $#  endtim    endcyc     dtmin    endeng    endmas      
% % %        0.3         0       0.0       0.01.000000E8


if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*CONTROL_TERMINATION\n');
fprintf(fid,'$#  endtim    endcyc     dtmin    endeng    endmas\n');
fprintf(fid,'%10f%10d%10f%10f%8E\n',endtim,endcyc,dtmin,endeng,endmas);

fclose(fid);
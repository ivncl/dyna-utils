function []=write_mat_johnson_cook(row1,row2,row3,row4,tabulated,filename,permission)

% % % *MAT_JOHNSON_COOK
% % % $#     mid        ro         g         e        pr       dtf        vp    rateop
% % %          1       0.0       0.0       0.0       0.0       0.0       0.0       0.0
% % % $#       a         b         n         c         m        tm        tr      epso
% % %        0.0       0.0       0.0       0.0       0.0       0.0       0.0       0.0
% % % $#      cp        pc     spall        it        d1        d2        d3        d4
% % %        0.0       0.0       2.0       0.0       0.0       0.0       0.0       0.0
% % % $#      d5      c2/p      erod     efmin     
% % %        0.0       0.0         01.00000E-6
% % % *MAT_JOHNSON_COOK_STOCHASTIC
% % % $#     mid        ro         g         e        pr       dtf        vp    rateop
% % %          2       0.0       0.0       0.0       0.0       0.0       0.0       0.0
% % % $#       a         b         n         c         m        tm        tr      epso
% % %        0.0       0.0       0.0       0.0       0.0       0.0       0.0       0.0
% % % $#      cp        pc     spall        it        d1        d2        d3        d4
% % %        0.0       0.0       2.0       0.0       0.0       0.0       0.0       0.0
% % % $#      d5      c2/p      erod     efmin     
% % %        0.0       0.0         01.00000E-6

if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

if tabulated==1
    fprintf(fid,'*MAT_JOHNSON_COOK_STOCHASTIC\n');
else
    fprintf(fid,'*MAT_JOHNSON_COOK\n');
end

fprintf(fid,'%10d%10f%10f%10f%10f%10f%10f%10f\n',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'%10f%10f%10f%10f%10f%10f%10f%10f\n',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6),row2(7),row2(8));
fprintf(fid,'%10f%10f%10f%10f%10f%10f%10f%10f\n',row3(1),row3(2),row3(3),row3(4),row3(5),row3(6),row3(7),row3(8));
fprintf(fid,'%10f%10f%10d%10f\n',row4(1),row4(2),row4(3),row4(4));
  
fclose(fid);  
function []=write_section_shell(row1,row2,title,filename,permission)

% % % *SECTION_SHELL_TITLE
% % % ShearTieB00_Web
% % % $#   secid    elform      shrf       nip     propt   qr/irid     icomp     setyp
% % %          1        16       1.0         2       1.0         0         0         1
% % % $#      t1        t2        t3        t4      nloc     marea      idof    edgset
% % %        3.0       3.0       3.0       3.0       0.0       0.0       0.0         0


if string(permission)=="w"
    fid=fopen(filename,'w');
else
    if string(permission)=="a+"
        fid=fopen(filename,'a+');
    end
end

fprintf(fid,'*SECTION_SHELL_TITLE\n');
fprintf(fid,'%s\n',title);
fprintf(fid,'$#   secid    elform      shrf       nip     propt   qr/irid     icomp     setyp\n');
fprintf(fid,'%10d%10d%10f%10d%10f%10d%10d%10d',row1(1),row1(2),row1(3),row1(4),row1(5),row1(6),row1(7),row1(8));
fprintf(fid,'\n');
fprintf(fid,'$#      t1        t2        t3        t4      nloc     marea      idof    edgset\n');
fprintf(fid,'%10f%10f%10f%10f%10f%10f%10f%10d',row2(1),row2(2),row2(3),row2(4),row2(5),row2(6),row2(7),row2(8));
fprintf(fid,'\n');
  
fclose(fid);  
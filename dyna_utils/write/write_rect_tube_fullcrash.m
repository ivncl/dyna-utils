function []=write_rect_tube_fullcrash( ...
    solidorshell,tube_dims,elem_dim,thickness,mass,vel, ...
    thermal,thermals, ...
    binaries,d3plot,term, ...
    others,mat,filename)

% tube mesh
pid=1;
if solidorshell=="shell"
    write_rect_tube_mesh(tube_dims,elem_dim(1),pid,filename)
else
    if solidorshell=="solid"
        n_elem_thick=ceil(thickness/elem_dim(2));
        n_elem_height=ceil(tube_dims(3)/elem_dim(1));
        write_rect_tube_mesh_solids(tube_dims,n_elem_thick,n_elem_height,thickness,pid,filename)
    end
end

% permissions
permission='a+';

% impactor mesh
pid=2;
dim_x=max([tube_dims(1) tube_dims(2)])*2;
dim_y=dim_x;
Nnodes_x=round(dim_x/elem_dim(1)/2);
Nnodes_y=Nnodes_x;
id_offset_impactor=10000000;
surf=dim_x*dim_y;
thick=5;
rho=mass/(surf*thick);
z_height=tube_dims(3)+thick;
write_rect_mesh(pid,dim_x,dim_y,Nnodes_x,Nnodes_y,z_height,id_offset_impactor,filename,permission);

% base mesh
pid=3;
dim_x=max([tube_dims(1) tube_dims(2)])*2;
dim_y=dim_x;
Nnodes_x=round(dim_x/elem_dim(1)/2);
Nnodes_y=Nnodes_x;
id_offset_base=20000000;
surf=dim_x*dim_y;
thick=5;
rho=mass/(surf*thick);
z_height=-thick;
write_rect_mesh(pid,dim_x,dim_y,Nnodes_x,Nnodes_y,z_height,id_offset_base,filename,permission);

% parts
eosid=0;
hgid=0;
grav=0;
adpopt=0;
tmid=0;
write_part('tube',1,1,1,eosid,hgid,grav,adpopt,tmid,permission,filename)
write_part('impactor',2,2,2,eosid,hgid,grav,adpopt,tmid,permission,filename)
write_part('base',3,2,2,eosid,hgid,grav,adpopt,tmid,permission,filename)

% impactor mat-sec
row1=[2 rho  210000.0       0.3       0.0       0.0       0.0];
row2=[0.0         0         0];
row3=[0.0       0.0       0.0       0.0       0.0       0.0];
title='impactor';
write_mat_rigid(row1,row2,row3,title,filename,permission)
row1=[2        16       1.0         2       1.0         0         0         1];
row2=[thick thick thick thick       0.0       0.0       0.0         0];
write_section_shell(row1,row2,title,filename,permission)

% materials
if size(mat)>0
    permission='a+';
    fid=fopen(filename,permission);
    for i=1:size(mat,1)
        fid_read=fopen(mat(i),'r');
        aaa=textscan(fid_read,'%s','Delimiter','\n','Whitespace','');
        aaa=string(aaa{1,1});
        for j=1:size(aaa,1)
            fprintf(fid,'%s\n',aaa(j));
        end
    end
    fclose(fid);
end

if thermal==1
end

% contact
sid=3;
da1=0;
da2=0;
da3=0;
da4=0;
solver="MECH";
pids=[1:3]';
write_partset(sid,da1,da2,da3,da4,solver,pids,filename,permission)
row1=[3   0         2         0         0         0         0         0];
row2=[0.3       0.0       0.0       0.0       0.0         0       0.0 1.00000E20];
row3=[1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0];
write_contact_auto_singlesurf(row1,row2,row3,filename,permission)

% velocity gen
sid=2;
da1=0;
da2=0;
da3=0;
da4=0;
solver="MECH";
pids=2;
write_partset(sid,da1,da2,da3,da4,solver,pids,filename,permission)
row1=[2         1       0.0       0.0       0.0   -vel         0         0];
row2=[0.0       0.0       0.0       0.0       0.0       0.0         0         0];
write_initial_velocity(row1,row2,filename,permission)

% boundary spc
sid=1;
id=1;
da1=0;
da2=0;
da3=0;
da4=0;
solver="MECH";
% nids=[1:((round(tube_dims(1)/elem_dim(1)))+(round(tube_dims(2)/elem_dim(1))))*2*(.10*tube_dims(3)/elem_dim(1))]';
nids=id_offset_base+[1:Nnodes_x*Nnodes_y]';
write_nodeset(sid,da1,da2,da3,da4,solver,nids,filename,permission)
heading='appoggio';
nsid=1;
cid=0;
dofx=1;
dofy=1;
dofz=1;
dofrx=0;
dofry=0;
dofrz=0;
write_boundary_spc_set_id(id,heading,nsid,cid,dofx,dofy, ...
    dofz,dofrx,dofry,dofrz,filename,permission)

% termination
endtim=term(1);
endcyc=term(2);
dtmin=term(3);
endeng=term(4);
endmas=term(5);
write_control_term(endtim,endcyc,dtmin,endeng,endmas,filename,permission)

% database
dt=binaries;
binary=3;
lcur=0;
ioopt=1;
write_database_generic(dt,binary,lcur,ioopt,"GLSTAT",filename,permission)
write_database_generic(dt,binary,lcur,ioopt,"MATSUM",filename,permission)
write_database_generic(dt,binary,lcur,ioopt,"SECFORC",filename,permission)
write_database_generic(dt,binary,lcur,ioopt,"SPCFORC",filename,permission)
row1=[d3plot         0         0         0         0];
row2=[0       0.0       0.0       0.0         0         0];
write_database_binaryd3plot(row1,row2,filename,permission)
row1=[0         0         3         1         1         1         1         1];
row2=[0         0         0         1         1         1         2         1];
row3=[0         0       1.0         0         0         0         0         0];
row4=[0         0         0];
write_database_extent_binary(row1,row2,row3,row4,filename,permission)
sid=1;
da1=0;
da2=0;
da3=0;
da4=0;
solver="MECH";
pids=1;
write_partset(sid,da1,da2,da3,da4,solver,pids,filename,permission)
id=1;
title="tube_cross_section";
row2=[1       0.0       0.0       tube_dims(3)/2      ...
    0.0       0.0       tube_dims(3)*2/3        max([tube_dims(1) tube_dims(2)])*2];
row3=[0.0      0.0        0.0       0.0       0.0         0         0];
write_database_cross_section_plane_id(id,title,row2,row3,permission,filename)

% others
if size(others)>0
    permission='a+';
    fid=fopen(filename,permission);
    for i=1:size(others,1)
        fid_read=fopen(others(i),'r');
        aaa=textscan(fid_read,'%s','Delimiter','\n','Whitespace','');
        aaa=string(aaa{1,1});
        for j=1:size(aaa,1)
            fprintf(fid,'%s\n',aaa(j));
        end
    end
    fclose(fid);
end


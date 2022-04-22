function [nodal_coords,elem_quad_nodes,total_thickness,zmax,zmin]= ...
    generate_tensile(geometry_info,partcomp_info,partcomp_data, ...
    matfiles,others,grip_length,termination,d3plot,binaries,filename,permission)

% write specimen
[nodal_coords,elem_quad_nodes,total_thickness,zmax,zmin]= ...
    generate_specimen(geometry_info,partcomp_info,partcomp_data,filename,permission);

% write mat
permission='a+';
fid=fopen(filename,permission);
for i=1:size(matfiles,1)
    fid_read=fopen(matfiles(i),'r');
    aaa=textscan(fid_read,'%s','Delimiter','\n','Whitespace','');
    aaa=string(aaa{1,1});
    for j=1:size(aaa,1)
        fprintf(fid,'%s\n',aaa(j));
    end
end

% write grips
[indexes,~]=find(nodal_coords(:,2)<grip_length(1)); % spc grip
spc_nodes=nodal_coords(indexes,1);
[indexes,~]=find(nodal_coords(:,2)>grip_length(2)); % motion grip (>)
motion_nodes=nodal_coords(indexes,1);
permission='a+';
da1=0;
da2=0;
da3=0;
da4=0;
solver='MECH';
id=1;
write_nodeset(id,da1,da2,da3,da4,solver,spc_nodes,filename,permission)
id=2;
write_nodeset(id,da1,da2,da3,da4,solver,motion_nodes,filename,permission)

% write boundary
nsid=1;
cid=0;
dofx=1;
dofy=1;
dofz=1;
dofrx=1;
dofry=1;
dofrz=1;
id=1;
heading="spc";
write_boundary_spc_set_id(id,heading,nsid,cid,dofx,dofy, ...
    dofz,dofrx,dofry,dofrz,filename,permission)
nsid=2;
dof=1;
vad=2;
lcid=1;
sf=1;
death=1.00000E28;
vid=0;
birth=0;
id=2;
heading="motion";
write_boundary_prescribed_motion_set_id(id,heading,nsid,dof,vad,lcid, ...
    sf,vid,death,birth,filename,permission)
row1=[1         0       1.0       1.0       0.0       0.0         0         0];
datas=[0 0
    .4 5
    1 5];
write_define_curve(row1,datas,filename,permission)

% write database
dt=binaries;
binary=3;
lcur=0;
ioopt=1;
write_database_generic(dt,binary,lcur,ioopt,"GLSTAT",filename,permission)
write_database_generic(dt,binary,lcur,ioopt,"MATSUM",filename,permission)
write_database_generic(dt,binary,lcur,ioopt,"SECFORC",filename,permission)
row1=[d3plot         0         0         0         0];
row2=[0       0.0       0.0       0.0         0         0];
write_database_binaryd3plot(row1,row2,filename,permission)
row1=[0         0         3         1         1         1         1         1];
row2=[0         0         0         1         1         1         2         1];
row3=[0         0       1.0         0         0         0         0         0];
row4=[0         0         0];
write_database_extent_binary(row1,row2,row3,row4,filename,permission)
entities_ids=2;
type="NODE";
write_database_history_set(entities_ids,type,filename,permission)
id=1;
title="cross_section";
row2=[1       geometry_info(1)/2       geometry_info(2)/2       0.0      ...
    geometry_info(1)*3/4       geometry_info(2)/2       0.0       0.0];
row3=[0.0      0.0        0.0       0.0       0.0         0         0];
write_database_cross_section_plane_id(id,title,row2,row3,permission,filename)
sid=1;
pids=1;
write_partset(sid,da1,da2,da3,da4,solver,pids,filename,permission)
nsid=1;
cid=0;
write_database_nodal_force_group(nsid,cid,filename,permission)

% write termination
endtim=termination(1);
endcyc=termination(2);
dtmin=termination(3);
endeng=termination(4);
endmas=termination(5);
write_control_term(endtim,endcyc,dtmin,endeng,endmas,filename,permission)

% write others
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

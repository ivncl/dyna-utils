function [nodal_coords,elem_quad_nodes,total_thickness,zmax, zmin]= ... 
    generate_specimen(geometry_info,partcomp_info,partcomp_data,filename,permission)

dim_x=geometry_info(1);
dim_y=geometry_info(2);
Nnodes_x=geometry_info(3);
Nnodes_y=geometry_info(4);

pid=str2double(partcomp_info(1));
elform=str2double(partcomp_info(2));
shrf=str2double(partcomp_info(3));
nloc=str2double(partcomp_info(4));
marea=str2double(partcomp_info(5));
hgid=str2double(partcomp_info(6));
adpopt=str2double(partcomp_info(7));
ithelfrm=str2double(partcomp_info(8));
title=partcomp_info(1,9);

write_partcomp(pid,elform,shrf,nloc,marea,hgid,adpopt,ithelfrm,partcomp_data,title,filename,permission)
permission='a+';
[nodal_coords,elem_quad_nodes]=generate_dyna_mesh(dim_x,dim_y,Nnodes_x,Nnodes_y,filename,permission);

total_thickness=sum(partcomp_data(:,2));
zmin=-.5*nloc*total_thickness-total_thickness/2;
zmax=-.5*nloc*total_thickness+total_thickness/2;
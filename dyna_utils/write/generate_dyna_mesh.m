function [nodal_coords,elem_quad_nodes]=generate_dyna_mesh(dim_x,dim_y,Nnodes_x,Nnodes_y,id_offset,filename,permission)

% compute 2d-grid
xx=linspace(0,dim_x,Nnodes_x);
yy=linspace(0,dim_y,Nnodes_y);
[nodal_coords,elem_quad_nodes]=Rectangles_Mesh(xx,yy);

% info
Nnodes=size(nodal_coords,1);
N_ids=[1:Nnodes]';
Nelem=size(elem_quad_nodes,1);
EL_ids=[1:Nelem]';

% write 3d-grid
nodal_coords=[N_ids nodal_coords zeros(Nnodes,1)];
elem_quad_nodes=[EL_ids elem_quad_nodes];

% write .k file - nodes
nids=N_ids;
coords=nodal_coords(:,2:4);
coords=[coords(:,1)-dim_x/2 coords(:,2)-dim_y/2 coords(:,3)];
tc=zeros(Nnodes,1);
rc=zeros(Nnodes,1);
write_nodes(nids+id_offset,coords,tc,rc,filename,permission)

% write .k file - elements
eid=EL_ids+id_offset;
pid=ones(Nnodes,1);
n1=elem_quad_nodes(:,2)+id_offset;
n2=elem_quad_nodes(:,3)+id_offset;
n3=elem_quad_nodes(:,4)+id_offset;
n4=elem_quad_nodes(:,5)+id_offset;
n5=zeros(Nnodes,1);
n6=zeros(Nnodes,1);
n7=zeros(Nnodes,1);
n8=zeros(Nnodes,1);
permission='a+';
write_elem_shell(eid,pid,n1,n2,n3,n4,n5,n6,n7,n8,filename,permission)
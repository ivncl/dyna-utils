function []=write_rect_tube_mesh_solids_diag(tube_dims,elem_dim_surf,n_elem_thick,thickness,pid,filename)

x_length=tube_dims(1);
y_length=tube_dims(2);
z_length=tube_dims(3);

elem_dim_thick=thickness/n_elem_thick;
x_lengths=x_length/2;
y_lengths=y_length/2;
for i=1:n_elem_thick
    x_lengths=[x_lengths
        x_lengths(end)-elem_dim_thick];
    y_lengths=[y_lengths
        y_lengths(end)-elem_dim_thick];
end
scale_factors_x=x_lengths./x_lengths(1);
scale_factors_y=y_lengths./y_lengths(1);

[nodes_out,elems_out]=make_rect_tube(tube_dims,elem_dim_surf);
nodes_out=[nodes_out(:,1)-x_length/2 nodes_out(:,2)-y_length/2 nodes_out(:,3)];

offset=500000;
nodes=[];
for i=0:n_elem_thick
    nodes=[nodes
        [1:size(nodes_out,1)]'+i*offset nodes_out(:,1)*scale_factors_x(i+1) ...
        nodes_out(:,2)*scale_factors_y(i+1) nodes_out(:,3)];
end

offset=500000;
elems=[];
for i=1:n_elem_thick
    elems=[elems
        [1:size(elems_out,1)]'+(i-1)*offset elems_out+offset*(i-1) elems_out+offset*(i)];
end

permission='w';
nids=nodes(:,1);
tc=zeros(size(nodes,1),1);
rc=zeros(size(nodes,1),1);
write_nodes(nids,nodes(:,2:4),tc,rc,filename,permission)

permission='a+';
pid_=pid*ones(size(elems,1),1);
eid=elems(:,2);
n1=elems(:,2);
n2=elems(:,3);
n3=elems(:,7);
n4=elems(:,6);
n5=elems(:,5);
n6=elems(:,4);
n7=elems(:,8);
n8=elems(:,9);
write_elem_solid(eid,pid_,n1,n2,n3,n4,n5,n6,n7,n8,filename,permission)

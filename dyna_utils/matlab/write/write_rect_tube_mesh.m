function []=write_rect_tube_mesh(tube_dims,elem_dim,pid,filename)

x_length=tube_dims(1);
y_length=tube_dims(2);
z_length=tube_dims(3);

[nodes,elems]=make_rect_tube(tube_dims,elem_dim);
nodes=[nodes(:,1)-x_length/2 nodes(:,2)-y_length/2 nodes(:,3)];

permission='w';
nids=[1:size(nodes,1)]';
tc=zeros(size(nodes,1),1);
rc=zeros(size(nodes,1),1);
write_nodes(nids,nodes,tc,rc,filename,permission)

permission='a+';
pid=pid*ones(size(elems,1),1);
eid=[1:size(elems,1)]';
n1=elems(:,1);
n2=elems(:,2);
n3=elems(:,3);
n4=elems(:,4);
n5=zeros(size(elems,1),1);
n6=zeros(size(elems,1),1);
n7=zeros(size(elems,1),1);
n8=zeros(size(elems,1),1);
write_elem_shell(eid,pid,n1,n2,n3,n4,n5,n6,n7,n8,filename,permission)

function []=write_rect_tube_mesh_solids(tube_dims,n_elem_thick,n_elem_height,thickness,pid,filename)

x_length=tube_dims(1);
y_length=tube_dims(2);
z_length=tube_dims(3);

elem_dim=thickness/n_elem_thick;

N_elem_x=round(x_length/elem_dim);
xx=linspace(-x_length/2,x_length/2,N_elem_x+1);
N_elem_y=round(y_length/elem_dim);
yy=linspace(-y_length/2,y_length/2,N_elem_y+1);
[nodes_base,elems_base]=Rectangles_Mesh(xx,yy);

x_threshold=x_length/2-thickness;
y_threshold=y_length/2-thickness;

nodes_to_delete=[];
for i=1:length(nodes_base(:,1))
    if abs(nodes_base(i,1))<x_threshold && abs(nodes_base(i,2))<y_threshold 
        nodes_to_delete=[nodes_to_delete
            i];
    end
end
nodes_base_final=nodes_base;
nodes_base_final(nodes_to_delete,:)=[];
nodes_ids=[1:size(nodes_base,1)]';
nodes_ids(nodes_to_delete,:)=[];
nodes_base_final=[nodes_ids nodes_base_final zeros(size(nodes_base_final,1),1)];
elems_to_delete=[];
for i=1:length(nodes_to_delete(:,1))
    for j=1:size(elems_base,1)
        if ismember(nodes_to_delete(i),elems_base(j,:))
            elems_to_delete=[elems_to_delete
                j];
        end
    end
end
elems_base_final=elems_base;
elems_base_final(elems_to_delete,:)=[];
elem_ids=[1:size(elems_base,1)]';
elem_ids(elems_to_delete,:)=[];
elems_base_final=[elem_ids elems_base_final];

offset=10000;
N_elems_z=n_elem_height;
elem_dim_rounded=z_length/N_elems_z;
nodes=[];
for i=0:N_elems_z
    nodes=[nodes
        nodes_base_final(:,1)+offset*(i) nodes_base_final(:,2:3) nodes_base_final(:,4)+elem_dim_rounded*i];
end

elems=[];
for i=1:N_elems_z
    elems=[elems
        elem_ids+offset*(i-1) ...
        elems_base_final(:,[2,3])+offset*(i-1) ...
        elems_base_final(:,[4,5])+offset*(i-1) ...
        elems_base_final(:,[2,3])+offset*(i) ...
        elems_base_final(:,[4,5])+offset*(i)];
end

permission='w';
nids=nodes(:,1);
tc=zeros(size(nodes,1),1);
rc=zeros(size(nodes,1),1);
write_nodes(nids,nodes(:,2:4),tc,rc,filename,permission)

permission='a+';
pid_=pid*ones(size(elems,1),1);
eid=elems(:,1);
n1=elems(:,2);
n2=elems(:,3);
n3=elems(:,4);
n4=elems(:,5);
n5=elems(:,6);
n6=elems(:,7);
n7=elems(:,8);
n8=elems(:,9);
write_elem_solid(eid,pid_,n1,n2,n3,n4,n5,n6,n7,n8,filename,permission)

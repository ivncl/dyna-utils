% function [nids_tube]=write_cylindrical_tube_mesh_layerwise(pid,tube_dims,n_elem,id_offset,filename,permission)

% compute 2d-grid
R=tube_dims(1);
t=tube_dims(2);
h=tube_dims(3);
n_elem_R=n_elem(1);
n_elem_t=n_elem(2);
n_elem_h=n_elem(3);
elem_dim_R=t/n_elem_R;
n_elem_R_full_circle=round(R/elem_dim_R);
elem_dim_R_corr=R/n_elem_R_full_circle;
elem_dim_t=2*pi*R/n_elem_t;
elem_dim_h=h/n_elem_h;
[nodes_base,~,elems_base]=Circle_Mesh(R,n_elem_R_full_circle,n_elem_t);

R_threshold=R-n_elem_R*elem_dim_R_corr*1.1;

nodes_to_delete=[];
for i=1:length(nodes_base(:,1))
    if sqrt(nodes_base(i,1)^2+nodes_base(i,2)^2)<R_threshold
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
offset2=5000000;
nodes=[];
for i=0:n_elem_h-1
    nodes=[nodes
        nodes_base_final(:,1)+offset*(i) nodes_base_final(:,2:3) nodes_base_final(:,4)+elem_dim_h*i
        offset2+(nodes_base_final(:,1))+offset*(i) nodes_base_final(:,2:3) nodes_base_final(:,4)+elem_dim_h*(i+1)-.05*elem_dim_h];
end

elems=[];
for i=1:n_elem_h
    elems=[elems
        elem_ids+offset*(i-1) ...
        elems_base_final(:,[2,3])+offset*(i-1) ...
        elems_base_final(:,[4,5])+offset*(i-1) ...
        elems_base_final(:,[2,3])+offset2+offset*(i-1) ...
        elems_base_final(:,[4,5])+offset2+offset*(i-1)];
end

permission='w';
nids=nodes(:,1);
tc=zeros(size(nodes,1),1);
rc=zeros(size(nodes,1),1);
write_nodes(nids+id_offset,nodes(:,2:4),tc,rc,filename,permission)
nids_tube=nids+id_offset;

permission='a+';
pid_=[];
for i=1:n_elem_h
    pid_=[pid_
        i*ones(size(elems_base_final,1),1)];
end
eid=elems(:,1)+id_offset;
n1=elems(:,2)+id_offset;
n2=elems(:,3)+id_offset;
n3=elems(:,4)+id_offset;
n4=elems(:,5)+id_offset;
n5=elems(:,6)+id_offset;
n6=elems(:,7)+id_offset;
n7=elems(:,8)+id_offset;
n8=elems(:,9)+id_offset;
write_elem_solid(eid,pid_,n1,n2,n3,n4,n5,n6,n7,n8,filename,permission)

permission='a+';
for i=1:n_elem_h-1
    cid=i;
    row1=[i         i+1         3         3         0         0         0         0];
    row2=[0.0       0.0       0.0       0.0       0.0         0       0.0   1.00000E20];
    row3=[1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0];
    row4=[2     500.0     300.0       0.0       0.0       0.0       0.0       0.0];
    write_contact_auto_1way_tiebreak(cid,row1,row2,row3,row4,filename,permission)
end

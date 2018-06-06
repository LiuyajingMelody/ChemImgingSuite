function [num_clusters KMNS_color_index] = kmns(temp,PathName,FileName,FileWavelength)
size_temp = size(temp);
temp= reshape(permute(temp,[1 2 3]),[size_temp(1)*size_temp(2) size_temp(3)]);
s1=sprintf('Number of clusters: ');
s2=sprintf('Distance measure, in p-dimensional space: ');
s3=sprintf('Action to take if a cluster loses all its member observations: ');
s4=sprintf('Flag indicating whether kmeans should perform an online update phase:');
s5=sprintf('Number of times to repeat the clustering, each with a new set of initial cluster centroid positions:');
s6=sprintf('Method used to choose the initial cluster centroid positions: \n (Select k observations from X at random (default))');
s7=sprintf('Percentage of data for silouette graph');
prompt = {s1,s2,s3,s4,s5,s6,s7};
dlg_title = 'Input parameters for K-means classifier';
num_lines = 1;
if exist( [PathName 'RESULTS\KMNSopt.mat' ],'file')
    def=load([PathName 'RESULTS\KMNSopt.mat' ]);
    def=def.answer;
else
    def = {'1','sqeuclidean','error','on','1','sample','0.01'};
end
answer = inputdlg(prompt,dlg_title,num_lines,def);
if ~isempty(answer)
    save([PathName '\RESULTS\KMNSopt'],'answer');
    opts = statset('Display','final','UseParallel','never');
    [KMNS_color_index C sumd D]=kmeans(temp,str2num(answer{1}),'distance',answer{2}, 'emptyaction',answer{3},...
            'onlinephase',answer{4},'replicates',str2num(answer{5}),'start',answer{6},'Options',opts);
    KMNS_color_index = reshape(KMNS_color_index,size_temp(1),size_temp(2));
    KMNS_min = zeros(size_temp(1),size_temp(2)); 
    Distance = D;
    %%%%%% centroid comparing for number of clusters determination %%%%%%
    s = size(C(:,1));
    angleSAM = zeros(s(1),s(1));
    for j=1:s
        A = C(j,:);
        for k=1:s
            B = C(k,:);
            angleSAM(j,k) = SAM(A,B); %% replace with AWN(A,B)
        end
    end
    angleSAM = round(angleSAM, 6, 'decimals');
    threshold = 0.03; %% replace with 0.001 for AWN
    % check for similar centroids
    angleSAM2 = triu(angleSAM);
    [row1,col1] = find(angleSAM2 < threshold & angleSAM2 > 0);
    sameCentroids = cat(2,row1,col1);
%     newC = size(C);
    for i=1:size(sameCentroids,1) % for the similar centroids do the following
%         newC(i,:) = (C(sameCentroids(i,1),:)+C(sameCentroids(i,2),:))./2;
%         C(sameCentroids(i,1),:) = (C(sameCentroids(i,1),:)+C(sameCentroids(i,2),:))./2;
        C(sameCentroids(i,2),:) = C(sameCentroids(i,1),:);
        % change cluster number for these pixels in pseudocolor matrix
        [row3,col3] = find(KMNS_color_index == sameCentroids(i,2));
        oldCentrs = cat(2,row3,col3);
        for j = 1:size(oldCentrs,1)
            KMNS_color_index(oldCentrs(j,1),oldCentrs(j,2)) = sameCentroids(i,1);
        end
        % Change following code (lines 63,64,65) by finding duplicates in
        % matrix C and delete them
        % Another solution is the following one, to fill these centroids with
        % zeros
        if ~ismember(sameCentroids(i,2),sameCentroids(:,1))
            C(sameCentroids(i,2),:) = 0;
        end
        [row2,col2] = find(sameCentroids == sameCentroids(i,2));
        smCnt = cat(2,row2,col2);
        if ~isempty(smCnt)
            for w=1:size(smCnt,1)
                sameCentroids(smCnt(w,1),smCnt(w,2)) = sameCentroids(i,1);
            end
        end
    end
    % to find the final number of clusters
    row_has_all_zeros = ~any(C, 2);
    indices = find(row_has_all_zeros);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    num_clusters = str2num(answer{1}); %% replace with size(C,1)-size(indices,1)
    
    save([PathName '\RESULTS\' FileName '_KMNS_min_' int2str(FileWavelength) ], 'KMNS_min');
    save([PathName '\RESULTS\' FileName '_KMNS_color_index_' int2str(FileWavelength)], 'KMNS_color_index');
end




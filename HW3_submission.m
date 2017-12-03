root='S:\ML\HW3\att_faces';
all_Images=imageSet('S:\ML\HW3\att_faces\','recursive');
imread(all_Images(1,1).ImageLocation{1});

for i=1:40
    for j=1:10
        img=imread(all_Images(1,i).ImageLocation{j});
        r=reshape(img, 1, []);
        images_vector{i,j}=r; %vectorize all images
        
    end
end

images_array=reshape(images_vector',[400,1]);
images_array=cell2mat(images_array);



%5 fold cross validation
%considering 1,2,11,12,21,22.... as test data
j=1;
k=2;
for i=1:10:400
    test1(j:k,:)=images_array(i:i+1,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train1(j:k,:)=images_array(i+2:i+9,:);
    j=j+8;
    k=k+8;
end

u_train_1=mean(train1); % calculate mean of train data
Z_train_1= double(train1) - repmat(u_train_1,320,1);
u_test_1=mean(test1); % calculate mean of test data
Z_test_1= double(test1) - repmat(u_test_1,80,1);
S1=319*cov(Z_train_1);
[V1,D1]=eig(S1);

hold on;
for i=1:10304
    plot(i,D1(i,i),'*')
end
hold off;


 for i=1:10304
     for j=10304:-1:10225
         E1(i,abs(j-10305))=V1(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end

 train1_red=E1'*Z_train_1';
 test1_red=E1'*Z_test_1';

%creating labels
label1=[];
for i=1:40
    for j=1:2
        label1=[label1;i];
    end
end
label1=label1';

k=1;
for i=1:80
    for j=1:320
        diff1(:,k)=train1_red(1:80,j)-test1_red(1:80,i);
        k=k+1;
    end
end

for i=1:25600
    diff1sq(:,i)=power(diff1(:,i),2);
end

dist1=0;
for i=1:25600
    dist1=0;
    for j=1:80
        dist1=dist1+diff1sq(j,i);
    end
    dist1mat(1,i)=sqrt(dist1); 
end

k=1;
for i=1:320:25600
    minval=min(dist1mat(1,i:i+319));
    label1pred(1,k)=find(dist1mat==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label1pred(1,k)==i+j
            label1pred(1,k)=1;
        end
    end
    for j=8:15
        if label1pred(1,k)==i+j
            label1pred(1,k)=2;
        end
    end
    for j=16:23
        if label1pred(1,k)==i+j
            label1pred(1,k)=3;
        end
    end 
    for j=24:31
        if label1pred(1,k)==i+j
            label1pred(1,k)=4;
        end
    end
    for j=32:39
        if label1pred(1,k)==i+j
            label1pred(1,k)=5;
        end
    end
    for j=40:47
        if label1pred(1,k)==i+j
            label1pred(1,k)=6;
        end
    end
    for j=48:55
        if label1pred(1,k)==i+j
            label1pred(1,k)=7;
        end
    end
    for j=56:63
        if label1pred(1,k)==i+j
            label1pred(1,k)=8;
        end
    end
    for j=64:71
        if label1pred(1,k)==i+j
            label1pred(1,k)=9;
        end
    end
    for j=72:79
        if label1pred(1,k)==i+j
            label1pred(1,k)=10;
        end
    end
    
    for j=80:87
        if label1pred(1,k)==i+j
            label1pred(1,k)=11;
        end
    end
    for j=88:95
        if label1pred(1,k)==i+j
            label1pred(1,k)=12;
        end
    end
    for j=96:103
        if label1pred(1,k)==i+j
            label1pred(1,k)=13;
        end
    end 
    for j=104:111
        if label1pred(1,k)==i+j
            label1pred(1,k)=14;
        end
    end
    for j=112:120
        if label1pred(1,k)==i+j
            label1pred(1,k)=15;
        end
    end
    for j=121:127
        if label1pred(1,k)==i+j
            label1pred(1,k)=16;
        end
    end
    for j=128:135
        if label1pred(1,k)==i+j
            label1pred(1,k)=17;
        end
    end
    for j=136:143
        if label1pred(1,k)==i+j
            label1pred(1,k)=18;
        end
    end
    for j=144:151
        if label1pred(1,k)==i+j
            label1pred(1,k)=19;
        end
    end
    for j=152:159
        if label1pred(1,k)==i+j
            label1pred(1,k)=20;
        end
    end
    
    for j=160:167
        if label1pred(1,k)==i+j
            label1pred(1,k)=21;
        end
    end
    for j=168:175
        if label1pred(1,k)==i+j
            label1pred(1,k)=22;
        end
    end
    for j=176:183
        if label1pred(1,k)==i+j
            label1pred(1,k)=23;
        end
    end 
    for j=184:191
        if label1pred(1,k)==i+j
            label1pred(1,k)=24;
        end
    end
    for j=192:199
        if label1pred(1,k)==i+j
            label1pred(1,k)=25;
        end
    end
    for j=200:207
        if label1pred(1,k)==i+j
            label1pred(1,k)=26;
        end
    end
    for j=208:215
        if label1pred(1,k)==i+j
            label1pred(1,k)=27;
        end
    end
    for j=216:223
        if label1pred(1,k)==i+j
            label1pred(1,k)=28;
        end
    end
    for j=224:231
        if label1pred(1,k)==i+j
            label1pred(1,k)=29;
        end
    end
    for j=232:239
        if label1pred(1,k)==i+j
            label1pred(1,k)=30;
        end
    end
    
    for j=240:247
        if label1pred(1,k)==i+j
            label1pred(1,k)=31;
        end
    end
    for j=248:255
        if label1pred(1,k)==i+j
            label1pred(1,k)=32;
        end
    end
    for j=256:263
        if label1pred(1,k)==i+j
            label1pred(1,k)=33;
        end
    end 
    for j=264:271
        if label1pred(1,k)==i+j
            label1pred(1,k)=34;
        end
    end
    for j=272:279
        if label1pred(1,k)==i+j
            label1pred(1,k)=35;
        end
    end
    for j=280:287
        if label1pred(1,k)==i+j
            label1pred(1,k)=36;
        end
    end
    for j=288:295
        if label1pred(1,k)==i+j
            label1pred(1,k)=37;
        end
    end
    for j=296:303
        if label1pred(1,k)==i+j
            label1pred(1,k)=38;
        end
    end
    for j=304:311
        if label1pred(1,k)==i+j
            label1pred(1,k)=39;
        end
    end
    for j=312:319
        if label1pred(1,k)==i+j
            label1pred(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 1st fold
count=0;
for i=1:80
    if label1(1,i)==label1pred(1,i)
        count=count+1;
    end
end

acc1=count/80*100;

%considering 3,4,13,14,23,24.... as test data
j=1;
k=2;
for i=1:10:400
    test2(j:k,:)=images_array(i+2:i+3,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train2(j:k,:)=images_array([i:i+1 i+4:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_2=mean(train2); % calculate mean of train data
Z_train_2= double(train2) - repmat(u_train_2,320,1);
u_test_2=mean(test2); % calculate mean of test data
Z_test_2= double(test2) - repmat(u_test_2,80,1);
S2=319*cov(Z_train_2);
[V2,D2]=eig(S2);

 for i=1:10304
     for j=10304:-1:10225
         E2(i,abs(j-10305))=V2(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end
 
 train2_red=E2'*Z_train_2';
 test2_red=E2'*Z_test_2';
 
%creating labels
label2=[];
for i=1:40
    for j=1:2
        label2=[label2;i];
    end
end
label2=label2';

k=1;
for i=1:80
    for j=1:320
        diff2(:,k)=train2_red(1:80,j)-test2_red(1:80,i);
        k=k+1;
    end
end

for i=1:25600
    diff2sq(:,i)=power(diff2(:,i),2);
end

dist2=0;
for i=1:25600
    dist2=0;
    for j=1:80
        dist2=dist2+diff2sq(j,i);
    end
    dist2mat(1,i)=sqrt(dist2); 
end

k=1;
for i=1:320:25600
    minval=min(dist2mat(1,i:i+319));
    label2pred(1,k)=find(dist2mat==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label2pred(1,k)==i+j
            label2pred(1,k)=1;
        end
    end
    for j=8:15
        if label2pred(1,k)==i+j
            label2pred(1,k)=2;
        end
    end
    for j=16:23
        if label2pred(1,k)==i+j
            label2pred(1,k)=3;
        end
    end 
    for j=24:31
        if label2pred(1,k)==i+j
            label2pred(1,k)=4;
        end
    end
    for j=32:39
        if label2pred(1,k)==i+j
            label2pred(1,k)=5;
        end
    end
    for j=40:47
        if label2pred(1,k)==i+j
            label2pred(1,k)=6;
        end
    end
    for j=48:55
        if label2pred(1,k)==i+j
            label2pred(1,k)=7;
        end
    end
    for j=56:63
        if label2pred(1,k)==i+j
            label2pred(1,k)=8;
        end
    end
    for j=64:71
        if label2pred(1,k)==i+j
            label2pred(1,k)=9;
        end
    end
    for j=72:79
        if label2pred(1,k)==i+j
            label2pred(1,k)=10;
        end
    end
    
    for j=80:87
        if label2pred(1,k)==i+j
            label2pred(1,k)=11;
        end
    end
    for j=88:95
        if label2pred(1,k)==i+j
            label2pred(1,k)=12;
        end
    end
    for j=96:103
        if label2pred(1,k)==i+j
            label2pred(1,k)=13;
        end
    end 
    for j=104:111
        if label2pred(1,k)==i+j
            label2pred(1,k)=14;
        end
    end
    for j=112:120
        if label2pred(1,k)==i+j
            label2pred(1,k)=15;
        end
    end
    for j=121:127
        if label2pred(1,k)==i+j
            label2pred(1,k)=16;
        end
    end
    for j=128:135
        if label2pred(1,k)==i+j
            label2pred(1,k)=17;
        end
    end
    for j=136:143
        if label2pred(1,k)==i+j
            label2pred(1,k)=18;
        end
    end
    for j=144:151
        if label2pred(1,k)==i+j
            label2pred(1,k)=19;
        end
    end
    for j=152:159
        if label2pred(1,k)==i+j
            label2pred(1,k)=20;
        end
    end
    
    for j=160:167
        if label2pred(1,k)==i+j
            label2pred(1,k)=21;
        end
    end
    for j=168:175
        if label2pred(1,k)==i+j
            label2pred(1,k)=22;
        end
    end
    for j=176:183
        if label2pred(1,k)==i+j
            label2pred(1,k)=23;
        end
    end 
    for j=184:191
        if label2pred(1,k)==i+j
            label2pred(1,k)=24;
        end
    end
    for j=192:199
        if label2pred(1,k)==i+j
            label2pred(1,k)=25;
        end
    end
    for j=200:207
        if label2pred(1,k)==i+j
            label2pred(1,k)=26;
        end
    end
    for j=208:215
        if label2pred(1,k)==i+j
            label2pred(1,k)=27;
        end
    end
    for j=216:223
        if label2pred(1,k)==i+j
            label2pred(1,k)=28;
        end
    end
    for j=224:231
        if label2pred(1,k)==i+j
            label2pred(1,k)=29;
        end
    end
    for j=232:239
        if label2pred(1,k)==i+j
            label2pred(1,k)=30;
        end
    end
    
    for j=240:247
        if label2pred(1,k)==i+j
            label2pred(1,k)=31;
        end
    end
    for j=248:255
        if label2pred(1,k)==i+j
            label2pred(1,k)=32;
        end
    end
    for j=256:263
        if label2pred(1,k)==i+j
            label2pred(1,k)=33;
        end
    end 
    for j=264:271
        if label2pred(1,k)==i+j
            label2pred(1,k)=34;
        end
    end
    for j=272:279
        if label2pred(1,k)==i+j
            label2pred(1,k)=35;
        end
    end
    for j=280:287
        if label2pred(1,k)==i+j
            label2pred(1,k)=36;
        end
    end
    for j=288:295
        if label2pred(1,k)==i+j
            label2pred(1,k)=37;
        end
    end
    for j=296:303
        if label2pred(1,k)==i+j
            label2pred(1,k)=38;
        end
    end
    for j=304:311
        if label2pred(1,k)==i+j
            label2pred(1,k)=39;
        end
    end
    for j=312:319
        if label2pred(1,k)==i+j
            label2pred(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 2nd fold
count=0;
for i=1:80
    if label2(1,i)==label2pred(1,i)
        count=count+1;
    end
end

acc2=count/80*100;

% %considering 5,6,15,16,25,26.... as test data
j=1;
k=2;
for i=1:10:400
    test3(j:k,:)=images_array(i+4:i+5,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train3(j:k,:)=images_array([i:i+3 i+6:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_3=mean(train3); % calculate mean of train data
Z_train_3= double(train3) - repmat(u_train_3,320,1);
u_test_3=mean(test3); % calculate mean of test data
Z_test_3= double(test3) - repmat(u_test_3,80,1);
S3=319*cov(Z_train_3);
[V3,D3]=eig(S3);


 for i=1:10304
     for j=10304:-1:10225
         E3(i,abs(j-10305))=V3(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end
 
train3_red=E3'*Z_train_3';
test3_red=E3'*Z_test_3';


%creating labels
label3=[];
for i=1:40
    for j=1:2
        label3=[label3;i];
    end
end
label3=label3';

k=1;
for i=1:80
    for j=1:320
        diff3(:,k)=train3_red(1:80,j)-test3_red(1:80,i);
        k=k+1;
    end
end

for i=1:25600
    diff3sq(:,i)=power(diff3(:,i),2);
end

dist3=0;
for i=1:25600
    dist3=0;
    for j=1:80
        dist3=dist3+diff3sq(j,i);
    end
    dist3mat(1,i)=sqrt(dist3); 
end

k=1;
for i=1:320:25600
    minval=min(dist3mat(1,i:i+319));
    label3pred(1,k)=find(dist3mat==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label3pred(1,k)==i+j
            label3pred(1,k)=1;
        end
    end
    for j=8:15
        if label3pred(1,k)==i+j
            label3pred(1,k)=2;
        end
    end
    for j=16:23
        if label3pred(1,k)==i+j
            label3pred(1,k)=3;
        end
    end 
    for j=24:31
        if label3pred(1,k)==i+j
            label3pred(1,k)=4;
        end
    end
    for j=32:39
        if label3pred(1,k)==i+j
            label3pred(1,k)=5;
        end
    end
    for j=40:47
        if label3pred(1,k)==i+j
            label3pred(1,k)=6;
        end
    end
    for j=48:55
        if label3pred(1,k)==i+j
            label3pred(1,k)=7;
        end
    end
    for j=56:63
        if label3pred(1,k)==i+j
            label3pred(1,k)=8;
        end
    end
    for j=64:71
        if label3pred(1,k)==i+j
            label3pred(1,k)=9;
        end
    end
    for j=72:79
        if label3pred(1,k)==i+j
            label3pred(1,k)=10;
        end
    end
    
    for j=80:87
        if label3pred(1,k)==i+j
            label3pred(1,k)=11;
        end
    end
    for j=88:95
        if label3pred(1,k)==i+j
            label3pred(1,k)=12;
        end
    end
    for j=96:103
        if label3pred(1,k)==i+j
            label3pred(1,k)=13;
        end
    end 
    for j=104:111
        if label3pred(1,k)==i+j
            label3pred(1,k)=14;
        end
    end
    for j=112:120
        if label3pred(1,k)==i+j
            label3pred(1,k)=15;
        end
    end
    for j=121:127
        if label3pred(1,k)==i+j
            label3pred(1,k)=16;
        end
    end
    for j=128:135
        if label3pred(1,k)==i+j
            label3pred(1,k)=17;
        end
    end
    for j=136:143
        if label3pred(1,k)==i+j
            label3pred(1,k)=18;
        end
    end
    for j=144:151
        if label3pred(1,k)==i+j
            label3pred(1,k)=19;
        end
    end
    for j=152:159
        if label3pred(1,k)==i+j
            label3pred(1,k)=20;
        end
    end
    
    for j=160:167
        if label3pred(1,k)==i+j
            label3pred(1,k)=21;
        end
    end
    for j=168:175
        if label3pred(1,k)==i+j
            label3pred(1,k)=22;
        end
    end
    for j=176:183
        if label3pred(1,k)==i+j
            label3pred(1,k)=23;
        end
    end 
    for j=184:191
        if label3pred(1,k)==i+j
            label3pred(1,k)=24;
        end
    end
    for j=192:199
        if label3pred(1,k)==i+j
            label3pred(1,k)=25;
        end
    end
    for j=200:207
        if label3pred(1,k)==i+j
            label3pred(1,k)=26;
        end
    end
    for j=208:215
        if label3pred(1,k)==i+j
            label3pred(1,k)=27;
        end
    end
    for j=216:223
        if label3pred(1,k)==i+j
            label3pred(1,k)=28;
        end
    end
    for j=224:231
        if label3pred(1,k)==i+j
            label3pred(1,k)=29;
        end
    end
    for j=232:239
        if label3pred(1,k)==i+j
            label3pred(1,k)=30;
        end
    end
    
    for j=240:247
        if label3pred(1,k)==i+j
            label3pred(1,k)=31;
        end
    end
    for j=248:255
        if label3pred(1,k)==i+j
            label3pred(1,k)=32;
        end
    end
    for j=256:263
        if label3pred(1,k)==i+j
            label3pred(1,k)=33;
        end
    end 
    for j=264:271
        if label3pred(1,k)==i+j
            label3pred(1,k)=34;
        end
    end
    for j=272:279
        if label3pred(1,k)==i+j
            label3pred(1,k)=35;
        end
    end
    for j=280:287
        if label3pred(1,k)==i+j
            label3pred(1,k)=36;
        end
    end
    for j=288:295
        if label3pred(1,k)==i+j
            label3pred(1,k)=37;
        end
    end
    for j=296:303
        if label3pred(1,k)==i+j
            label3pred(1,k)=38;
        end
    end
    for j=304:311
        if label3pred(1,k)==i+j
            label3pred(1,k)=39;
        end
    end
    for j=312:319
        if label3pred(1,k)==i+j
            label3pred(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 3rd fold
count=0;
for i=1:80
    if label3(1,i)==label3pred(1,i)
        count=count+1;
    end
end

acc3=count/80*100;

%considering 7,8,17,18,27,28.... as test data
j=1;
k=2;
for i=1:10:400
    test4(j:k,:)=images_array(i+6:i+7,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train4(j:k,:)=images_array([i:i+5 i+8:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_4=mean(train4); % calculate mean of train data
Z_train_4= double(train4) - repmat(u_train_4,320,1);
u_test_4=mean(test4); % calculate mean of test data
Z_test_4= double(test4) - repmat(u_test_4,80,1);
S4=319*cov(Z_train_4);
[V4,D4]=eig(S4);

for i=1:10304
    for j=10304:-1:10225
         E4(i,abs(j-10305))=V4(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
    end
end

train4_red=E4'*Z_train_4';
test4_red=E4'*Z_test_4';


%creating labels
label4=[];
for i=1:40
    for j=1:2
        label4=[label4;i];
    end
end
label4=label4';

k=1;
for i=1:80
    for j=1:320
        diff4(:,k)=train4_red(1:80,j)-test4_red(1:80,i);
        k=k+1;
    end
end

for i=1:25600
    diff4sq(:,i)=power(diff4(:,i),2);
end

dist4=0;
for i=1:25600
    dist4=0;
    for j=1:80
        dist4=dist4+diff4sq(j,i);
    end
    dist4mat(1,i)=sqrt(dist4); 
end

k=1;
for i=1:320:25600
    minval=min(dist4mat(1,i:i+319));
    label4pred(1,k)=find(dist4mat==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label4pred(1,k)==i+j
            label4pred(1,k)=1;
        end
    end
    for j=8:15
        if label4pred(1,k)==i+j
            label4pred(1,k)=2;
        end
    end
    for j=16:23
        if label4pred(1,k)==i+j
            label4pred(1,k)=3;
        end
    end 
    for j=24:31
        if label4pred(1,k)==i+j
            label4pred(1,k)=4;
        end
    end
    for j=32:39
        if label4pred(1,k)==i+j
            label4pred(1,k)=5;
        end
    end
    for j=40:47
        if label4pred(1,k)==i+j
            label4pred(1,k)=6;
        end
    end
    for j=48:55
        if label4pred(1,k)==i+j
            label4pred(1,k)=7;
        end
    end
    for j=56:63
        if label4pred(1,k)==i+j
            label4pred(1,k)=8;
        end
    end
    for j=64:71
        if label4pred(1,k)==i+j
            label4pred(1,k)=9;
        end
    end
    for j=72:79
        if label4pred(1,k)==i+j
            label4pred(1,k)=10;
        end
    end
    
    for j=80:87
        if label4pred(1,k)==i+j
            label4pred(1,k)=11;
        end
    end
    for j=88:95
        if label4pred(1,k)==i+j
            label4pred(1,k)=12;
        end
    end
    for j=96:103
        if label4pred(1,k)==i+j
            label4pred(1,k)=13;
        end
    end 
    for j=104:111
        if label4pred(1,k)==i+j
            label4pred(1,k)=14;
        end
    end
    for j=112:120
        if label4pred(1,k)==i+j
            label4pred(1,k)=15;
        end
    end
    for j=121:127
        if label4pred(1,k)==i+j
            label4pred(1,k)=16;
        end
    end
    for j=128:135
        if label4pred(1,k)==i+j
            label4pred(1,k)=17;
        end
    end
    for j=136:143
        if label4pred(1,k)==i+j
            label4pred(1,k)=18;
        end
    end
    for j=144:151
        if label4pred(1,k)==i+j
            label4pred(1,k)=19;
        end
    end
    for j=152:159
        if label4pred(1,k)==i+j
            label4pred(1,k)=20;
        end
    end
    
    for j=160:167
        if label4pred(1,k)==i+j
            label4pred(1,k)=21;
        end
    end
    for j=168:175
        if label4pred(1,k)==i+j
            label4pred(1,k)=22;
        end
    end
    for j=176:183
        if label4pred(1,k)==i+j
            label4pred(1,k)=23;
        end
    end 
    for j=184:191
        if label4pred(1,k)==i+j
            label4pred(1,k)=24;
        end
    end
    for j=192:199
        if label4pred(1,k)==i+j
            label4pred(1,k)=25;
        end
    end
    for j=200:207
        if label4pred(1,k)==i+j
            label4pred(1,k)=26;
        end
    end
    for j=208:215
        if label4pred(1,k)==i+j
            label4pred(1,k)=27;
        end
    end
    for j=216:223
        if label4pred(1,k)==i+j
            label4pred(1,k)=28;
        end
    end
    for j=224:231
        if label4pred(1,k)==i+j
            label4pred(1,k)=29;
        end
    end
    for j=232:239
        if label4pred(1,k)==i+j
            label4pred(1,k)=30;
        end
    end
    
    for j=240:247
        if label4pred(1,k)==i+j
            label4pred(1,k)=31;
        end
    end
    for j=248:255
        if label4pred(1,k)==i+j
            label4pred(1,k)=32;
        end
    end
    for j=256:263
        if label4pred(1,k)==i+j
            label4pred(1,k)=33;
        end
    end 
    for j=264:271
        if label4pred(1,k)==i+j
            label4pred(1,k)=34;
        end
    end
    for j=272:279
        if label4pred(1,k)==i+j
            label4pred(1,k)=35;
        end
    end
    for j=280:287
        if label4pred(1,k)==i+j
            label4pred(1,k)=36;
        end
    end
    for j=288:295
        if label4pred(1,k)==i+j
            label4pred(1,k)=37;
        end
    end
    for j=296:303
        if label4pred(1,k)==i+j
            label4pred(1,k)=38;
        end
    end
    for j=304:311
        if label4pred(1,k)==i+j
            label4pred(1,k)=39;
        end
    end
    for j=312:319
        if label4pred(1,k)==i+j
            label4pred(1,k)=40;
        end
    end
    k=k+1;
end


%calculate accuracy for 4th fold
count=0;
for i=1:80
    if label4(1,i)==label4pred(1,i)
        count=count+1;
    end
end

acc4=count/80*100;


%considering 9,10,19,20,29,30.... as test data
j=1;
k=2;
for i=1:10:400
    test5(j:k,:)=images_array(i+8:i+9,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train5(j:k,:)=images_array([i:i+7],:);
    j=j+8;
    k=k+8;
end
 
u_train_5=mean(train5); % calculate mean of train data
Z_train_5= double(train5) - repmat(u_train_5,320,1);
u_test_5=mean(test5); % calculate mean of test data
Z_test_5= double(test5) - repmat(u_test_5,80,1);
S5=319*cov(Z_train_5);
[V5,D5]=eig(S5);

for i=1:10304
     for j=10304:-1:10225
         E5(i,abs(j-10305))=V5(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end

 train5_red=E5'*Z_train_5';
 test5_red=E5'*Z_test_5';

%creating labels
label5=[];
for i=1:40
    for j=1:2
        label5=[label5;i];
    end
end
label5=label5';

k=1;
for i=1:80
    for j=1:320
        diff5(:,k)=train5_red(1:80,j)-test5_red(1:80,i);
        k=k+1;
    end
end

for i=1:25600
    diff5sq(:,i)=power(diff5(:,i),2);
end

dist5=0;
for i=1:25600
    dist5=0;
    for j=1:80
        dist5=dist5+diff5sq(j,i);
    end
    dist5mat(1,i)=sqrt(dist5); 
end

k=1;
for i=1:320:25600
    minval=min(dist5mat(1,i:i+319));
    label5pred(1,k)=find(dist5mat==minval);
    k=k+1;
end
        
k=1;
for i=1:320:25600
    for j=0:7
        if label5pred(1,k)==i+j
            label5pred(1,k)=1;
        end
    end
    for j=8:15
        if label5pred(1,k)==i+j
            label5pred(1,k)=2;
        end
    end
    for j=16:23
        if label5pred(1,k)==i+j
            label5pred(1,k)=3;
        end
    end 
    for j=24:31
        if label5pred(1,k)==i+j
            label5pred(1,k)=4;
        end
    end
    for j=32:39
        if label5pred(1,k)==i+j
            label5pred(1,k)=5;
        end
    end
    for j=40:47
        if label5pred(1,k)==i+j
            label5pred(1,k)=6;
        end
    end
    for j=48:55
        if label5pred(1,k)==i+j
            label5pred(1,k)=7;
        end
    end
    for j=56:63
        if label5pred(1,k)==i+j
            label5pred(1,k)=8;
        end
    end
    for j=64:71
        if label5pred(1,k)==i+j
            label5pred(1,k)=9;
        end
    end
    for j=72:79
        if label5pred(1,k)==i+j
            label5pred(1,k)=10;
        end
    end
    
    for j=80:87
        if label5pred(1,k)==i+j
            label5pred(1,k)=11;
        end
    end
    for j=88:95
        if label5pred(1,k)==i+j
            label5pred(1,k)=12;
        end
    end
    for j=96:103
        if label5pred(1,k)==i+j
            label5pred(1,k)=13;
        end
    end 
    for j=104:111
        if label5pred(1,k)==i+j
            label5pred(1,k)=14;
        end
    end
    for j=112:120
        if label5pred(1,k)==i+j
            label5pred(1,k)=15;
        end
    end
    for j=121:127
        if label5pred(1,k)==i+j
            label5pred(1,k)=16;
        end
    end
    for j=128:135
        if label5pred(1,k)==i+j
            label5pred(1,k)=17;
        end
    end
    for j=136:143
        if label5pred(1,k)==i+j
            label5pred(1,k)=18;
        end
    end
    for j=144:151
        if label5pred(1,k)==i+j
            label5pred(1,k)=19;
        end
    end
    for j=152:159
        if label5pred(1,k)==i+j
            label5pred(1,k)=20;
        end
    end
    
    for j=160:167
        if label5pred(1,k)==i+j
            label5pred(1,k)=21;
        end
    end
    for j=168:175
        if label5pred(1,k)==i+j
            label5pred(1,k)=22;
        end
    end
    for j=176:183
        if label5pred(1,k)==i+j
            label5pred(1,k)=23;
        end
    end 
    for j=184:191
        if label5pred(1,k)==i+j
            label5pred(1,k)=24;
        end
    end
    for j=192:199
        if label5pred(1,k)==i+j
            label5pred(1,k)=25;
        end
    end
    for j=200:207
        if label5pred(1,k)==i+j
            label5pred(1,k)=26;
        end
    end
    for j=208:215
        if label5pred(1,k)==i+j
            label5pred(1,k)=27;
        end
    end
    for j=216:223
        if label5pred(1,k)==i+j
            label5pred(1,k)=28;
        end
    end
    for j=224:231
        if label5pred(1,k)==i+j
            label5pred(1,k)=29;
        end
    end
    for j=232:239
        if label5pred(1,k)==i+j
            label5pred(1,k)=30;
        end
    end
    
    for j=240:247
        if label5pred(1,k)==i+j
            label5pred(1,k)=31;
        end
    end
    for j=248:255
        if label5pred(1,k)==i+j
            label5pred(1,k)=32;
        end
    end
    for j=256:263
        if label5pred(1,k)==i+j
            label5pred(1,k)=33;
        end
    end 
    for j=264:271
        if label5pred(1,k)==i+j
            label5pred(1,k)=34;
        end
    end
    for j=272:279
        if label5pred(1,k)==i+j
            label5pred(1,k)=35;
        end
    end
    for j=280:287
        if label5pred(1,k)==i+j
            label5pred(1,k)=36;
        end
    end
    for j=288:295
        if label5pred(1,k)==i+j
            label5pred(1,k)=37;
        end
    end
    for j=296:303
        if label5pred(1,k)==i+j
            label5pred(1,k)=38;
        end
    end
    for j=304:311
        if label5pred(1,k)==i+j
            label5pred(1,k)=39;
        end
    end
    for j=312:319
        if label5pred(1,k)==i+j
            label5pred(1,k)=40;
        end
    end
    k=k+1;
end


%calculate accuracy for 5th fold
count=0;
for i=1:80
    if label5(1,i)==label5pred(1,i)
        count=count+1;
    end
end

acc5=count/80*100;

knnaccu_pca = (acc1+acc2+acc3+acc4)/4;

%end of 5 fold




%resize images to 56*46
for i=1:40
    for j=1:10
        img_resize=imread(all_Images(1,i).ImageLocation{j});
		img_resize=imresize(img_resize,[56,46]);
        r_resize=reshape(img_resize, 1, []);
        images_vector_resize{i,j}=r_resize; %vectorize all images
        
    end
end

images_array_resize=reshape(images_vector_resize',[400,1]);
images_array_resize=cell2mat(images_array_resize);

%5 fold cross validation
%considering 1,2,11,12,21,22.... as test data
j=1;
k=2;
for i=1:10:400
    test1_resize(j:k,:)=images_array_resize(i:i+1,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train1_resize(j:k,:)=images_array_resize(i+2:i+9,:);
    j=j+8;
    k=k+8;
end

u_train_1_resize=mean(train1_resize); % calculate mean of train data
Z_train_1_resize= double(train1_resize) - repmat(u_train_1_resize,320,1);
u_test_1_resize=mean(test1_resize); % calculate mean of test data
Z_test_1_resize= double(test1_resize) - repmat(u_test_1_resize,80,1);
S1_resize=319*cov(Z_train_1_resize);
[V1_resize,D1_resize]=eig(S1_resize);

for i=1:2576
    for j=2576:-1:2557
        E1_resize(i,abs(j-2577))=V1_resize(i,j); %top 20 eigenvectors corresponfing to top 20 eigenvalues
    end
end

train1_red_resize=E1_resize'*Z_train_1_resize';
test1_red_resize=E1_resize'*Z_test_1_resize';


%creating labels
label1_resize=[];
for i=1:40
    for j=1:2
        label1_resize=[label1_resize;i];
    end
end
label1_resize=label1_resize';

k=1;
for i=1:80
    for j=1:320
        diff1_resize(:,k)=train1_red_resize(1:20,j)-test1_red_resize(1:20,i);
        k=k+1;
    end
end

for i=1:25600
    diff1sq_resize(:,i)=power(diff1_resize(:,i),2);
end

dist1_resize=0;
for i=1:25600
    dist1_resize=0;
    for j=1:20
        dist1_resize=dist1_resize+diff1sq_resize(j,i);
    end
    dist1mat_resize(1,i)=sqrt(dist1_resize); 
end

k=1;
for i=1:320:25600
    minval=min(dist1mat_resize(1,i:i+319));
    label1pred_resize(1,k)=find(dist1mat_resize==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=1;
        end
    end
    for j=8:15
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=2;
        end
    end
    for j=16:23
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=3;
        end
    end 
    for j=24:31
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=4;
        end
    end
    for j=32:39
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=5;
        end
    end
    for j=40:47
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=6;
        end
    end
    for j=48:55
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=7;
        end
    end
    for j=56:63
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=8;
        end
    end
    for j=64:71
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=9;
        end
    end
    for j=72:79
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=10;
        end
    end
    
    for j=80:87
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=11;
        end
    end
    for j=88:95
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=12;
        end
    end
    for j=96:103
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=13;
        end
    end 
    for j=104:111
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=14;
        end
    end
    for j=112:120
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=15;
        end
    end
    for j=121:127
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=16;
        end
    end
    for j=128:135
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=17;
        end
    end
    for j=136:143
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=18;
        end
    end
    for j=144:151
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=19;
        end
    end
    for j=152:159
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=20;
        end
    end
    
    for j=160:167
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=21;
        end
    end
    for j=168:175
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=22;
        end
    end
    for j=176:183
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=23;
        end
    end 
    for j=184:191
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=24;
        end
    end
    for j=192:199
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=25;
        end
    end
    for j=200:207
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=26;
        end
    end
    for j=208:215
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=27;
        end
    end
    for j=216:223
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=28;
        end
    end
    for j=224:231
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=29;
        end
    end
    for j=232:239
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=30;
        end
    end
    
    for j=240:247
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=31;
        end
    end
    for j=248:255
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=32;
        end
    end
    for j=256:263
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=33;
        end
    end 
    for j=264:271
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=34;
        end
    end
    for j=272:279
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=35;
        end
    end
    for j=280:287
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=36;
        end
    end
    for j=288:295
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=37;
        end
    end
    for j=296:303
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=38;
        end
    end
    for j=304:311
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=39;
        end
    end
    for j=312:319
        if label1pred_resize(1,k)==i+j
            label1pred_resize(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 1st fold
count=0;
for i=1:80
    if label1_resize(1,i)==label1pred_resize(1,i)
        count=count+1;
    end
end

acc1_resize=count/80*100;

%considering 3,4,13,14,23,24.... as test data
j=1;
k=2;
for i=1:10:400
    test2_resize(j:k,:)=images_array_resize(i+2:i+3,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train2_resize(j:k,:)=images_array_resize([i:i+1 i+4:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_2_resize=mean(train2_resize); % calculate mean of train data
Z_train_2_resize= double(train2_resize) - repmat(u_train_2_resize,320,1);
u_test_2_resize=mean(test2_resize); % calculate mean of test data
Z_test_2_resize= double(test2_resize) - repmat(u_test_2_resize,80,1);
S2_resize=319*cov(Z_train_2_resize);
[V2_resize,D2_resize]=eig(S2_resize);

 for i=1:2576
     for j=2576:-1:2557
         E2_resize(i,abs(j-2577))=V2_resize(i,j); %top 20 eigenvectors corresponfing to top 20 eigenvalues
     end
 end

 train2_red_resize=E2_resize'*Z_train_2_resize';
 test2_red_resize=E2_resize'*Z_test_2_resize';

%creating labels
label2_resize=[];
for i=1:40
    for j=1:2
        label2_resize=[label2_resize;i];
    end
end
label2_resize=label2_resize';

k=1;
for i=1:80
    for j=1:320
        diff2_resize(:,k)=train2_red_resize(1:20,j)-test2_red_resize(1:20,i);
        k=k+1;
    end
end

for i=1:25600
    diff2sq_resize(:,i)=power(diff2_resize(:,i),2);
end

dist2_resize=0;
for i=1:25600
    dist2_resize=0;
    for j=1:20
        dist2_resize=dist2_resize+diff2sq_resize(j,i);
    end
    dist2mat_resize(1,i)=sqrt(dist2_resize); 
end

k=1;
for i=1:320:25600
    minval=min(dist2mat_resize(1,i:i+319));
    label2pred_resize(1,k)=find(dist2mat_resize==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=1;
        end
    end
    for j=8:15
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=2;
        end
    end
    for j=16:23
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=3;
        end
    end 
    for j=24:31
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=4;
        end
    end
    for j=32:39
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=5;
        end
    end
    for j=40:47
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=6;
        end
    end
    for j=48:55
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=7;
        end
    end
    for j=56:63
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=8;
        end
    end
    for j=64:71
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=9;
        end
    end
    for j=72:79
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=10;
        end
    end
    
    for j=80:87
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=11;
        end
    end
    for j=88:95
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=12;
        end
    end
    for j=96:103
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=13;
        end
    end 
    for j=104:111
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=14;
        end
    end
    for j=112:120
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=15;
        end
    end
    for j=121:127
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=16;
        end
    end
    for j=128:135
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=17;
        end
    end
    for j=136:143
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=18;
        end
    end
    for j=144:151
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=19;
        end
    end
    for j=152:159
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=20;
        end
    end
    
    for j=160:167
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=21;
        end
    end
    for j=168:175
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=22;
        end
    end
    for j=176:183
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=23;
        end
    end 
    for j=184:191
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=24;
        end
    end
    for j=192:199
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=25;
        end
    end
    for j=200:207
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=26;
        end
    end
    for j=208:215
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=27;
        end
    end
    for j=216:223
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=28;
        end
    end
    for j=224:231
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=29;
        end
    end
    for j=232:239
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=30;
        end
    end
    
    for j=240:247
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=31;
        end
    end
    for j=248:255
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=32;
        end
    end
    for j=256:263
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=33;
        end
    end 
    for j=264:271
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=34;
        end
    end
    for j=272:279
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=35;
        end
    end
    for j=280:287
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=36;
        end
    end
    for j=288:295
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=37;
        end
    end
    for j=296:303
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=38;
        end
    end
    for j=304:311
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=39;
        end
    end
    for j=312:319
        if label2pred_resize(1,k)==i+j
            label2pred_resize(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 2nd fold
count=0;
for i=1:80
    if label2_resize(1,i)==label2pred_resize(1,i)
        count=count+1;
    end
end

acc2_resize=count/80*100;

%considering 5,6,15,16,25,26.... as test data
j=1;
k=2;
for i=1:10:400
    test3_resize(j:k,:)=images_array_resize(i+4:i+5,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train3_resize(j:k,:)=images_array_resize([i:i+3 i+6:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_3_resize=mean(train3_resize); % calculate mean of train data
Z_train_3_resize= double(train3_resize) - repmat(u_train_3_resize,320,1);
u_test_3_resize=mean(test3_resize); % calculate mean of test data
Z_test_3_resize= double(test3_resize) - repmat(u_test_3_resize,80,1);
S3_resize=319*cov(Z_train_3_resize);
[V3_resize,D3_resize]=eig(S3_resize);

 for i=1:2576
     for j=2576:-1:2557
         E3_resize(i,abs(j-2577))=V3_resize(i,j); %top 20 eigenvectors corresponfing to top 20 eigenvalues
     end
 end

 train3_red_resize=E3_resize'*Z_train_3_resize';
 test3_red_resize=E3_resize'*Z_test_3_resize';

%creating labels
label3_resize=[];
for i=1:40
    for j=1:2
        label3_resize=[label3_resize;i];
    end
end
label3_resize=label3_resize';

k=1;
for i=1:80
    for j=1:320
        diff3_resize(:,k)=train3_red_resize(1:20,j)-test3_red_resize(1:20,i);
        k=k+1;
    end
end

for i=1:25600
    diff3sq_resize(:,i)=power(diff3_resize(:,i),2);
end

dist3_resize=0;
for i=1:25600
    dist3_resize=0;
    for j=1:20
        dist3_resize=dist3_resize+diff3sq_resize(j,i);
    end
    dist3mat_resize(1,i)=sqrt(dist3_resize); 
end

k=1;
for i=1:320:25600
    minval=min(dist3mat_resize(1,i:i+319));
    label3pred_resize(1,k)=find(dist3mat_resize==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=1;
        end
    end
    for j=8:15
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=2;
        end
    end
    for j=16:23
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=3;
        end
    end 
    for j=24:31
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=4;
        end
    end
    for j=32:39
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=5;
        end
    end
    for j=40:47
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=6;
        end
    end
    for j=48:55
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=7;
        end
    end
    for j=56:63
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=8;
        end
    end
    for j=64:71
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=9;
        end
    end
    for j=72:79
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=10;
        end
    end
    
    for j=80:87
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=11;
        end
    end
    for j=88:95
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=12;
        end
    end
    for j=96:103
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=13;
        end
    end 
    for j=104:111
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=14;
        end
    end
    for j=112:120
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=15;
        end
    end
    for j=121:127
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=16;
        end
    end
    for j=128:135
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=17;
        end
    end
    for j=136:143
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=18;
        end
    end
    for j=144:151
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=19;
        end
    end
    for j=152:159
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=20;
        end
    end
    
    for j=160:167
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=21;
        end
    end
    for j=168:175
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=22;
        end
    end
    for j=176:183
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=23;
        end
    end 
    for j=184:191
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=24;
        end
    end
    for j=192:199
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=25;
        end
    end
    for j=200:207
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=26;
        end
    end
    for j=208:215
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=27;
        end
    end
    for j=216:223
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=28;
        end
    end
    for j=224:231
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=29;
        end
    end
    for j=232:239
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=30;
        end
    end
    
    for j=240:247
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=31;
        end
    end
    for j=248:255
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=32;
        end
    end
    for j=256:263
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=33;
        end
    end 
    for j=264:271
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=34;
        end
    end
    for j=272:279
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=35;
        end
    end
    for j=280:287
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=36;
        end
    end
    for j=288:295
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=37;
        end
    end
    for j=296:303
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=38;
        end
    end
    for j=304:311
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=39;
        end
    end
    for j=312:319
        if label3pred_resize(1,k)==i+j
            label3pred_resize(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 3rd fold
count=0;
for i=1:80
    if label3_resize(1,i)==label3pred_resize(1,i)
        count=count+1;
    end
end

acc3_resize=count/80*100;

%considering 7,8,17,18,27,28.... as test data
j=1;
k=2;
for i=1:10:400
    test4_resize(j:k,:)=images_array_resize(i+6:i+7,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train4_resize(j:k,:)=images_array_resize([i:i+5 i+8:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_4_resize=mean(train4_resize); % calculate mean of train data
Z_train_4_resize= double(train4_resize) - repmat(u_train_4_resize,320,1);
u_test_4_resize=mean(test4_resize); % calculate mean of test data
Z_test_4_resize= double(test4_resize) - repmat(u_test_4_resize,80,1);
S4_resize=319*cov(Z_train_4_resize);
[V4_resize,D4_resize]=eig(S4_resize);

 for i=1:2576
     for j=2576:-1:2557
         E4_resize(i,abs(j-2577))=V4_resize(i,j); %top 20 eigenvectors corresponfing to top 20 eigenvalues
     end
 end

 train4_red_resize=E4_resize'*Z_train_4_resize';
 test4_red_resize=E4_resize'*Z_test_4_resize';

%creating labels
label4_resize=[];
for i=1:40
    for j=1:2
        label4_resize=[label4_resize;i];
    end
end
label4_resize=label4_resize';

k=1;
for i=1:80
    for j=1:320
        diff4_resize(:,k)=train4_red_resize(1:20,j)-test4_red_resize(1:20,i);
        k=k+1;
    end
end

for i=1:25600
    diff4sq_resize(:,i)=power(diff4_resize(:,i),2);
end

dist4_resize=0;
for i=1:25600
    dist4_resize=0;
    for j=1:20
        dist4_resize=dist4_resize+diff4sq_resize(j,i);
    end
    dist4mat_resize(1,i)=sqrt(dist4_resize); 
end

k=1;
for i=1:320:25600
    minval=min(dist4mat_resize(1,i:i+319));
    label4pred_resize(1,k)=find(dist4mat_resize==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=1;
        end
    end
    for j=8:15
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=2;
        end
    end
    for j=16:23
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=3;
        end
    end 
    for j=24:31
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=4;
        end
    end
    for j=32:39
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=5;
        end
    end
    for j=40:47
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=6;
        end
    end
    for j=48:55
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=7;
        end
    end
    for j=56:63
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=8;
        end
    end
    for j=64:71
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=9;
        end
    end
    for j=72:79
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=10;
        end
    end
    
    for j=80:87
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=11;
        end
    end
    for j=88:95
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=12;
        end
    end
    for j=96:103
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=13;
        end
    end 
    for j=104:111
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=14;
        end
    end
    for j=112:120
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=15;
        end
    end
    for j=121:127
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=16;
        end
    end
    for j=128:135
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=17;
        end
    end
    for j=136:143
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=18;
        end
    end
    for j=144:151
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=19;
        end
    end
    for j=152:159
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=20;
        end
    end
    
    for j=160:167
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=21;
        end
    end
    for j=168:175
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=22;
        end
    end
    for j=176:183
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=23;
        end
    end 
    for j=184:191
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=24;
        end
    end
    for j=192:199
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=25;
        end
    end
    for j=200:207
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=26;
        end
    end
    for j=208:215
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=27;
        end
    end
    for j=216:223
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=28;
        end
    end
    for j=224:231
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=29;
        end
    end
    for j=232:239
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=30;
        end
    end
    
    for j=240:247
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=31;
        end
    end
    for j=248:255
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=32;
        end
    end
    for j=256:263
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=33;
        end
    end 
    for j=264:271
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=34;
        end
    end
    for j=272:279
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=35;
        end
    end
    for j=280:287
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=36;
        end
    end
    for j=288:295
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=37;
        end
    end
    for j=296:303
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=38;
        end
    end
    for j=304:311
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=39;
        end
    end
    for j=312:319
        if label4pred_resize(1,k)==i+j
            label4pred_resize(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 4th fold
count=0;
for i=1:80
    if label4_resize(1,i)==label4pred_resize(1,i)
        count=count+1;
    end
end

acc4_resize=count/80*100;

%considering 9,10,19,20,29,30.... as test data
j=1;
k=2;
for i=1:10:400
    test5_resize(j:k,:)=images_array_resize(i+8:i+9,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train5_resize(j:k,:)=images_array_resize([i:i+7],:);
    j=j+8;
    k=k+8;
end

u_train_5_resize=mean(train5_resize); % calculate mean of train data
Z_train_5_resize= double(train5_resize) - repmat(u_train_5_resize,320,1);
u_test_5_resize=mean(test5_resize); % calculate mean of test data
Z_test_5_resize= double(test5_resize) - repmat(u_test_5_resize,80,1);
S5_resize=319*cov(Z_train_5_resize);
[V5_resize,D5_resize]=eig(S5_resize);

 for i=1:2576
     for j=2576:-1:2557
         E5_resize(i,abs(j-2577))=V5_resize(i,j); %top 20 eigenvectors corresponfing to top 20 eigenvalues
     end
 end

 train5_red_resize=E5_resize'*Z_train_5_resize';
 test5_red_resize=E5_resize'*Z_test_5_resize';

%creating labels
label5_resize=[];
for i=1:40
    for j=1:2
        label5_resize=[label5_resize;i];
    end
end
label5_resize=label5_resize';

k=1;
for i=1:80
    for j=1:320
        diff5_resize(:,k)=train5_red_resize(1:20,j)-test5_red_resize(1:20,i);
        k=k+1;
    end
end

for i=1:25600
    diff5sq_resize(:,i)=power(diff5_resize(:,i),2);
end

dist5_resize=0;
for i=1:25600
    dist5_resize=0;
    for j=1:20
        dist5_resize=dist5_resize+diff5sq_resize(j,i);
    end
    dist5mat_resize(1,i)=sqrt(dist5_resize); 
end

k=1;
for i=1:320:25600
    minval=min(dist5mat_resize(1,i:i+319));
    label5pred_resize(1,k)=find(dist5mat_resize==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=1;
        end
    end
    for j=8:15
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=2;
        end
    end
    for j=16:23
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=3;
        end
    end 
    for j=24:31
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=4;
        end
    end
    for j=32:39
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=5;
        end
    end
    for j=40:47
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=6;
        end
    end
    for j=48:55
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=7;
        end
    end
    for j=56:63
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=8;
        end
    end
    for j=64:71
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=9;
        end
    end
    for j=72:79
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=10;
        end
    end
    
    for j=80:87
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=11;
        end
    end
    for j=88:95
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=12;
        end
    end
    for j=96:103
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=13;
        end
    end 
    for j=104:111
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=14;
        end
    end
    for j=112:120
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=15;
        end
    end
    for j=121:127
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=16;
        end
    end
    for j=128:135
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=17;
        end
    end
    for j=136:143
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=18;
        end
    end
    for j=144:151
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=19;
        end
    end
    for j=152:159
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=20;
        end
    end
    
    for j=160:167
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=21;
        end
    end
    for j=168:175
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=22;
        end
    end
    for j=176:183
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=23;
        end
    end 
    for j=184:191
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=24;
        end
    end
    for j=192:199
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=25;
        end
    end
    for j=200:207
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=26;
        end
    end
    for j=208:215
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=27;
        end
    end
    for j=216:223
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=28;
        end
    end
    for j=224:231
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=29;
        end
    end
    for j=232:239
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=30;
        end
    end
    
    for j=240:247
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=31;
        end
    end
    for j=248:255
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=32;
        end
    end
    for j=256:263
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=33;
        end
    end 
    for j=264:271
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=34;
        end
    end
    for j=272:279
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=35;
        end
    end
    for j=280:287
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=36;
        end
    end
    for j=288:295
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=37;
        end
    end
    for j=296:303
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=38;
        end
    end
    for j=304:311
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=39;
        end
    end
    for j=312:319
        if label5pred_resize(1,k)==i+j
            label5pred_resize(1,k)=40;
        end
    end
    k=k+1;
end

%calculate accuracy for 5th fold
count=0;
for i=1:80
    if label5_resize(1,i)==label5pred_resize(1,i)
        count=count+1;
    end
end

acc5_resize=count/80*100;

knnaccu_pca_resize = (acc1_resize+acc2_resize+acc3_resize+acc4_resize)/4;



%%%LDA from bytefish%%%

k=1;
for i=1:10:400
    train1_lda(k:k+7,:)=images_array([i+2:i+9],:); %%similar to X in code
    k=k+8;
end

k=1;
for i=1:10:400
    test1_lda(k:k+1,:)=images_array([i:i+1],:);
    k=k+2;
end

%train labels
c1train_lda=[];
for i=1:40
    for j=1:8
        c1train_lda=[c1train_lda;i];
    end
end

%test labels
c1test_lda=[];
for i=1:40
    for j=1:2
        c1test_lda=[c1test_lda;i];
    end
end

c1_train1=train1_lda(find(c1train_lda==1),:);
c2_train1=train1_lda(find(c1train_lda==2),:);
c3_train1=train1_lda(find(c1train_lda==3),:);
c4_train1=train1_lda(find(c1train_lda==4),:);
c5_train1=train1_lda(find(c1train_lda==5),:);
c6_train1=train1_lda(find(c1train_lda==6),:);
c7_train1=train1_lda(find(c1train_lda==7),:);
c8_train1=train1_lda(find(c1train_lda==8),:);
c9_train1=train1_lda(find(c1train_lda==9),:);
c10_train1=train1_lda(find(c1train_lda==10),:);
c11_train1=train1_lda(find(c1train_lda==11),:);
c12_train1=train1_lda(find(c1train_lda==12),:);
c13_train1=train1_lda(find(c1train_lda==13),:);
c14_train1=train1_lda(find(c1train_lda==14),:);
c15_train1=train1_lda(find(c1train_lda==15),:);
c16_train1=train1_lda(find(c1train_lda==16),:);
c17_train1=train1_lda(find(c1train_lda==17),:);
c18_train1=train1_lda(find(c1train_lda==18),:);
c19_train1=train1_lda(find(c1train_lda==19),:);
c20_train1=train1_lda(find(c1train_lda==20),:);
c21_train1=train1_lda(find(c1train_lda==21),:);
c22_train1=train1_lda(find(c1train_lda==22),:);
c23_train1=train1_lda(find(c1train_lda==23),:);
c24_train1=train1_lda(find(c1train_lda==24),:);
c25_train1=train1_lda(find(c1train_lda==25),:);
c26_train1=train1_lda(find(c1train_lda==26),:);
c27_train1=train1_lda(find(c1train_lda==27),:);
c28_train1=train1_lda(find(c1train_lda==28),:);
c29_train1=train1_lda(find(c1train_lda==29),:);
c30_train1=train1_lda(find(c1train_lda==30),:);
c31_train1=train1_lda(find(c1train_lda==31),:);
c32_train1=train1_lda(find(c1train_lda==32),:);
c33_train1=train1_lda(find(c1train_lda==33),:);
c34_train1=train1_lda(find(c1train_lda==34),:);
c35_train1=train1_lda(find(c1train_lda==35),:);
c36_train1=train1_lda(find(c1train_lda==36),:);
c37_train1=train1_lda(find(c1train_lda==37),:);
c38_train1=train1_lda(find(c1train_lda==38),:);
c39_train1=train1_lda(find(c1train_lda==39),:);
c40_train1=train1_lda(find(c1train_lda==40),:);

meantotal_train1_lda=mean(train1_lda);
meantotal_test1_lda=mean(test1_lda);

mean1_lda=[mean(c1_train1);mean(c2_train1);mean(c3_train1);mean(c4_train1);mean(c5_train1);mean(c6_train1);mean(c7_train1);mean(c8_train1);mean(c9_train1);mean(c10_train1);
           mean(c11_train1);mean(c12_train1);mean(c13_train1);mean(c14_train1);mean(c15_train1);mean(c16_train1);mean(c17_train1);mean(c18_train1);mean(c19_train1);mean(c20_train1);
		   mean(c21_train1);mean(c22_train1);mean(c23_train1);mean(c24_train1);mean(c25_train1);mean(c26_train1);mean(c27_train1);mean(c28_train1);mean(c29_train1);mean(c30_train1);
		   mean(c31_train1);mean(c32_train1);mean(c33_train1);mean(c34_train1);mean(c35_train1);mean(c36_train1);mean(c37_train1);mean(c38_train1);mean(c39_train1);mean(c40_train1)];
       
Sw1_lda=(double(train1_lda)-mean1_lda(c1train_lda,:))'*(double(train1_lda)-mean1_lda(c1train_lda,:));
Sb1_lda=(ones(40,1)*meantotal_train1_lda-mean1_lda)'*(ones(40,1)*meantotal_train1_lda-mean1_lda);

 [V1_lda,D1_lda]=eig(Sw1_lda\Sb1_lda);
[D1_lda, o] = sort(diag(D1_lda), 'descend');
V1_lda = V1_lda(:,o);

hold on;
for i=1:10304
    plot(i,D1_lda(i,1),'*')
end
hold off;


Ztrain1_lda=bsxfun(@minus,double(train1_lda),meantotal_train1_lda);
Ztest1_lda=bsxfun(@minus,double(test1_lda),meantotal_test1_lda);

  Etrain1_lda=V1_lda(1:end,1:39);

 Ytrain1_red=Etrain1_lda.'*Ztrain1_lda.';
 Ytest1_red=Etrain1_lda.'*Ztest1_lda.';

k=1;
for i=1:80
    for j=1:320
        diff1_lda(:,k)=Ytrain1_red(1:39,j)-Ytest1_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff1sq_lda(:,i)=power(diff1_lda(:,i),2);
end

dist1_lda=0;
for i=1:25600
    dist1_lda=0;
    for j=1:39
        dist1_lda=dist1_lda+diff1sq_lda(j,i);
    end
    dist1mat_lda(1,i)=sqrt(dist1_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist1mat_lda(1,i:i+319));
    label1pred_lda(1,k)=find(dist1mat_lda==minval);
    k=k+1;
end

 k=1;
 for i=1:320:25600
     for j=0:7
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=1;
         end
     end
     for j=8:15
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=2;
         end
     end
     for j=16:23
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=3;
         end
     end 
     for j=24:31
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=4;
         end
     end
     for j=32:39
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=5;
         end
     end
     for j=40:47
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=6;
         end
     end
     for j=48:55
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=7;
         end
     end
     for j=56:63
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=8;
         end
     end
     for j=64:71
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=9;
         end
     end
     for j=72:79
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=10;
         end
     end
     
     for j=80:87
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=11;
         end
     end
     for j=88:95
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=12;
         end
     end
     for j=96:103
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=13;
         end
     end 
     for j=104:111
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=14;
         end
     end
     for j=112:120
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=15;
         end
     end
     for j=121:127
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=16;
         end
     end
     for j=128:135
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=17;
         end
     end
     for j=136:143
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=18;
         end
     end
     for j=144:151
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=19;
         end
     end
     for j=152:159
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=20;
         end
     end
     
     for j=160:167
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=21;
         end
     end
     for j=168:175
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=22;
         end
     end
     for j=176:183
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=23;
         end
     end 
     for j=184:191
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=24;
         end
     end
     for j=192:199
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=25;
         end
     end
     for j=200:207
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=26;
         end
     end
     for j=208:215
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=27;
         end
     end
     for j=216:223
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=28;
         end
     end
     for j=224:231
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=29;
         end
     end
     for j=232:239
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=30;
         end
     end
     
     for j=240:247
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=31;
         end
     end
     for j=248:255
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=32;
         end
     end
     for j=256:263
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=33;
         end
     end 
     for j=264:271
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=34;
         end
     end
     for j=272:279
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=35;
         end
     end
     for j=280:287
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=36;
         end
     end
     for j=288:295
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=37;
         end
     end
     for j=296:303
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=38;
         end
     end
     for j=304:311
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=39;
         end
     end
     for j=312:319
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=40;
         end
     end
     k=k+1;
 end
 
c1test_lda=c1test_lda';

%calculate accuracy for 1st fold lda
count=0;
for i=1:80
    if c1test_lda(1,i)==label1pred_lda(1,i)
        count=count+1;
    end
end

acc1_lda=count/80*100;

%%% 2nd fold %%%%%%
k=1;
for i=1:10:400
    train2_lda(k:k+7,:)=images_array([i:i+1 i+4:i+9],:); %%similar to X in code
    k=k+8;
end

k=1;
for i=1:10:400
    test2_lda(k:k+1,:)=images_array([i+2:i+3],:);
    k=k+2;
end

%train labels
c2train_lda=[];
for i=1:40
    for j=1:8
        c2train_lda=[c2train_lda;i];
    end
end

%test labels
c2test_lda=[];
for i=1:40
    for j=1:2
        c2test_lda=[c2test_lda;i];
    end
end

c1_train2=train2_lda(find(c2train_lda==1),:);
c2_train2=train2_lda(find(c2train_lda==2),:);
c3_train2=train2_lda(find(c2train_lda==3),:);
c4_train2=train2_lda(find(c2train_lda==4),:);
c5_train2=train2_lda(find(c2train_lda==5),:);
c6_train2=train2_lda(find(c2train_lda==6),:);
c7_train2=train2_lda(find(c2train_lda==7),:);
c8_train2=train2_lda(find(c2train_lda==8),:);
c9_train2=train2_lda(find(c2train_lda==9),:);
c10_train2=train2_lda(find(c2train_lda==10),:);
c11_train2=train2_lda(find(c2train_lda==11),:);
c12_train2=train2_lda(find(c2train_lda==12),:);
c13_train2=train2_lda(find(c2train_lda==13),:);
c14_train2=train2_lda(find(c2train_lda==14),:);
c15_train2=train2_lda(find(c2train_lda==15),:);
c16_train2=train2_lda(find(c2train_lda==16),:);
c17_train2=train2_lda(find(c2train_lda==17),:);
c18_train2=train2_lda(find(c2train_lda==18),:);
c19_train2=train2_lda(find(c2train_lda==19),:);
c20_train2=train2_lda(find(c2train_lda==20),:);
c21_train2=train2_lda(find(c2train_lda==21),:);
c22_train2=train2_lda(find(c2train_lda==22),:);
c23_train2=train2_lda(find(c2train_lda==23),:);
c24_train2=train2_lda(find(c2train_lda==24),:);
c25_train2=train2_lda(find(c2train_lda==25),:);
c26_train2=train2_lda(find(c2train_lda==26),:);
c27_train2=train2_lda(find(c2train_lda==27),:);
c28_train2=train2_lda(find(c2train_lda==28),:);
c29_train2=train2_lda(find(c2train_lda==29),:);
c30_train2=train2_lda(find(c2train_lda==30),:);
c31_train2=train2_lda(find(c2train_lda==31),:);
c32_train2=train2_lda(find(c2train_lda==32),:);
c33_train2=train2_lda(find(c2train_lda==33),:);
c34_train2=train2_lda(find(c2train_lda==34),:);
c35_train2=train2_lda(find(c2train_lda==35),:);
c36_train2=train2_lda(find(c2train_lda==36),:);
c37_train2=train2_lda(find(c2train_lda==37),:);
c38_train2=train2_lda(find(c2train_lda==38),:);
c39_train2=train2_lda(find(c2train_lda==39),:);
c40_train2=train2_lda(find(c2train_lda==40),:);


meantotal_train2_lda=mean(train2_lda);
meantotal_test2_lda=mean(test2_lda);

mean2_lda=[mean(c1_train2);mean(c2_train2);mean(c3_train2);mean(c4_train2);mean(c5_train2);mean(c6_train2);mean(c7_train2);mean(c8_train2);mean(c9_train2);mean(c10_train2);
           mean(c11_train2);mean(c12_train2);mean(c13_train2);mean(c14_train2);mean(c15_train2);mean(c16_train2);mean(c17_train2);mean(c18_train2);mean(c19_train2);mean(c20_train2);
		   mean(c21_train2);mean(c22_train2);mean(c23_train2);mean(c24_train2);mean(c25_train2);mean(c26_train2);mean(c27_train2);mean(c28_train2);mean(c29_train2);mean(c30_train2);
		   mean(c31_train2);mean(c32_train2);mean(c33_train2);mean(c34_train2);mean(c35_train2);mean(c36_train2);mean(c37_train2);mean(c38_train2);mean(c39_train2);mean(c40_train2)];

Sw2_lda=(double(train2_lda)-mean2_lda(c2train_lda,:))'*(double(train2_lda)-mean2_lda(c2train_lda,:));
Sb2_lda=(ones(40,1)*meantotal_train2_lda-mean2_lda)'*(ones(40,1)*meantotal_train2_lda-mean2_lda);

[V2_lda,D2_lda]=eig(Sw2_lda\Sb2_lda);
[D2_lda, o1] = sort(diag(D2_lda), 'descend');
V2_lda = V2_lda(:,o1);

Ztrain2_lda=bsxfun(@minus,double(train2_lda),meantotal_train2_lda);
Ztest2_lda=bsxfun(@minus,double(test2_lda),meantotal_test2_lda);

Etrain2_lda=V2_lda(1:end,1:39);
Ytrain2_red=Etrain2_lda.'*Ztrain2_lda.';
Ytest2_red=Etrain2_lda.'*Ztest2_lda.';

k=1;
for i=1:80
    for j=1:320
        diff2_lda(:,k)=Ytrain2_red(1:39,j)-Ytest2_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff2sq_lda(:,i)=power(diff2_lda(:,i),2);
end

dist2_lda=0;
for i=1:25600
    dist2_lda=0;
    for j=1:39
        dist2_lda=dist2_lda+diff2sq_lda(j,i);
    end
    dist2mat_lda(1,i)=sqrt(dist2_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist2mat_lda(1,i:i+319));
    label2pred_lda(1,k)=find(dist2mat_lda==minval);
    k=k+1;
end

 k=1;
 for i=1:320:25600
     for j=0:7
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=1;
         end
     end
     for j=8:15
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=2;
         end
     end
     for j=16:23
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=3;
         end
     end 
     for j=24:31
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=4;
         end
     end
     for j=32:39
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=5;
         end
     end
     for j=40:47
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=6;
         end
     end
     for j=48:55
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=7;
         end
     end
     for j=56:63
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=8;
         end
     end
     for j=64:71
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=9;
         end
     end
     for j=72:79
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=10;
         end
     end
     
     for j=80:87
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=11;
         end
     end
     for j=88:95
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=12;
         end
     end
     for j=96:103
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=13;
         end
     end 
     for j=104:111
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=14;
         end
     end
     for j=112:120
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=15;
         end
     end
     for j=121:127
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=16;
         end
     end
     for j=128:135
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=17;
         end
     end
     for j=136:143
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=18;
         end
     end
     for j=144:151
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=19;
         end
     end
     for j=152:159
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=20;
         end
     end
     
     for j=160:167
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=21;
         end
     end
     for j=168:175
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=22;
         end
     end
     for j=176:183
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=23;
         end
     end 
     for j=184:191
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=24;
         end
     end
     for j=192:199
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=25;
         end
     end
     for j=200:207
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=26;
         end
     end
     for j=208:215
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=27;
         end
     end
     for j=216:223
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=28;
         end
     end
     for j=224:231
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=29;
         end
     end
     for j=232:239
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=30;
         end
     end
     
     for j=240:247
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=31;
         end
     end
     for j=248:255
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=32;
         end
     end
     for j=256:263
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=33;
         end
     end 
     for j=264:271
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=34;
         end
     end
     for j=272:279
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=35;
         end
     end
     for j=280:287
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=36;
         end
     end
     for j=288:295
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=37;
         end
     end
     for j=296:303
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=38;
         end
     end
     for j=304:311
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=39;
         end
     end
     for j=312:319
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=40;
         end
     end
     k=k+1;
 end

c2test_lda=c2test_lda';

%calculate accuracy for 2nd fold lda
count=0;
for i=1:80
    if c2test_lda(1,i)==label2pred_lda(1,i)
        count=count+1;
    end
end

acc2_lda=count/80*100;

%%3rd fold%%%
k=1;
for i=1:10:400
    train3_lda(k:k+7,:)=images_array([i:i+3 i+6:i+9],:); %%similar to X in code
    k=k+8;
end

k=1;
for i=1:10:400
    test3_lda(k:k+1,:)=images_array([i+4:i+5],:);
    k=k+2;
end

%train labels
c3train_lda=[];
for i=1:40
    for j=1:8
        c3train_lda=[c3train_lda;i];
    end
end

%test labels
c3test_lda=[];
for i=1:40
    for j=1:2
        c3test_lda=[c3test_lda;i];
    end
end

c1_train3=train3_lda(find(c3train_lda==1),:);
c2_train3=train3_lda(find(c3train_lda==2),:);
c3_train3=train3_lda(find(c3train_lda==3),:);
c4_train3=train3_lda(find(c3train_lda==4),:);
c5_train3=train3_lda(find(c3train_lda==5),:);
c6_train3=train3_lda(find(c3train_lda==6),:);
c7_train3=train3_lda(find(c3train_lda==7),:);
c8_train3=train3_lda(find(c3train_lda==8),:);
c9_train3=train3_lda(find(c3train_lda==9),:);
c10_train3=train3_lda(find(c3train_lda==10),:);
c11_train3=train3_lda(find(c3train_lda==11),:);
c12_train3=train3_lda(find(c3train_lda==12),:);
c13_train3=train3_lda(find(c3train_lda==13),:);
c14_train3=train3_lda(find(c3train_lda==14),:);
c15_train3=train3_lda(find(c3train_lda==15),:);
c16_train3=train3_lda(find(c3train_lda==16),:);
c17_train3=train3_lda(find(c3train_lda==17),:);
c18_train3=train3_lda(find(c3train_lda==18),:);
c19_train3=train3_lda(find(c3train_lda==19),:);
c20_train3=train3_lda(find(c3train_lda==20),:);
c21_train3=train3_lda(find(c3train_lda==21),:);
c22_train3=train3_lda(find(c3train_lda==22),:);
c23_train3=train3_lda(find(c3train_lda==23),:);
c24_train3=train3_lda(find(c3train_lda==24),:);
c25_train3=train3_lda(find(c3train_lda==25),:);
c26_train3=train3_lda(find(c3train_lda==26),:);
c27_train3=train3_lda(find(c3train_lda==27),:);
c28_train3=train3_lda(find(c3train_lda==28),:);
c29_train3=train3_lda(find(c3train_lda==29),:);
c30_train3=train3_lda(find(c3train_lda==30),:);
c31_train3=train3_lda(find(c3train_lda==31),:);
c32_train3=train3_lda(find(c3train_lda==32),:);
c33_train3=train3_lda(find(c3train_lda==33),:);
c34_train3=train3_lda(find(c3train_lda==34),:);
c35_train3=train3_lda(find(c3train_lda==35),:);
c36_train3=train3_lda(find(c3train_lda==36),:);
c37_train3=train3_lda(find(c3train_lda==37),:);
c38_train3=train3_lda(find(c3train_lda==38),:);
c39_train3=train3_lda(find(c3train_lda==39),:);
c40_train3=train3_lda(find(c3train_lda==40),:);

meantotal_train3_lda=mean(train3_lda);
meantotal_test3_lda=mean(test3_lda);

mean3_lda=[mean(c1_train3);mean(c2_train3);mean(c3_train3);mean(c4_train3);mean(c5_train3);mean(c6_train3);mean(c7_train3);mean(c8_train3);mean(c9_train3);mean(c10_train3);
           mean(c11_train3);mean(c12_train3);mean(c13_train3);mean(c14_train3);mean(c15_train3);mean(c16_train3);mean(c17_train3);mean(c18_train3);mean(c19_train3);mean(c20_train3);
		   mean(c21_train3);mean(c22_train3);mean(c23_train3);mean(c24_train3);mean(c25_train3);mean(c26_train3);mean(c27_train3);mean(c28_train3);mean(c29_train3);mean(c30_train3);
		   mean(c31_train3);mean(c32_train3);mean(c33_train3);mean(c34_train3);mean(c35_train3);mean(c36_train3);mean(c37_train3);mean(c38_train3);mean(c39_train3);mean(c40_train3)];
       
Sw3_lda=(double(train3_lda)-mean3_lda(c3train_lda,:))'*(double(train3_lda)-mean3_lda(c3train_lda,:));
Sb3_lda=(ones(40,1)*meantotal_train3_lda-mean3_lda)'*(ones(40,1)*meantotal_train3_lda-mean3_lda);

 [V3_lda,D3_lda]=eig(Sw3_lda\Sb3_lda);
[D3_lda, o2] = sort(diag(D3_lda), 'descend');
V3_lda = V3_lda(:,o2);

 Ztrain3_lda=bsxfun(@minus,double(train3_lda),meantotal_train3_lda);
 Ztest3_lda=bsxfun(@minus,double(test3_lda),meantotal_test3_lda);
 
 Etrain3_lda=V3_lda(1:end,1:39);
 
 Ytrain3_red=Etrain3_lda.'*Ztrain3_lda.';
 Ytest3_red=Etrain3_lda.'*Ztest3_lda.';

k=1;
for i=1:80
    for j=1:320
        diff3_lda(:,k)=Ytrain3_red(1:39,j)-Ytest3_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff3sq_lda(:,i)=power(diff3_lda(:,i),2);
end

dist3_lda=0;
for i=1:25600
    dist3_lda=0;
    for j=1:39
        dist3_lda=dist3_lda+diff3sq_lda(j,i);
    end
    dist3mat_lda(1,i)=sqrt(dist3_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist3mat_lda(1,i:i+319));
    label3pred_lda(1,k)=find(dist3mat_lda==minval);
    k=k+1;
end

 k=1;
 for i=1:320:25600
     for j=0:7
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=1;
         end
     end
     for j=8:15
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=2;
         end
     end
     for j=16:23
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=3;
         end
     end 
     for j=24:31
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=4;
         end
     end
     for j=32:39
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=5;
         end
     end
     for j=40:47
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=6;
         end
     end
     for j=48:55
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=7;
         end
     end
     for j=56:63
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=8;
         end
     end
     for j=64:71
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=9;
         end
     end
     for j=72:79
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=10;
         end
     end
     
     for j=80:87
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=11;
         end
     end
     for j=88:95
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=12;
         end
     end
     for j=96:103
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=13;
         end
     end 
     for j=104:111
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=14;
         end
     end
     for j=112:120
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=15;
         end
     end
     for j=121:127
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=16;
         end
     end
     for j=128:135
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=17;
         end
     end
     for j=136:143
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=18;
         end
     end
     for j=144:151
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=19;
         end
     end
     for j=152:159
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=20;
         end
     end
     
     for j=160:167
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=21;
         end
     end
     for j=168:175
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=22;
         end
     end
     for j=176:183
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=23;
         end
     end 
     for j=184:191
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=24;
         end
     end
     for j=192:199
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=25;
         end
     end
     for j=200:207
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=26;
         end
     end
     for j=208:215
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=27;
         end
     end
     for j=216:223
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=28;
         end
     end
     for j=224:231
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=29;
         end
     end
     for j=232:239
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=30;
         end
     end
     
     for j=240:247
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=31;
         end
     end
     for j=248:255
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=32;
         end
     end
     for j=256:263
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=33;
         end
     end 
     for j=264:271
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=34;
         end
     end
     for j=272:279
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=35;
         end
     end
     for j=280:287
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=36;
         end
     end
     for j=288:295
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=37;
         end
     end
     for j=296:303
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=38;
         end
     end
     for j=304:311
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=39;
         end
     end
     for j=312:319
         if label3pred_lda(1,k)==i+j
             label3pred_lda(1,k)=40;
         end
     end
     k=k+1;
 end

c3test_lda=c3test_lda';

%calculate accuracy for 3rd fold lda
count=0;
for i=1:80
    if c3test_lda(1,i)==label3pred_lda(1,i)
        count=count+1;
    end
end

acc3_lda=count/80*100;

%%4th fold%%%
k=1;
for i=1:10:400
    train4_lda(k:k+7,:)=images_array([i:i+5 i+8:i+9],:); %%similar to X in code
    k=k+8;
end

k=1;
for i=1:10:400
    test4_lda(k:k+1,:)=images_array([i+6:i+7],:);
    k=k+2;
end

%train labels
c4train_lda=[];
for i=1:40
    for j=1:8
        c4train_lda=[c4train_lda;i];
    end
end

%test labels
c4test_lda=[];
for i=1:40
    for j=1:2
        c4test_lda=[c4test_lda;i];
    end
end

c1_train4=train4_lda(find(c4train_lda==1),:);
c2_train4=train4_lda(find(c4train_lda==2),:);
c3_train4=train4_lda(find(c4train_lda==3),:);
c4_train4=train4_lda(find(c4train_lda==4),:);
c5_train4=train4_lda(find(c4train_lda==5),:);
c6_train4=train4_lda(find(c4train_lda==6),:);
c7_train4=train4_lda(find(c4train_lda==7),:);
c8_train4=train4_lda(find(c4train_lda==8),:);
c9_train4=train4_lda(find(c4train_lda==9),:);
c10_train4=train4_lda(find(c4train_lda==10),:);
c11_train4=train4_lda(find(c4train_lda==11),:);
c12_train4=train4_lda(find(c4train_lda==12),:);
c13_train4=train4_lda(find(c4train_lda==13),:);
c14_train4=train4_lda(find(c4train_lda==14),:);
c15_train4=train4_lda(find(c4train_lda==15),:);
c16_train4=train4_lda(find(c4train_lda==16),:);
c17_train4=train4_lda(find(c4train_lda==17),:);
c18_train4=train4_lda(find(c4train_lda==18),:);
c19_train4=train4_lda(find(c4train_lda==19),:);
c20_train4=train4_lda(find(c4train_lda==20),:);
c21_train4=train4_lda(find(c4train_lda==21),:);
c22_train4=train4_lda(find(c4train_lda==22),:);
c23_train4=train4_lda(find(c4train_lda==23),:);
c24_train4=train4_lda(find(c4train_lda==24),:);
c25_train4=train4_lda(find(c4train_lda==25),:);
c26_train4=train4_lda(find(c4train_lda==26),:);
c27_train4=train4_lda(find(c4train_lda==27),:);
c28_train4=train4_lda(find(c4train_lda==28),:);
c29_train4=train4_lda(find(c4train_lda==29),:);
c30_train4=train4_lda(find(c4train_lda==30),:);
c31_train4=train4_lda(find(c4train_lda==31),:);
c32_train4=train4_lda(find(c4train_lda==32),:);
c33_train4=train4_lda(find(c4train_lda==33),:);
c34_train4=train4_lda(find(c4train_lda==34),:);
c35_train4=train4_lda(find(c4train_lda==35),:);
c36_train4=train4_lda(find(c4train_lda==36),:);
c37_train4=train4_lda(find(c4train_lda==37),:);
c38_train4=train4_lda(find(c4train_lda==38),:);
c39_train4=train4_lda(find(c4train_lda==39),:);
c40_train4=train4_lda(find(c4train_lda==40),:);

meantotal_train4_lda=mean(train4_lda);
meantotal_test4_lda=mean(test4_lda);

mean4_lda=[mean(c1_train4);mean(c2_train4);mean(c3_train4);mean(c4_train4);mean(c5_train4);mean(c6_train4);mean(c7_train4);mean(c8_train4);mean(c9_train4);mean(c10_train4);
           mean(c11_train4);mean(c12_train4);mean(c13_train4);mean(c14_train4);mean(c15_train4);mean(c16_train4);mean(c17_train4);mean(c18_train4);mean(c19_train4);mean(c20_train4);
		   mean(c21_train4);mean(c22_train4);mean(c23_train4);mean(c24_train4);mean(c25_train4);mean(c26_train4);mean(c27_train4);mean(c28_train4);mean(c29_train4);mean(c30_train4);
		   mean(c31_train4);mean(c32_train4);mean(c33_train4);mean(c34_train4);mean(c35_train4);mean(c36_train4);mean(c37_train4);mean(c38_train4);mean(c39_train4);mean(c40_train4)];
       
Sw4_lda=(double(train4_lda)-mean4_lda(c4train_lda,:))'*(double(train4_lda)-mean4_lda(c4train_lda,:));
Sb4_lda=(ones(40,1)*meantotal_train4_lda-mean4_lda)'*(ones(40,1)*meantotal_train4_lda-mean4_lda);

[V4_lda,D4_lda]=eig(Sw4_lda\Sb4_lda);
[D4_lda, o3] = sort(diag(D4_lda), 'descend');
V4_lda = V4_lda(:,o3);

 Ztrain4_lda=bsxfun(@minus,double(train4_lda),meantotal_train4_lda);
 Ztest4_lda=bsxfun(@minus,double(test4_lda),meantotal_test4_lda);
 
 Etrain4_lda=V4_lda(1:end,1:39);
 
 Ytrain4_red=Etrain4_lda.'*Ztrain4_lda.';
 Ytest4_red=Etrain4_lda.'*Ztest4_lda.';

k=1;
for i=1:80
    for j=1:320
        diff4_lda(:,k)=Ytrain4_red(1:39,j)-Ytest4_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff4sq_lda(:,i)=power(diff4_lda(:,i),2);
end

dist4_lda=0;
for i=1:25600
    dist4_lda=0;
    for j=1:39
        dist4_lda=dist4_lda+diff4sq_lda(j,i);
    end
    dist4mat_lda(1,i)=sqrt(dist4_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist4mat_lda(1,i:i+319));
    label4pred_lda(1,k)=find(dist4mat_lda==minval);
    k=k+1;
end

 k=1;
 for i=1:320:25600
     for j=0:7
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=1;
         end
     end
     for j=8:15
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=2;
         end
     end
     for j=16:23
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=3;
         end
     end 
     for j=24:31
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=4;
         end
     end
     for j=32:39
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=5;
         end
     end
     for j=40:47
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=6;
         end
     end
     for j=48:55
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=7;
         end
     end
     for j=56:63
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=8;
         end
     end
     for j=64:71
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=9;
         end
     end
     for j=72:79
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=10;
         end
     end
     
     for j=80:87
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=11;
         end
     end
     for j=88:95
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=12;
         end
     end
     for j=96:103
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=13;
         end
     end 
     for j=104:111
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=14;
         end
     end
     for j=112:120
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=15;
         end
     end
     for j=121:127
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=16;
         end
     end
     for j=128:135
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=17;
         end
     end
     for j=136:143
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=18;
         end
     end
     for j=144:151
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=19;
         end
     end
     for j=152:159
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=20;
         end
     end
     
     for j=160:167
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=21;
         end
     end
     for j=168:175
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=22;
         end
     end
     for j=176:183
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=23;
         end
     end 
     for j=184:191
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=24;
         end
     end
     for j=192:199
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=25;
         end
     end
     for j=200:207
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=26;
         end
     end
     for j=208:215
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=27;
         end
     end
     for j=216:223
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=28;
         end
     end
     for j=224:231
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=29;
         end
     end
     for j=232:239
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=30;
         end
     end
     
     for j=240:247
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=31;
         end
     end
     for j=248:255
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=32;
         end
     end
     for j=256:263
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=33;
         end
     end 
     for j=264:271
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=34;
         end
     end
     for j=272:279
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=35;
         end
     end
     for j=280:287
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=36;
         end
     end
     for j=288:295
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=37;
         end
     end
     for j=296:303
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=38;
         end
     end
     for j=304:311
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=39;
         end
     end
     for j=312:319
         if label4pred_lda(1,k)==i+j
             label4pred_lda(1,k)=40;
         end
     end
     k=k+1;
 end

c4test_lda=c4test_lda';

%calculate accuracy for 1st fold lda
count=0;
for i=1:80
    if c4test_lda(1,i)==label4pred_lda(1,i)
        count=count+1;
    end
end

acc4_lda=count/80*100;

%%5th fold%%%
k=1;
for i=1:10:400
    train5_lda(k:k+7,:)=images_array([i:i+7],:); %%similar to X in code
    k=k+8;
end

k=1;
for i=1:10:400
    test5_lda(k:k+1,:)=images_array([i+8:i+9],:);
    k=k+2;
end

%train labels
c5train_lda=[];
for i=1:40
    for j=1:8
        c5train_lda=[c5train_lda;i];
    end
end

%test labels
c5test_lda=[];
for i=1:40
    for j=1:2
        c5test_lda=[c5test_lda;i];
    end
end

c1_train5=train5_lda(find(c5train_lda==1),:);
c2_train5=train5_lda(find(c5train_lda==2),:);
c3_train5=train5_lda(find(c5train_lda==3),:);
c4_train5=train5_lda(find(c5train_lda==4),:);
c5_train5=train5_lda(find(c5train_lda==5),:);
c6_train5=train5_lda(find(c5train_lda==6),:);
c7_train5=train5_lda(find(c5train_lda==7),:);
c8_train5=train5_lda(find(c5train_lda==8),:);
c9_train5=train5_lda(find(c5train_lda==9),:);
c10_train5=train5_lda(find(c5train_lda==10),:);
c11_train5=train5_lda(find(c5train_lda==11),:);
c12_train5=train5_lda(find(c5train_lda==12),:);
c13_train5=train5_lda(find(c5train_lda==13),:);
c14_train5=train5_lda(find(c5train_lda==14),:);
c15_train5=train5_lda(find(c5train_lda==15),:);
c16_train5=train5_lda(find(c5train_lda==16),:);
c17_train5=train5_lda(find(c5train_lda==17),:);
c18_train5=train5_lda(find(c5train_lda==18),:);
c19_train5=train5_lda(find(c5train_lda==19),:);
c20_train5=train5_lda(find(c5train_lda==20),:);
c21_train5=train5_lda(find(c5train_lda==21),:);
c22_train5=train5_lda(find(c5train_lda==22),:);
c23_train5=train5_lda(find(c5train_lda==23),:);
c24_train5=train5_lda(find(c5train_lda==24),:);
c25_train5=train5_lda(find(c5train_lda==25),:);
c26_train5=train5_lda(find(c5train_lda==26),:);
c27_train5=train5_lda(find(c5train_lda==27),:);
c28_train5=train5_lda(find(c5train_lda==28),:);
c29_train5=train5_lda(find(c5train_lda==29),:);
c30_train5=train5_lda(find(c5train_lda==30),:);
c31_train5=train5_lda(find(c5train_lda==31),:);
c32_train5=train5_lda(find(c5train_lda==32),:);
c33_train5=train5_lda(find(c5train_lda==33),:);
c34_train5=train5_lda(find(c5train_lda==34),:);
c35_train5=train5_lda(find(c5train_lda==35),:);
c36_train5=train5_lda(find(c5train_lda==36),:);
c37_train5=train5_lda(find(c5train_lda==37),:);
c38_train5=train5_lda(find(c5train_lda==38),:);
c39_train5=train5_lda(find(c5train_lda==39),:);
c40_train5=train5_lda(find(c5train_lda==40),:);

meantotal_train5_lda=mean(train5_lda);
meantotal_test5_lda=mean(test5_lda);

mean5_lda=[mean(c1_train5);mean(c2_train5);mean(c3_train5);mean(c4_train5);mean(c5_train5);mean(c6_train5);mean(c7_train5);mean(c8_train5);mean(c9_train5);mean(c10_train5);
           mean(c11_train5);mean(c12_train5);mean(c13_train5);mean(c14_train5);mean(c15_train5);mean(c16_train5);mean(c17_train5);mean(c18_train5);mean(c19_train5);mean(c20_train5);
		   mean(c21_train5);mean(c22_train5);mean(c23_train5);mean(c24_train5);mean(c25_train5);mean(c26_train5);mean(c27_train5);mean(c28_train5);mean(c29_train5);mean(c30_train5);
		   mean(c31_train5);mean(c32_train5);mean(c33_train5);mean(c34_train5);mean(c35_train5);mean(c36_train5);mean(c37_train5);mean(c38_train5);mean(c39_train5);mean(c40_train5)];
       
Sw5_lda=(double(train5_lda)-mean5_lda(c5train_lda,:))'*(double(train5_lda)-mean5_lda(c5train_lda,:));
Sb5_lda=(ones(40,1)*meantotal_train5_lda-mean5_lda)'*(ones(40,1)*meantotal_train5_lda-mean5_lda);

 [V5_lda,D5_lda]=eig(Sw5_lda\Sb5_lda);
[D5_lda, o4] = sort(diag(D5_lda), 'descend');
V5_lda = V5_lda(:,o4);

 Ztrain5_lda=bsxfun(@minus,double(train5_lda),meantotal_train5_lda);
 Ztest5_lda=bsxfun(@minus,double(test5_lda),meantotal_test5_lda);
 
 Etrain5_lda=V5_lda(1:end,1:39);
 
 Ytrain5_red=Etrain5_lda.'*Ztrain5_lda.';
 Ytest5_red=Etrain5_lda.'*Ztest5_lda.';

k=1;
for i=1:80
    for j=1:320
        diff5_lda(:,k)=Ytrain5_red(1:39,j)-Ytest5_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff5sq_lda(:,i)=power(diff5_lda(:,i),2);
end

dist5_lda=0;
for i=1:25600
    dist5_lda=0;
    for j=1:39
        dist5_lda=dist5_lda+diff5sq_lda(j,i);
    end
    dist5mat_lda(1,i)=sqrt(dist5_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist5mat_lda(1,i:i+319));
    label5pred_lda(1,k)=find(dist5mat_lda==minval);
    k=k+1;
end

 k=1;
 for i=1:320:25600
     for j=0:7
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=1;
         end
     end
     for j=8:15
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=2;
         end
     end
     for j=16:23
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=3;
         end
     end 
     for j=24:31
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=4;
         end
     end
     for j=32:39
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=5;
         end
     end
     for j=40:47
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=6;
         end
     end
     for j=48:55
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=7;
         end
     end
     for j=56:63
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=8;
         end
     end
     for j=64:71
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=9;
         end
     end
     for j=72:79
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=10;
         end
     end
     
     for j=80:87
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=11;
         end
     end
     for j=88:95
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=12;
         end
     end
     for j=96:103
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=13;
         end
     end 
     for j=104:111
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=14;
         end
     end
     for j=112:120
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=15;
         end
     end
     for j=121:127
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=16;
         end
     end
     for j=128:135
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=17;
         end
     end
     for j=136:143
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=18;
         end
     end
     for j=144:151
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=19;
         end
     end
     for j=152:159
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=20;
         end
     end
     
     for j=160:167
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=21;
         end
     end
     for j=168:175
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=22;
         end
     end
     for j=176:183
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=23;
         end
     end 
     for j=184:191
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=24;
         end
     end
     for j=192:199
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=25;
         end
     end
     for j=200:207
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=26;
         end
     end
     for j=208:215
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=27;
         end
     end
     for j=216:223
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=28;
         end
     end
     for j=224:231
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=29;
         end
     end
     for j=232:239
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=30;
         end
     end
     
     for j=240:247
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=31;
         end
     end
     for j=248:255
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=32;
         end
     end
     for j=256:263
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=33;
         end
     end 
     for j=264:271
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=34;
         end
     end
     for j=272:279
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=35;
         end
     end
     for j=280:287
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=36;
         end
     end
     for j=288:295
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=37;
         end
     end
     for j=296:303
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=38;
         end
     end
     for j=304:311
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=39;
         end
     end
     for j=312:319
         if label5pred_lda(1,k)==i+j
             label5pred_lda(1,k)=40;
         end
     end
     k=k+1;
 end

c5test_lda=c5test_lda';

%calculate accuracy for 1st fold lda
count=0;
for i=1:80
    if c5test_lda(1,i)==label5pred_lda(1,i)
        count=count+1;
    end
end

acc5_lda=count/80*100;

knnaccu_lda=(acc1_lda+acc2_lda+acc3_lda+acc4_lda+acc5_lda)/5;

hold on;
for i=10304:-1:1
    plot(i,D1(i,i),'*')
end
hold off;




%%4th question..PCA then LDA%%%

%1st fold

j=1;
k=2;
for i=1:10:400
    test1(j:k,:)=images_array(i:i+1,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train1(j:k,:)=images_array(i+2:i+9,:);
    j=j+8;
    k=k+8;
end

u_train_1=mean(train1); % calculate mean of train data
Z_train_1= double(train1) - repmat(u_train_1,320,1);
u_test_1=mean(test1); % calculate mean of test data
Z_test_1= double(test1) - repmat(u_test_1,80,1);
 S1=319*cov(Z_train_1);
 [V1,D1]=eig(S1);

 for i=1:10304
     for j=10304:-1:9985
         E1(i,abs(j-10305))=V1(i,j); %top 320 eigenvectors corresponfing to top 320 eigenvalues
     end
 end

 train1_red=E1'*Z_train_1';
 test1_red=E1'*Z_test_1';
train1_redt=train1_red';
test1_redt=test1_red';

train1_lda=train1_redt; %%similar to X in code
test1_lda=test1_redt;

%train labels
c1train_lda=[];
for i=1:40
    for j=1:8
        c1train_lda=[c1train_lda;i];
    end
end

%test labels
c1test_lda=[];
for i=1:40
    for j=1:2
        c1test_lda=[c1test_lda;i];
    end
end

c1_train1=train1_lda(find(c1train_lda==1),:);
c2_train1=train1_lda(find(c1train_lda==2),:);
c3_train1=train1_lda(find(c1train_lda==3),:);
c4_train1=train1_lda(find(c1train_lda==4),:);
c5_train1=train1_lda(find(c1train_lda==5),:);
c6_train1=train1_lda(find(c1train_lda==6),:);
c7_train1=train1_lda(find(c1train_lda==7),:);
c8_train1=train1_lda(find(c1train_lda==8),:);
c9_train1=train1_lda(find(c1train_lda==9),:);
c10_train1=train1_lda(find(c1train_lda==10),:);
c11_train1=train1_lda(find(c1train_lda==11),:);
c12_train1=train1_lda(find(c1train_lda==12),:);
c13_train1=train1_lda(find(c1train_lda==13),:);
c14_train1=train1_lda(find(c1train_lda==14),:);
c15_train1=train1_lda(find(c1train_lda==15),:);
c16_train1=train1_lda(find(c1train_lda==16),:);
c17_train1=train1_lda(find(c1train_lda==17),:);
c18_train1=train1_lda(find(c1train_lda==18),:);
c19_train1=train1_lda(find(c1train_lda==19),:);
c20_train1=train1_lda(find(c1train_lda==20),:);
c21_train1=train1_lda(find(c1train_lda==21),:);
c22_train1=train1_lda(find(c1train_lda==22),:);
c23_train1=train1_lda(find(c1train_lda==23),:);
c24_train1=train1_lda(find(c1train_lda==24),:);
c25_train1=train1_lda(find(c1train_lda==25),:);
c26_train1=train1_lda(find(c1train_lda==26),:);
c27_train1=train1_lda(find(c1train_lda==27),:);
c28_train1=train1_lda(find(c1train_lda==28),:);
c29_train1=train1_lda(find(c1train_lda==29),:);
c30_train1=train1_lda(find(c1train_lda==30),:);
c31_train1=train1_lda(find(c1train_lda==31),:);
c32_train1=train1_lda(find(c1train_lda==32),:);
c33_train1=train1_lda(find(c1train_lda==33),:);
c34_train1=train1_lda(find(c1train_lda==34),:);
c35_train1=train1_lda(find(c1train_lda==35),:);
c36_train1=train1_lda(find(c1train_lda==36),:);
c37_train1=train1_lda(find(c1train_lda==37),:);
c38_train1=train1_lda(find(c1train_lda==38),:);
c39_train1=train1_lda(find(c1train_lda==39),:);
c40_train1=train1_lda(find(c1train_lda==40),:);

meantotal_train1_lda=mean(train1_lda);
meantotal_test1_lda=mean(test1_lda);

mean1_lda=[mean(c1_train1);mean(c2_train1);mean(c3_train1);mean(c4_train1);mean(c5_train1);mean(c6_train1);mean(c7_train1);mean(c8_train1);mean(c9_train1);mean(c10_train1);
           mean(c11_train1);mean(c12_train1);mean(c13_train1);mean(c14_train1);mean(c15_train1);mean(c16_train1);mean(c17_train1);mean(c18_train1);mean(c19_train1);mean(c20_train1);
		   mean(c21_train1);mean(c22_train1);mean(c23_train1);mean(c24_train1);mean(c25_train1);mean(c26_train1);mean(c27_train1);mean(c28_train1);mean(c29_train1);mean(c30_train1);
		   mean(c31_train1);mean(c32_train1);mean(c33_train1);mean(c34_train1);mean(c35_train1);mean(c36_train1);mean(c37_train1);mean(c38_train1);mean(c39_train1);mean(c40_train1)];
       
Sw1_lda=(double(train1_lda)-mean1_lda(c1train_lda,:))'*(double(train1_lda)-mean1_lda(c1train_lda,:));
Sb1_lda=(ones(40,1)*meantotal_train1_lda-mean1_lda)'*(ones(40,1)*meantotal_train1_lda-mean1_lda);

[V1_lda,D1_lda]=eig(Sw1_lda\Sb1_lda);
[D1_lda, oo] = sort(diag(D1_lda), 'descend');
V1_lda = V1_lda(:,oo);

Ztrain1_lda=bsxfun(@minus,double(train1_lda),meantotal_train1_lda);
Ztest1_lda=bsxfun(@minus,double(test1_lda),meantotal_test1_lda);

 Etrain1_lda=V1_lda(1:end,1:39);

 Ytrain1_red=Etrain1_lda.'*Ztrain1_lda.';
 Ytest1_red=Etrain1_lda.'*Ztest1_lda.';

k=1;
for i=1:80
    for j=1:320
        diff1_lda(:,k)=Ytrain1_red(1:39,j)-Ytest1_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff1sq_lda(:,i)=power(diff1_lda(:,i),2);
end

dist1_lda=0;
for i=1:25600
    dist1_lda=0;
    for j=1:39
        dist1_lda=dist1_lda+diff1sq_lda(j,i);
    end
    dist1mat_lda(1,i)=sqrt(dist1_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist1mat_lda(1,i:i+319));
    label1pred_lda(1,k)=find(dist1mat_lda==minval);
    k=k+1;
end
% 
 k=1;
 for i=1:320:25600
     for j=0:7
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=1;
         end
     end
     for j=8:15
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=2;
         end
     end
     for j=16:23
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=3;
         end
     end 
     for j=24:31
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=4;
         end
     end
     for j=32:39
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=5;
         end
     end
     for j=40:47
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=6;
         end
     end
     for j=48:55
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=7;
         end
     end
     for j=56:63
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=8;
         end
     end
     for j=64:71
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=9;
         end
     end
     for j=72:79
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=10;
         end
     end
     
     for j=80:87
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=11;
         end
     end
     for j=88:95
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=12;
         end
     end
     for j=96:103
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=13;
         end
     end 
     for j=104:111
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=14;
         end
     end
     for j=112:120
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=15;
         end
     end
     for j=121:127
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=16;
         end
     end
     for j=128:135
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=17;
         end
     end
     for j=136:143
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=18;
         end
     end
     for j=144:151
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=19;
         end
     end
     for j=152:159
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=20;
         end
     end
     
     for j=160:167
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=21;
         end
     end
     for j=168:175
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=22;
         end
     end
     for j=176:183
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=23;
         end
     end 
     for j=184:191
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=24;
         end
     end
     for j=192:199
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=25;
         end
     end
     for j=200:207
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=26;
         end
     end
     for j=208:215
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=27;
         end
     end
     for j=216:223
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=28;
         end
     end
     for j=224:231
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=29;
         end
     end
     for j=232:239
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=30;
         end
     end
     
     for j=240:247
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=31;
         end
     end
     for j=248:255
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=32;
         end
     end
     for j=256:263
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=33;
         end
     end 
     for j=264:271
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=34;
         end
     end
     for j=272:279
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=35;
         end
     end
     for j=280:287
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=36;
         end
     end
     for j=288:295
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=37;
         end
     end
     for j=296:303
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=38;
         end
     end
     for j=304:311
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=39;
         end
     end
     for j=312:319
         if label1pred_lda(1,k)==i+j
             label1pred_lda(1,k)=40;
         end
     end
     k=k+1;
 end
 
c1test_lda=c1test_lda';

%calculate accuracy for 1st fold lda
count=0;
for i=1:80
    if c1test_lda(1,i)==label1pred_lda(1,i)
        count=count+1;
    end
end

acc1_pcalda=count/80*100;

2nd fold pca lda

j=1;
k=2;
for i=1:10:400
    test2(j:k,:)=images_array(i+2:i+3,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train2(j:k,:)=images_array([i:i+1 i+4:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_2=mean(train2); % calculate mean of train data
Z_train_2= double(train2) - repmat(u_train_2,320,1);
u_test_2=mean(test2); % calculate mean of test data
Z_test_2= double(test2) - repmat(u_test_2,80,1);
S2=319*cov(Z_train_2);
[V2,D2]=eig(S2);

 for i=1:10304
     for j=10304:-1:9985
         E2(i,abs(j-10305))=V2(i,j); %top 320 eigenvectors corresponfing to top 320 eigenvalues
     end
 end
 
 train2_red=E2'*Z_train_2';
 test2_red=E2'*Z_test_2';
train2_redt=train2_red';
test2_redt=test2_red';

train2_lda=train2_redt; %%similar to X in code
test2_lda=test2_redt;

%train labels
c2train_lda=[];
for i=1:40
    for j=1:8
        c2train_lda=[c2train_lda;i];
    end
end

%test labels
c2test_lda=[];
for i=1:40
    for j=1:2
        c2test_lda=[c2test_lda;i];
    end
end

c1_train2=train2_lda(find(c2train_lda==1),:);
c2_train2=train2_lda(find(c2train_lda==2),:);
c3_train2=train2_lda(find(c2train_lda==3),:);
c4_train2=train2_lda(find(c2train_lda==4),:);
c5_train2=train2_lda(find(c2train_lda==5),:);
c6_train2=train2_lda(find(c2train_lda==6),:);
c7_train2=train2_lda(find(c2train_lda==7),:);
c8_train2=train2_lda(find(c2train_lda==8),:);
c9_train2=train2_lda(find(c2train_lda==9),:);
c10_train2=train2_lda(find(c2train_lda==10),:);
c11_train2=train2_lda(find(c2train_lda==11),:);
c12_train2=train2_lda(find(c2train_lda==12),:);
c13_train2=train2_lda(find(c2train_lda==13),:);
c14_train2=train2_lda(find(c2train_lda==14),:);
c15_train2=train2_lda(find(c2train_lda==15),:);
c16_train2=train2_lda(find(c2train_lda==16),:);
c17_train2=train2_lda(find(c2train_lda==17),:);
c18_train2=train2_lda(find(c2train_lda==18),:);
c19_train2=train2_lda(find(c2train_lda==19),:);
c20_train2=train2_lda(find(c2train_lda==20),:);
c21_train2=train2_lda(find(c2train_lda==21),:);
c22_train2=train2_lda(find(c2train_lda==22),:);
c23_train2=train2_lda(find(c2train_lda==23),:);
c24_train2=train2_lda(find(c2train_lda==24),:);
c25_train2=train2_lda(find(c2train_lda==25),:);
c26_train2=train2_lda(find(c2train_lda==26),:);
c27_train2=train2_lda(find(c2train_lda==27),:);
c28_train2=train2_lda(find(c2train_lda==28),:);
c29_train2=train2_lda(find(c2train_lda==29),:);
c30_train2=train2_lda(find(c2train_lda==30),:);
c31_train2=train2_lda(find(c2train_lda==31),:);
c32_train2=train2_lda(find(c2train_lda==32),:);
c33_train2=train2_lda(find(c2train_lda==33),:);
c34_train2=train2_lda(find(c2train_lda==34),:);
c35_train2=train2_lda(find(c2train_lda==35),:);
c36_train2=train2_lda(find(c2train_lda==36),:);
c37_train2=train2_lda(find(c2train_lda==37),:);
c38_train2=train2_lda(find(c2train_lda==38),:);
c39_train2=train2_lda(find(c2train_lda==39),:);
c40_train2=train2_lda(find(c2train_lda==40),:);


meantotal_train2_lda=mean(train2_lda);
meantotal_test2_lda=mean(test2_lda);

mean2_lda=[mean(c1_train2);mean(c2_train2);mean(c3_train2);mean(c4_train2);mean(c5_train2);mean(c6_train2);mean(c7_train2);mean(c8_train2);mean(c9_train2);mean(c10_train2);
           mean(c11_train2);mean(c12_train2);mean(c13_train2);mean(c14_train2);mean(c15_train2);mean(c16_train2);mean(c17_train2);mean(c18_train2);mean(c19_train2);mean(c20_train2);
		   mean(c21_train2);mean(c22_train2);mean(c23_train2);mean(c24_train2);mean(c25_train2);mean(c26_train2);mean(c27_train2);mean(c28_train2);mean(c29_train2);mean(c30_train2);
		   mean(c31_train2);mean(c32_train2);mean(c33_train2);mean(c34_train2);mean(c35_train2);mean(c36_train2);mean(c37_train2);mean(c38_train2);mean(c39_train2);mean(c40_train2)];

Sw2_lda=(double(train2_lda)-mean2_lda(c2train_lda,:))'*(double(train2_lda)-mean2_lda(c2train_lda,:));
Sb2_lda=(ones(40,1)*meantotal_train2_lda-mean2_lda)'*(ones(40,1)*meantotal_train2_lda-mean2_lda);

[V2_lda,D2_lda]=eig(Sw2_lda\Sb2_lda);
[D2_lda, oo1] = sort(diag(D2_lda), 'descend');
V2_lda = V2_lda(:,oo1);

Ztrain2_lda=bsxfun(@minus,double(train2_lda),meantotal_train2_lda);
Ztest2_lda=bsxfun(@minus,double(test2_lda),meantotal_test2_lda);

Etrain2_lda=V2_lda(1:end,1:39);
Ytrain2_red=Etrain2_lda.'*Ztrain2_lda.';
Ytest2_red=Etrain2_lda.'*Ztest2_lda.';

k=1;
for i=1:80
    for j=1:320
        diff2_lda(:,k)=Ytrain2_red(1:39,j)-Ytest2_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff2sq_lda(:,i)=power(diff2_lda(:,i),2);
end

dist2_lda=0;
for i=1:25600
    dist2_lda=0;
    for j=1:39
        dist2_lda=dist2_lda+diff2sq_lda(j,i);
    end
    dist2mat_lda(1,i)=sqrt(dist2_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist2mat_lda(1,i:i+319));
    label2pred_lda(1,k)=find(dist2mat_lda==minval);
    k=k+1;
end

 k=1;
 for i=1:320:25600
     for j=0:7
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=1;
         end
     end
     for j=8:15
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=2;
         end
     end
     for j=16:23
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=3;
         end
     end 
     for j=24:31
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=4;
         end
     end
     for j=32:39
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=5;
         end
     end
     for j=40:47
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=6;
         end
     end
     for j=48:55
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=7;
         end
     end
     for j=56:63
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=8;
         end
     end
     for j=64:71
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=9;
         end
     end
     for j=72:79
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=10;
         end
     end
     
     for j=80:87
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=11;
         end
     end
     for j=88:95
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=12;
         end
     end
     for j=96:103
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=13;
         end
     end 
     for j=104:111
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=14;
         end
     end
     for j=112:120
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=15;
         end
     end
     for j=121:127
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=16;
         end
     end
     for j=128:135
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=17;
         end
     end
     for j=136:143
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=18;
         end
     end
     for j=144:151
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=19;
         end
     end
     for j=152:159
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=20;
         end
     end
     
     for j=160:167
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=21;
         end
     end
     for j=168:175
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=22;
         end
     end
     for j=176:183
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=23;
         end
     end 
     for j=184:191
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=24;
         end
     end
     for j=192:199
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=25;
         end
     end
     for j=200:207
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=26;
         end
     end
     for j=208:215
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=27;
         end
     end
     for j=216:223
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=28;
         end
     end
     for j=224:231
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=29;
         end
     end
     for j=232:239
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=30;
         end
     end
     
     for j=240:247
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=31;
         end
     end
     for j=248:255
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=32;
         end
     end
     for j=256:263
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=33;
         end
     end 
     for j=264:271
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=34;
         end
     end
     for j=272:279
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=35;
         end
     end
     for j=280:287
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=36;
         end
     end
     for j=288:295
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=37;
         end
     end
     for j=296:303
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=38;
         end
     end
     for j=304:311
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=39;
         end
     end
     for j=312:319
         if label2pred_lda(1,k)==i+j
             label2pred_lda(1,k)=40;
         end
     end
     k=k+1;
 end
 
c2test_lda=c2test_lda';

%calculate accuracy for 2nd fold lda
count=0;
for i=1:80
    if c2test_lda(1,i)==label2pred_lda(1,i)
        count=count+1;
    end
end

acc2_pcalda=count/80*100;

3rd fold
j=1;
k=2;
for i=1:10:400
    test3(j:k,:)=images_array(i+4:i+5,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train3(j:k,:)=images_array([i:i+3 i+6:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_3=mean(train3); % calculate mean of train data
Z_train_3= double(train3) - repmat(u_train_3,320,1);
u_test_3=mean(test3); % calculate mean of test data
Z_test_3= double(test3) - repmat(u_test_3,80,1);
S3=319*cov(Z_train_3);
[V3,D3]=eig(S3);


 for i=1:10304
     for j=10304:-1:9985
         E3(i,abs(j-10305))=V3(i,j); %top 320 eigenvectors corresponfing to top 320 eigenvalues
     end
 end
 
train3_red=E3'*Z_train_3';
test3_red=E3'*Z_test_3';
train3_redt=train3_red';
test3_redt=test3_red';

train3_lda=train3_redt; %%similar to X in code
test3_lda=test3_redt;

%train labels
c3train_lda=[];
for i=1:40
    for j=1:8
        c3train_lda=[c3train_lda;i];
    end
end

%test labels
c3test_lda=[];
for i=1:40
    for j=1:2
        c3test_lda=[c3test_lda;i];
    end
end

c1_train3=train3_lda(find(c3train_lda==1),:);
c2_train3=train3_lda(find(c3train_lda==2),:);
c3_train3=train3_lda(find(c3train_lda==3),:);
c4_train3=train3_lda(find(c3train_lda==4),:);
c5_train3=train3_lda(find(c3train_lda==5),:);
c6_train3=train3_lda(find(c3train_lda==6),:);
c7_train3=train3_lda(find(c3train_lda==7),:);
c8_train3=train3_lda(find(c3train_lda==8),:);
c9_train3=train3_lda(find(c3train_lda==9),:);
c10_train3=train3_lda(find(c3train_lda==10),:);
c11_train3=train3_lda(find(c3train_lda==11),:);
c12_train3=train3_lda(find(c3train_lda==12),:);
c13_train3=train3_lda(find(c3train_lda==13),:);
c14_train3=train3_lda(find(c3train_lda==14),:);
c15_train3=train3_lda(find(c3train_lda==15),:);
c16_train3=train3_lda(find(c3train_lda==16),:);
c17_train3=train3_lda(find(c3train_lda==17),:);
c18_train3=train3_lda(find(c3train_lda==18),:);
c19_train3=train3_lda(find(c3train_lda==19),:);
c20_train3=train3_lda(find(c3train_lda==20),:);
c21_train3=train3_lda(find(c3train_lda==21),:);
c22_train3=train3_lda(find(c3train_lda==22),:);
c23_train3=train3_lda(find(c3train_lda==23),:);
c24_train3=train3_lda(find(c3train_lda==24),:);
c25_train3=train3_lda(find(c3train_lda==25),:);
c26_train3=train3_lda(find(c3train_lda==26),:);
c27_train3=train3_lda(find(c3train_lda==27),:);
c28_train3=train3_lda(find(c3train_lda==28),:);
c29_train3=train3_lda(find(c3train_lda==29),:);
c30_train3=train3_lda(find(c3train_lda==30),:);
c31_train3=train3_lda(find(c3train_lda==31),:);
c32_train3=train3_lda(find(c3train_lda==32),:);
c33_train3=train3_lda(find(c3train_lda==33),:);
c34_train3=train3_lda(find(c3train_lda==34),:);
c35_train3=train3_lda(find(c3train_lda==35),:);
c36_train3=train3_lda(find(c3train_lda==36),:);
c37_train3=train3_lda(find(c3train_lda==37),:);
c38_train3=train3_lda(find(c3train_lda==38),:);
c39_train3=train3_lda(find(c3train_lda==39),:);
c40_train3=train3_lda(find(c3train_lda==40),:);

meantotal_train3_lda=mean(train3_lda);
meantotal_test3_lda=mean(test3_lda);

mean3_lda=[mean(c1_train3);mean(c2_train3);mean(c3_train3);mean(c4_train3);mean(c5_train3);mean(c6_train3);mean(c7_train3);mean(c8_train3);mean(c9_train3);mean(c10_train3);
           mean(c11_train3);mean(c12_train3);mean(c13_train3);mean(c14_train3);mean(c15_train3);mean(c16_train3);mean(c17_train3);mean(c18_train3);mean(c19_train3);mean(c20_train3);
		   mean(c21_train3);mean(c22_train3);mean(c23_train3);mean(c24_train3);mean(c25_train3);mean(c26_train3);mean(c27_train3);mean(c28_train3);mean(c29_train3);mean(c30_train3);
		   mean(c31_train3);mean(c32_train3);mean(c33_train3);mean(c34_train3);mean(c35_train3);mean(c36_train3);mean(c37_train3);mean(c38_train3);mean(c39_train3);mean(c40_train3)];
       
Sw3_lda=(double(train3_lda)-mean3_lda(c3train_lda,:))'*(double(train3_lda)-mean3_lda(c3train_lda,:));
Sb3_lda=(ones(40,1)*meantotal_train3_lda-mean3_lda)'*(ones(40,1)*meantotal_train3_lda-mean3_lda);

[V3_lda,D3_lda]=eig(Sw3_lda\Sb3_lda);
[D3_lda, oo2] = sort(diag(D3_lda), 'descend');
V3_lda = V3_lda(:,oo2);

 Ztrain3_lda=bsxfun(@minus,double(train3_lda),meantotal_train3_lda);
 Ztest3_lda=bsxfun(@minus,double(test3_lda),meantotal_test3_lda);
 
 Etrain3_lda=V3_lda(1:end,1:39);
 
 Ytrain3_red=Etrain3_lda.'*Ztrain3_lda.';
 Ytest3_red=Etrain3_lda.'*Ztest3_lda.';

k=1;
for i=1:80
    for j=1:320
        diff3_lda(:,k)=Ytrain3_red(1:39,j)-Ytest3_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff3sq_lda(:,i)=power(diff3_lda(:,i),2);
end

dist3_lda=0;
for i=1:25600
    dist3_lda=0;
    for j=1:39
        dist3_lda=dist3_lda+diff3sq_lda(j,i);
    end
    dist3mat_lda(1,i)=sqrt(dist3_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist3mat_lda(1,i:i+319));
    label3pred_lda(1,k)=find(dist3mat_lda==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=1;
        end
    end
    for j=8:15
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=2;
        end
    end
    for j=16:23
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=3;
        end
    end 
    for j=24:31
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=4;
        end
    end
    for j=32:39
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=5;
        end
    end
    for j=40:47
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=6;
        end
    end
    for j=48:55
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=7;
        end
    end
    for j=56:63
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=8;
        end
    end
    for j=64:71
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=9;
        end
    end
    for j=72:79
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=10;
        end
    end
    
    for j=80:87
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=11;
        end
    end
    for j=88:95
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=12;
        end
    end
    for j=96:103
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=13;
        end
    end 
    for j=104:111
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=14;
        end
    end
    for j=112:120
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=15;
        end
    end
    for j=121:127
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=16;
        end
    end
    for j=128:135
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=17;
        end
    end
    for j=136:143
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=18;
        end
    end
    for j=144:151
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=19;
        end
    end
    for j=152:159
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=20;
        end
    end
    
    for j=160:167
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=21;
        end
    end
    for j=168:175
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=22;
        end
    end
    for j=176:183
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=23;
        end
    end 
    for j=184:191
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=24;
        end
    end
    for j=192:199
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=25;
        end
    end
    for j=200:207
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=26;
        end
    end
    for j=208:215
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=27;
        end
    end
    for j=216:223
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=28;
        end
    end
    for j=224:231
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=29;
        end
    end
    for j=232:239
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=30;
        end
    end
    
    for j=240:247
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=31;
        end
    end
    for j=248:255
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=32;
        end
    end
    for j=256:263
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=33;
        end
    end 
    for j=264:271
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=34;
        end
    end
    for j=272:279
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=35;
        end
    end
    for j=280:287
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=36;
        end
    end
    for j=288:295
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=37;
        end
    end
    for j=296:303
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=38;
        end
    end
    for j=304:311
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=39;
        end
    end
    for j=312:319
        if label3pred_lda(1,k)==i+j
            label3pred_lda(1,k)=40;
        end
    end
    k=k+1;
end

c3test_lda=c3test_lda';

%calculate accuracy for 3rd fold lda
count=0;
for i=1:80
    if c3test_lda(1,i)==label3pred_lda(1,i)
        count=count+1;
    end
end

acc3_pcalda=count/80*100;

4th fold
j=1;
k=2;
for i=1:10:400
    test4(j:k,:)=images_array(i+6:i+7,:);
    j=j+2;
    k=k+2;
end   
    
remaining is train data
j=1;
k=8;
for i=1:10:400
    train4(j:k,:)=images_array([i:i+5 i+8:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_4=mean(train4); % calculate mean of train data
Z_train_4= double(train4) - repmat(u_train_4,320,1);
u_test_4=mean(test4); % calculate mean of test data
Z_test_4= double(test4) - repmat(u_test_4,80,1);
S4=319*cov(Z_train_4);
[V4,D4]=eig(S4);

for i=1:10304
    for j=10304:-1:9985
         E4(i,abs(j-10305))=V4(i,j); %top 320 eigenvectors corresponfing to top 320 eigenvalues
    end
end

train4_red=E4'*Z_train_4';
test4_red=E4'*Z_test_4';
train4_redt=train4_red';
test4_redt=test4_red';

train4_lda=train4_redt; %%similar to X in code
test4_lda=test4_redt;

%train labels
c4train_lda=[];
for i=1:40
    for j=1:8
        c4train_lda=[c4train_lda;i];
    end
end

%test labels
c4test_lda=[];
for i=1:40
    for j=1:2
        c4test_lda=[c4test_lda;i];
    end
end

c1_train4=train4_lda(find(c4train_lda==1),:);
c2_train4=train4_lda(find(c4train_lda==2),:);
c3_train4=train4_lda(find(c4train_lda==3),:);
c4_train4=train4_lda(find(c4train_lda==4),:);
c5_train4=train4_lda(find(c4train_lda==5),:);
c6_train4=train4_lda(find(c4train_lda==6),:);
c7_train4=train4_lda(find(c4train_lda==7),:);
c8_train4=train4_lda(find(c4train_lda==8),:);
c9_train4=train4_lda(find(c4train_lda==9),:);
c10_train4=train4_lda(find(c4train_lda==10),:);
c11_train4=train4_lda(find(c4train_lda==11),:);
c12_train4=train4_lda(find(c4train_lda==12),:);
c13_train4=train4_lda(find(c4train_lda==13),:);
c14_train4=train4_lda(find(c4train_lda==14),:);
c15_train4=train4_lda(find(c4train_lda==15),:);
c16_train4=train4_lda(find(c4train_lda==16),:);
c17_train4=train4_lda(find(c4train_lda==17),:);
c18_train4=train4_lda(find(c4train_lda==18),:);
c19_train4=train4_lda(find(c4train_lda==19),:);
c20_train4=train4_lda(find(c4train_lda==20),:);
c21_train4=train4_lda(find(c4train_lda==21),:);
c22_train4=train4_lda(find(c4train_lda==22),:);
c23_train4=train4_lda(find(c4train_lda==23),:);
c24_train4=train4_lda(find(c4train_lda==24),:);
c25_train4=train4_lda(find(c4train_lda==25),:);
c26_train4=train4_lda(find(c4train_lda==26),:);
c27_train4=train4_lda(find(c4train_lda==27),:);
c28_train4=train4_lda(find(c4train_lda==28),:);
c29_train4=train4_lda(find(c4train_lda==29),:);
c30_train4=train4_lda(find(c4train_lda==30),:);
c31_train4=train4_lda(find(c4train_lda==31),:);
c32_train4=train4_lda(find(c4train_lda==32),:);
c33_train4=train4_lda(find(c4train_lda==33),:);
c34_train4=train4_lda(find(c4train_lda==34),:);
c35_train4=train4_lda(find(c4train_lda==35),:);
c36_train4=train4_lda(find(c4train_lda==36),:);
c37_train4=train4_lda(find(c4train_lda==37),:);
c38_train4=train4_lda(find(c4train_lda==38),:);
c39_train4=train4_lda(find(c4train_lda==39),:);
c40_train4=train4_lda(find(c4train_lda==40),:);

meantotal_train4_lda=mean(train4_lda);
meantotal_test4_lda=mean(test4_lda);

mean4_lda=[mean(c1_train4);mean(c2_train4);mean(c3_train4);mean(c4_train4);mean(c5_train4);mean(c6_train4);mean(c7_train4);mean(c8_train4);mean(c9_train4);mean(c10_train4);
           mean(c11_train4);mean(c12_train4);mean(c13_train4);mean(c14_train4);mean(c15_train4);mean(c16_train4);mean(c17_train4);mean(c18_train4);mean(c19_train4);mean(c20_train4);
		   mean(c21_train4);mean(c22_train4);mean(c23_train4);mean(c24_train4);mean(c25_train4);mean(c26_train4);mean(c27_train4);mean(c28_train4);mean(c29_train4);mean(c30_train4);
		   mean(c31_train4);mean(c32_train4);mean(c33_train4);mean(c34_train4);mean(c35_train4);mean(c36_train4);mean(c37_train4);mean(c38_train4);mean(c39_train4);mean(c40_train4)];
       
Sw4_lda=(double(train4_lda)-mean4_lda(c4train_lda,:))'*(double(train4_lda)-mean4_lda(c4train_lda,:));
Sb4_lda=(ones(40,1)*meantotal_train4_lda-mean4_lda)'*(ones(40,1)*meantotal_train4_lda-mean4_lda);

[V4_lda,D4_lda]=eig(Sw4_lda\Sb4_lda);
[D4_lda, oo3] = sort(diag(D4_lda), 'descend');
V4_lda = V4_lda(:,oo3);

 Ztrain4_lda=bsxfun(@minus,double(train4_lda),meantotal_train4_lda);
 Ztest4_lda=bsxfun(@minus,double(test4_lda),meantotal_test4_lda);
 
 Etrain4_lda=V4_lda(1:end,1:39);
 Ytrain4_red=Etrain4_lda.'*Ztrain4_lda.';
 Ytest4_red=Etrain4_lda.'*Ztest4_lda.';
k=1;
for i=1:80
    for j=1:320
        diff4_lda(:,k)=Ytrain4_red(1:39,j)-Ytest4_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff4sq_lda(:,i)=power(diff4_lda(:,i),2);
end

dist4_lda=0;
for i=1:25600
    dist4_lda=0;
    for j=1:39
        dist4_lda=dist4_lda+diff4sq_lda(j,i);
    end
    dist4mat_lda(1,i)=sqrt(dist4_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist4mat_lda(1,i:i+319));
    label4pred_lda(1,k)=find(dist4mat_lda==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=1;
        end
    end
    for j=8:15
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=2;
        end
    end
    for j=16:23
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=3;
        end
    end 
    for j=24:31
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=4;
        end
    end
    for j=32:39
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=5;
        end
    end
    for j=40:47
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=6;
        end
    end
    for j=48:55
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=7;
        end
    end
    for j=56:63
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=8;
        end
    end
    for j=64:71
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=9;
        end
    end
    for j=72:79
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=10;
        end
    end
    
    for j=80:87
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=11;
        end
    end
    for j=88:95
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=12;
        end
    end
    for j=96:103
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=13;
        end
    end 
    for j=104:111
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=14;
        end
    end
    for j=112:120
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=15;
        end
    end
    for j=121:127
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=16;
        end
    end
    for j=128:135
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=17;
        end
    end
    for j=136:143
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=18;
        end
    end
    for j=144:151
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=19;
        end
    end
    for j=152:159
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=20;
        end
    end
    
    for j=160:167
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=21;
        end
    end
    for j=168:175
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=22;
        end
    end
    for j=176:183
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=23;
        end
    end 
    for j=184:191
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=24;
        end
    end
    for j=192:199
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=25;
        end
    end
    for j=200:207
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=26;
        end
    end
    for j=208:215
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=27;
        end
    end
    for j=216:223
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=28;
        end
    end
    for j=224:231
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=29;
        end
    end
    for j=232:239
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=30;
        end
    end
    
    for j=240:247
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=31;
        end
    end
    for j=248:255
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=32;
        end
    end
    for j=256:263
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=33;
        end
    end 
    for j=264:271
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=34;
        end
    end
    for j=272:279
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=35;
        end
    end
    for j=280:287
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=36;
        end
    end
    for j=288:295
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=37;
        end
    end
    for j=296:303
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=38;
        end
    end
    for j=304:311
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=39;
        end
    end
    for j=312:319
        if label4pred_lda(1,k)==i+j
            label4pred_lda(1,k)=40;
        end
    end
    k=k+1;
end


c4test_lda=c4test_lda';

%calculate accuracy for 4th fold lda
count=0;
for i=1:80
    if c4test_lda(1,i)==label4pred_lda(1,i)
        count=count+1;
    end
end

acc4_pcalda=count/80*100;

5th fold

j=1;
k=2;
for i=1:10:400
    test5(j:k,:)=images_array(i+8:i+9,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train5(j:k,:)=images_array([i:i+7],:);
    j=j+8;
    k=k+8;
end
 
u_train_5=mean(train5); % calculate mean of train data
Z_train_5= double(train5) - repmat(u_train_5,320,1);
u_test_5=mean(test5); % calculate mean of test data
Z_test_5= double(test5) - repmat(u_test_5,80,1);
S5=319*cov(Z_train_5);
[V5,D5]=eig(S5);

for i=1:10304
     for j=10304:-1:9985
         E5(i,abs(j-10305))=V5(i,j); %top 320 eigenvectors corresponfing to top 320 eigenvalues
     end
 end

 train5_red=E5'*Z_train_5';
 test5_red=E5'*Z_test_5';

train5_redt=train5_red';
test5_redt=test5_red';

train5_lda=train5_redt; %%similar to X in code
test5_lda=test5_redt;

%train labels
c5train_lda=[];
for i=1:40
    for j=1:8
        c5train_lda=[c5train_lda;i];
    end
end

%test labels
c5test_lda=[];
for i=1:40
    for j=1:2
        c5test_lda=[c5test_lda;i];
    end
end

c1_train5=train5_lda(find(c5train_lda==1),:);
c2_train5=train5_lda(find(c5train_lda==2),:);
c3_train5=train5_lda(find(c5train_lda==3),:);
c4_train5=train5_lda(find(c5train_lda==4),:);
c5_train5=train5_lda(find(c5train_lda==5),:);
c6_train5=train5_lda(find(c5train_lda==6),:);
c7_train5=train5_lda(find(c5train_lda==7),:);
c8_train5=train5_lda(find(c5train_lda==8),:);
c9_train5=train5_lda(find(c5train_lda==9),:);
c10_train5=train5_lda(find(c5train_lda==10),:);
c11_train5=train5_lda(find(c5train_lda==11),:);
c12_train5=train5_lda(find(c5train_lda==12),:);
c13_train5=train5_lda(find(c5train_lda==13),:);
c14_train5=train5_lda(find(c5train_lda==14),:);
c15_train5=train5_lda(find(c5train_lda==15),:);
c16_train5=train5_lda(find(c5train_lda==16),:);
c17_train5=train5_lda(find(c5train_lda==17),:);
c18_train5=train5_lda(find(c5train_lda==18),:);
c19_train5=train5_lda(find(c5train_lda==19),:);
c20_train5=train5_lda(find(c5train_lda==20),:);
c21_train5=train5_lda(find(c5train_lda==21),:);
c22_train5=train5_lda(find(c5train_lda==22),:);
c23_train5=train5_lda(find(c5train_lda==23),:);
c24_train5=train5_lda(find(c5train_lda==24),:);
c25_train5=train5_lda(find(c5train_lda==25),:);
c26_train5=train5_lda(find(c5train_lda==26),:);
c27_train5=train5_lda(find(c5train_lda==27),:);
c28_train5=train5_lda(find(c5train_lda==28),:);
c29_train5=train5_lda(find(c5train_lda==29),:);
c30_train5=train5_lda(find(c5train_lda==30),:);
c31_train5=train5_lda(find(c5train_lda==31),:);
c32_train5=train5_lda(find(c5train_lda==32),:);
c33_train5=train5_lda(find(c5train_lda==33),:);
c34_train5=train5_lda(find(c5train_lda==34),:);
c35_train5=train5_lda(find(c5train_lda==35),:);
c36_train5=train5_lda(find(c5train_lda==36),:);
c37_train5=train5_lda(find(c5train_lda==37),:);
c38_train5=train5_lda(find(c5train_lda==38),:);
c39_train5=train5_lda(find(c5train_lda==39),:);
c40_train5=train5_lda(find(c5train_lda==40),:);

meantotal_train5_lda=mean(train5_lda);
meantotal_test5_lda=mean(test5_lda);

mean5_lda=[mean(c1_train5);mean(c2_train5);mean(c3_train5);mean(c4_train5);mean(c5_train5);mean(c6_train5);mean(c7_train5);mean(c8_train5);mean(c9_train5);mean(c10_train5);
           mean(c11_train5);mean(c12_train5);mean(c13_train5);mean(c14_train5);mean(c15_train5);mean(c16_train5);mean(c17_train5);mean(c18_train5);mean(c19_train5);mean(c20_train5);
		   mean(c21_train5);mean(c22_train5);mean(c23_train5);mean(c24_train5);mean(c25_train5);mean(c26_train5);mean(c27_train5);mean(c28_train5);mean(c29_train5);mean(c30_train5);
		   mean(c31_train5);mean(c32_train5);mean(c33_train5);mean(c34_train5);mean(c35_train5);mean(c36_train5);mean(c37_train5);mean(c38_train5);mean(c39_train5);mean(c40_train5)];
       
Sw5_lda=(double(train5_lda)-mean5_lda(c5train_lda,:))'*(double(train5_lda)-mean5_lda(c5train_lda,:));
Sb5_lda=(ones(40,1)*meantotal_train5_lda-mean5_lda)'*(ones(40,1)*meantotal_train5_lda-mean5_lda);

 [V5_lda,D5_lda]=eig(Sw5_lda\Sb5_lda);
[D5_lda, oo4] = sort(diag(D5_lda), 'descend');
V5_lda = V5_lda(:,oo4);

 Ztrain5_lda=bsxfun(@minus,double(train5_lda),meantotal_train5_lda);
 Ztest5_lda=bsxfun(@minus,double(test5_lda),meantotal_test5_lda);
 
 Etrain5_lda=V5_lda(1:end,1:39);
 
 Ytrain5_red=Etrain5_lda.'*Ztrain5_lda.';
 Ytest5_red=Etrain5_lda.'*Ztest5_lda.';

k=1;
for i=1:80
    for j=1:320
        diff5_lda(:,k)=Ytrain5_red(1:39,j)-Ytest5_red(1:39,i);
        k=k+1;
    end
end

for i=1:25600
    diff5sq_lda(:,i)=power(diff5_lda(:,i),2);
end

dist5_lda=0;
for i=1:25600
    dist5_lda=0;
    for j=1:39
        dist5_lda=dist5_lda+diff5sq_lda(j,i);
    end
    dist5mat_lda(1,i)=sqrt(dist5_lda); 
end

k=1;
for i=1:320:25600
    minval=min(dist5mat_lda(1,i:i+319));
    label5pred_lda(1,k)=find(dist5mat_lda==minval);
    k=k+1;
end

k=1;
for i=1:320:25600
    for j=0:7
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=1;
        end
    end
    for j=8:15
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=2;
        end
    end
    for j=16:23
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=3;
        end
    end 
    for j=24:31
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=4;
        end
    end
    for j=32:39
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=5;
        end
    end
    for j=40:47
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=6;
        end
    end
    for j=48:55
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=7;
        end
    end
    for j=56:63
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=8;
        end
    end
    for j=64:71
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=9;
        end
    end
    for j=72:79
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=10;
        end
    end
    
    for j=80:87
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=11;
        end
    end
    for j=88:95
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=12;
        end
    end
    for j=96:103
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=13;
        end
    end 
    for j=104:111
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=14;
        end
    end
    for j=112:120
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=15;
        end
    end
    for j=121:127
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=16;
        end
    end
    for j=128:135
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=17;
        end
    end
    for j=136:143
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=18;
        end
    end
    for j=144:151
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=19;
        end
    end
    for j=152:159
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=20;
        end
    end
    
    for j=160:167
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=21;
        end
    end
    for j=168:175
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=22;
        end
    end
    for j=176:183
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=23;
        end
    end 
    for j=184:191
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=24;
        end
    end
    for j=192:199
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=25;
        end
    end
    for j=200:207
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=26;
        end
    end
    for j=208:215
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=27;
        end
    end
    for j=216:223
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=28;
        end
    end
    for j=224:231
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=29;
        end
    end
    for j=232:239
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=30;
        end
    end
    
    for j=240:247
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=31;
        end
    end
    for j=248:255
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=32;
        end
    end
    for j=256:263
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=33;
        end
    end 
    for j=264:271
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=34;
        end
    end
    for j=272:279
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=35;
        end
    end
    for j=280:287
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=36;
        end
    end
    for j=288:295
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=37;
        end
    end
    for j=296:303
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=38;
        end
    end
    for j=304:311
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=39;
        end
    end
    for j=312:319
        if label5pred_lda(1,k)==i+j
            label5pred_lda(1,k)=40;
        end
    end
    k=k+1;
end



c5test_lda=c5test_lda';

%calculate accuracy for 5th fold lda
count=0;
for i=1:80
    if c5test_lda(1,i)==label5pred_lda(1,i)
        count=count+1;
    end
end

acc5_pcalda=count/80*100;

knnacc_pcalda=(acc1_pcalda+acc2_pcalda+acc3_pcalda+acc4_pcalda+acc5_pcalda)/5;

%%%SVM%%%%%

1st fold

k=1;
for i=1:10:400
    train1_svm(k:k+7,:)=images_array([i+2:i+9],:); %similar to X array of SVM
    k=k+8;
end

k=1;
for i=1:10:400
    test1_svm(k:k+1,:)=images_array([i:i+1],:);
    k=k+2;
end

m=1;
for i=1:8:320
    z1_svm=-ones(320,1);
    z1_svm(i:i+7,1)=1;
    H1_svm= (double(train1_svm)*double(train1_svm')).*(z1_svm*z1_svm');
    f1_svm=-ones(320,1);
    A1_svm=-eye(320);
    a1_svm=zeros(320,1);
    B1_svm=[[z1_svm]';[zeros(319,320)]];
    b1_svm=zeros(320,1);
    alpha1_svm=quadprog(H1_svm+eye(320)*0.001,f1_svm,A1_svm,a1_svm,B1_svm,b1_svm);
    w1_svm=(alpha1_svm.*z1_svm)'*double(train1_svm);
    w1all_svm(m,:)=w1_svm;
    wnot1_svm=(1/z1_svm(i,1)) - (w1_svm(1,:)*double(train1_svm(i,:))');
    wnot1all_svm(m,:)=wnot1_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w1all_svm(j,:)*double(test1_svm(i,:))'+wnot1all_svm(j,1);
        rall1(j,i)=r;
    end
 end
 
 %create test labels
test1label_svm=[];
for i=1:40
     for j=1:2
         test1label_svm=[test1label_svm;i];
    end
end


for i=1:80
    [Max1_svm,Index1_svm]=max(rall1);
end
Index1_svmt=Index1_svm';
count=0;
for i=1:80
    if test1label_svm(i)==Index1_svmt(i)
        count=count+1;
    end
end

acc1_svm=count/80*100;

2nd fold

k=1;
for i=1:10:400
    train2_svm(k:k+7,:)=images_array([i:i+1 i+4:i+9],:); %similar to X array of SVM
    k=k+8;
end

k=1;
for i=1:10:400
    test2_svm(k:k+1,:)=images_array([i+2:i+3],:);
    k=k+2;
end

m=1;
for i=1:8:320
    z2_svm=-ones(320,1);
    z2_svm(i:i+7,1)=1;
    H2_svm= (double(train2_svm)*double(train2_svm')).*(z2_svm*z2_svm');
    f2_svm=-ones(320,1);
    A2_svm=-eye(320);
    a2_svm=zeros(320,1);
    B2_svm=[[z2_svm]';[zeros(319,320)]];
    b2_svm=zeros(320,1);
    alpha2_svm=quadprog(H2_svm+eye(320)*0.001,f2_svm,A2_svm,a2_svm,B2_svm,b2_svm);
    w2_svm=(alpha2_svm.*z2_svm)'*double(train2_svm);
    w2all_svm(m,:)=w2_svm;
    wnot2_svm=(1/z2_svm(i,1)) - (w2_svm(1,:)*double(train2_svm(i,:))');
    wnot2all_svm(m,:)=wnot2_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w2all_svm(j,:)*double(test2_svm(i,:))'+wnot2all_svm(j,1);
        rall2(j,i)=r;
    end
 end
 
 %create test labels
test2label_svm=[];
for i=1:40
     for j=1:2
         test2label_svm=[test2label_svm;i];
    end
end


for i=1:80
    [Max2_svm,Index2_svm]=max(rall2);
end
Index2_svmt=Index2_svm';
count=0;
for i=1:80
    if test2label_svm(i)==Index2_svmt(i)
        count=count+1;
    end
end

acc2_svm=count/80*100;

3rd fold

k=1;
for i=1:10:400
    train3_svm(k:k+7,:)=images_array([i:i+3 i+6:i+9],:); %similar to X array of SVM
    k=k+8;
end

k=1;
for i=1:10:400
    test3_svm(k:k+1,:)=images_array([i+4:i+5],:);
    k=k+2;
end

m=1;
for i=1:8:320
    z3_svm=-ones(320,1);
    z3_svm(i:i+7,1)=1;
    H3_svm= (double(train3_svm)*double(train3_svm')).*(z3_svm*z3_svm');
    f3_svm=-ones(320,1);
    A3_svm=-eye(320);
    a3_svm=zeros(320,1);
    B3_svm=[[z3_svm]';[zeros(319,320)]];
    b3_svm=zeros(320,1);
    alpha3_svm=quadprog(H3_svm+eye(320)*0.001,f3_svm,A3_svm,a3_svm,B3_svm,b3_svm);
    w3_svm=(alpha3_svm.*z3_svm)'*double(train3_svm);
    w3all_svm(m,:)=w3_svm;
    wnot3_svm=(1/z3_svm(i,1)) - (w3_svm(1,:)*double(train3_svm(i,:))');
    wnot3all_svm(m,:)=wnot3_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w3all_svm(j,:)*double(test3_svm(i,:))'+wnot3all_svm(j,1);
        rall3(j,i)=r;
    end
 end
 
 %create test labels
test3label_svm=[];
for i=1:40
     for j=1:2
         test3label_svm=[test3label_svm;i];
    end
end


for i=1:80
    [Max3_svm,Index3_svm]=max(rall3);
end
Index3_svmt=Index3_svm';
count=0;
for i=1:80
    if test3label_svm(i)==Index3_svmt(i)
        count=count+1;
    end
end

acc3_svm=count/80*100;

4th fold

k=1;
for i=1:10:400
    train4_svm(k:k+7,:)=images_array([i:i+5 i+8:i+9],:); %similar to X array of SVM
    k=k+8;
end

k=1;
for i=1:10:400
    test4_svm(k:k+1,:)=images_array([i+6:i+7],:);
    k=k+2;
end

m=1;
for i=1:8:320
    z4_svm=-ones(320,1);
    z4_svm(i:i+7,1)=1;
    H4_svm= (double(train4_svm)*double(train4_svm')).*(z4_svm*z4_svm');
    f4_svm=-ones(320,1);
    A4_svm=-eye(320);
    a4_svm=zeros(320,1);
    B4_svm=[[z4_svm]';[zeros(319,320)]];
    b4_svm=zeros(320,1);
    alpha4_svm=quadprog(H4_svm+eye(320)*0.001,f4_svm,A4_svm,a4_svm,B4_svm,b4_svm);
    w4_svm=(alpha4_svm.*z4_svm)'*double(train4_svm);
    w4all_svm(m,:)=w4_svm;
    wnot4_svm=(1/z4_svm(i,1)) - (w4_svm(1,:)*double(train4_svm(i,:))');
    wnot4all_svm(m,:)=wnot4_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w4all_svm(j,:)*double(test4_svm(i,:))'+wnot4all_svm(j,1);
        rall4(j,i)=r;
    end
 end
 
 %create test labels
test4label_svm=[];
for i=1:40
     for j=1:2
         test4label_svm=[test4label_svm;i];
    end
end


for i=1:80
    [Max4_svm,Index4_svm]=max(rall4);
end
Index4_svmt=Index4_svm';
count=0;
for i=1:80
    if test4label_svm(i)==Index4_svmt(i)
        count=count+1;
    end
end

acc4_svm=count/80*100;

5th fold

k=1;
for i=1:10:400
    train5_svm(k:k+7,:)=images_array([i:i+7],:); %similar to X array of SVM
    k=k+8;
end

k=1;
for i=1:10:400
    test5_svm(k:k+1,:)=images_array([i+8:i+9],:);
    k=k+2;
end

m=1;
for i=1:8:320
    z5_svm=-ones(320,1);
    z5_svm(i:i+7,1)=1;
    H5_svm= (double(train5_svm)*double(train5_svm')).*(z5_svm*z5_svm');
    f5_svm=-ones(320,1);
    A5_svm=-eye(320);
    a5_svm=zeros(320,1);
    B5_svm=[[z5_svm]';[zeros(319,320)]];
    b5_svm=zeros(320,1);
    alpha5_svm=quadprog(H5_svm+eye(320)*0.001,f5_svm,A5_svm,a5_svm,B5_svm,b5_svm);
    w5_svm=(alpha5_svm.*z5_svm)'*double(train5_svm);
    w5all_svm(m,:)=w5_svm;
    wnot5_svm=(1/z5_svm(i,1)) - (w5_svm(1,:)*double(train5_svm(i,:))');
    wnot5all_svm(m,:)=wnot5_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w5all_svm(j,:)*double(test5_svm(i,:))'+wnot5all_svm(j,1);
        rall5(j,i)=r;
    end
 end
 
 %create test labels
test5label_svm=[];
for i=1:40
     for j=1:2
         test5label_svm=[test5label_svm;i];
    end
end


for i=1:80
    [Max5_svm,Index5_svm]=max(rall5);
end
Index5_svmt=Index5_svm';
count=0;
for i=1:80
    if test5label_svm(i)==Index5_svmt(i)
        count=count+1;
    end
end

acc5_svm=count/80*100;

svmacc = (acc1_svm+acc2_svm+acc3_svm+acc4_svm+acc5_svm)/5;

%%%SVM with PCA %%%%%

%1st fold
j=1;
k=2;
for i=1:10:400
    test1(j:k,:)=images_array(i:i+1,:);
    j=j+2;
    k=k+2;
end

%remaining is train data
j=1;
k=8;
for i=1:10:400
    train1(j:k,:)=images_array(i+2:i+9,:);
    j=j+8;
    k=k+8;
end

u_train_1=mean(train1); % calculate mean of train data
Z_train_1= double(train1) - repmat(u_train_1,320,1);
u_test_1=mean(test1); % calculate mean of test data
Z_test_1= double(test1) - repmat(u_test_1,80,1);
 S1=319*cov(Z_train_1);
 [V1,D1]=eig(S1);

 for i=1:10304
     for j=10304:-1:10225
         E1(i,abs(j-10305))=V1(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end

 train1_red=E1'*Z_train_1';
 test1_red=E1'*Z_test_1';

train1_svm=train1_red';
test1_svm=test1_red';

m=1;
for i=1:8:320
    z1_svm=-ones(320,1);
    z1_svm(i:i+7,1)=1;
    H1_svm= (double(train1_svm)*double(train1_svm')).*(z1_svm*z1_svm');
    f1_svm=-ones(320,1);
    A1_svm=-eye(320);
    a1_svm=zeros(320,1);
    B1_svm=[[z1_svm]';[zeros(319,320)]];
    b1_svm=zeros(320,1);
    alpha1_svm=quadprog(H1_svm+eye(320)*0.001,f1_svm,A1_svm,a1_svm,B1_svm,b1_svm);
    w1_svm=(alpha1_svm.*z1_svm)'*double(train1_svm);
    w1all_svmr(m,:)=w1_svm;
    wnot1_svm=(1/z1_svm(i,1)) - (w1_svm(1,:)*double(train1_svm(i,:))');
    wnot1all_svm(m,:)=wnot1_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w1all_svmr(j,:)*double(test1_svm(i,:))'+wnot1all_svm(j,1);
        rall1(j,i)=r;
    end
 end
 
 %create test labels
test1label_svm=[];
for i=1:40
     for j=1:2
         test1label_svm=[test1label_svm;i];
    end
end


for i=1:80
    [Max1_svm,Index1_svm]=max(rall1);
end
Index1_svmt=Index1_svm';
count=0;
for i=1:80
    if test1label_svm(i)==Index1_svmt(i)
        count=count+1;
    end
end

acc1_svm_red=count/80*100;


%2nd fold

j=1;
k=2;
for i=1:10:400
    test2(j:k,:)=images_array(i+2:i+3,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train2(j:k,:)=images_array([i:i+1 i+4:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_2=mean(train2); % calculate mean of train data
Z_train_2= double(train2) - repmat(u_train_2,320,1);
u_test_2=mean(test2); % calculate mean of test data
Z_test_2= double(test2) - repmat(u_test_2,80,1);
S2=319*cov(Z_train_2);
[V2,D2]=eig(S2);

 for i=1:10304
     for j=10304:-1:10225
         E2(i,abs(j-10305))=V2(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end
 
 train2_red=E2'*Z_train_2';
 test2_red=E2'*Z_test_2';

train2_svm=train2_red';
test2_svm=test2_red';

m=1;
for i=1:8:320
    z2_svm=-ones(320,1);
    z2_svm(i:i+7,1)=1;
    H2_svm= (double(train2_svm)*double(train2_svm')).*(z2_svm*z2_svm');
    f2_svm=-ones(320,1);
    A2_svm=-eye(320);
    a2_svm=zeros(320,1);
    B2_svm=[[z2_svm]';[zeros(319,320)]];
    b2_svm=zeros(320,1);
    alpha2_svm=quadprog(H2_svm+eye(320)*0.001,f2_svm,A2_svm,a2_svm,B2_svm,b2_svm);
    w2_svm=(alpha2_svm.*z2_svm)'*double(train2_svm);
    w2all_svmr(m,:)=w2_svm;
    wnot2_svm=(1/z2_svm(i,1)) - (w2_svm(1,:)*double(train2_svm(i,:))');
    wnot2all_svm(m,:)=wnot2_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w2all_svmr(j,:)*double(test2_svm(i,:))'+wnot2all_svm(j,1);
        rall2(j,i)=r;
    end
 end
 
 %create test labels
test2label_svm=[];
for i=1:40
     for j=1:2
         test2label_svm=[test2label_svm;i];
    end
end


for i=1:80
    [Max2_svm,Index2_svm]=max(rall2);
end
Index2_svmt=Index2_svm';
count=0;
for i=1:80
    if test2label_svm(i)==Index2_svmt(i)
        count=count+1;
    end
end

acc2_svm_red=count/80*100;

%3rd fold

j=1;
k=2;
for i=1:10:400
    test3(j:k,:)=images_array(i+4:i+5,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train3(j:k,:)=images_array([i:i+3 i+6:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_3=mean(train3); % calculate mean of train data
Z_train_3= double(train3) - repmat(u_train_3,320,1);
u_test_3=mean(test3); % calculate mean of test data
Z_test_3= double(test3) - repmat(u_test_3,80,1);
S3=319*cov(Z_train_3);
 [V3,D3]=eig(S3);


 for i=1:10304
     for j=10304:-1:10225
         E3(i,abs(j-10305))=V3(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end
 
train3_red=E3'*Z_train_3';
test3_red=E3'*Z_test_3';

train3_svm=train3_red';
test3_svm=test3_red';

m=1;
for i=1:8:320
    z3_svm=-ones(320,1);
    z3_svm(i:i+7,1)=1;
    H3_svm= (double(train3_svm)*double(train3_svm')).*(z3_svm*z3_svm');
    f3_svm=-ones(320,1);
    A3_svm=-eye(320);
    a3_svm=zeros(320,1);
    B3_svm=[[z3_svm]';[zeros(319,320)]];
    b3_svm=zeros(320,1);
    alpha3_svm=quadprog(H3_svm+eye(320)*0.001,f3_svm,A3_svm,a3_svm,B3_svm,b3_svm);
    w3_svm=(alpha3_svm.*z3_svm)'*double(train3_svm);
    w3all_svmr(m,:)=w3_svm;
    wnot3_svm=(1/z3_svm(i,1)) - (w3_svm(1,:)*double(train3_svm(i,:))');
    wnot3all_svm(m,:)=wnot3_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w3all_svmr(j,:)*double(test3_svm(i,:))'+wnot3all_svm(j,1);
        rall3(j,i)=r;
    end
 end
 
 %create test labels
test3label_svm=[];
for i=1:40
     for j=1:2
         test3label_svm=[test3label_svm;i];
    end
end


for i=1:80
    [Max3_svm,Index3_svm]=max(rall3);
end
Index3_svmt=Index3_svm';
count=0;
for i=1:80
    if test3label_svm(i)==Index3_svmt(i)
        count=count+1;
    end
end

acc3_svm_red=count/80*100;


%%4th fold

j=1;
k=2;
for i=1:10:400
    test4(j:k,:)=images_array(i+6:i+7,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train4(j:k,:)=images_array([i:i+5 i+8:i+9],:);
    j=j+8;
    k=k+8;
end

u_train_4=mean(train4); % calculate mean of train data
Z_train_4= double(train4) - repmat(u_train_4,320,1);
u_test_4=mean(test4); % calculate mean of test data
Z_test_4= double(test4) - repmat(u_test_4,80,1);
S4=319*cov(Z_train_4);
[V4,D4]=eig(S4);

for i=1:10304
    for j=10304:-1:10225
         E4(i,abs(j-10305))=V4(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
    end
end

train4_red=E4'*Z_train_4';
test4_red=E4'*Z_test_4';


train4_svm=train4_red';
test4_svm=test4_red';

m=1;
for i=1:8:320
    z4_svm=-ones(320,1);
    z4_svm(i:i+7,1)=1;
    H4_svm= (double(train4_svm)*double(train4_svm')).*(z4_svm*z4_svm');
    f4_svm=-ones(320,1);
    A4_svm=-eye(320);
    a4_svm=zeros(320,1);
    B4_svm=[[z4_svm]';[zeros(319,320)]];
    b4_svm=zeros(320,1);
    alpha4_svm=quadprog(H4_svm+eye(320)*0.001,f4_svm,A4_svm,a4_svm,B4_svm,b4_svm);
    w4_svm=(alpha4_svm.*z4_svm)'*double(train4_svm);
    w4all_svmr(m,:)=w4_svm;
    wnot4_svm=(1/z4_svm(i,1)) - (w4_svm(1,:)*double(train4_svm(i,:))');
    wnot4all_svm(m,:)=wnot4_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w4all_svmr(j,:)*double(test4_svm(i,:))'+wnot4all_svm(j,1);
        rall4(j,i)=r;
    end
 end
 
 %create test labels
test4label_svm=[];
for i=1:40
     for j=1:2
         test4label_svm=[test4label_svm;i];
    end
end


for i=1:80
    [Max4_svm,Index4_svm]=max(rall4);
end
Index4_svmt=Index4_svm';
count=0;
for i=1:80
    if test4label_svm(i)==Index4_svmt(i)
        count=count+1;
    end
end

acc4_svm_red=count/80*100;

%%%5th fold

j=1;
k=2;
for i=1:10:400
    test5(j:k,:)=images_array(i+8:i+9,:);
    j=j+2;
    k=k+2;
end   
    
%remaining is train data
j=1;
k=8;
for i=1:10:400
    train5(j:k,:)=images_array([i:i+7],:);
    j=j+8;
    k=k+8;
end
 
u_train_5=mean(train5); % calculate mean of train data
Z_train_5= double(train5) - repmat(u_train_5,320,1);
u_test_5=mean(test5); % calculate mean of test data
Z_test_5= double(test5) - repmat(u_test_5,80,1);
S5=319*cov(Z_train_5);
[V5,D5]=eig(S5);

for i=1:10304
     for j=10304:-1:10225
         E5(i,abs(j-10305))=V5(i,j); %top 80 eigenvectors corresponfing to top 80 eigenvalues
     end
 end

 train5_red=E5'*Z_train_5';
 test5_red=E5'*Z_test_5';

train5_svm=train5_red';
test5_svm=test5_red';

 m=1;
for i=1:8:320
    z5_svm=-ones(320,1);
    z5_svm(i:i+7,1)=1;
    H5_svm= (double(train5_svm)*double(train5_svm')).*(z5_svm*z5_svm');
    f5_svm=-ones(320,1);
    A5_svm=-eye(320);
    a5_svm=zeros(320,1);
    B5_svm=[[z5_svm]';[zeros(319,320)]];
    b5_svm=zeros(320,1);
    alpha5_svm=quadprog(H5_svm+eye(320)*0.001,f5_svm,A5_svm,a5_svm,B5_svm,b5_svm);
    w5_svm=(alpha5_svm.*z5_svm)'*double(train5_svm);
    w5all_svmr(m,:)=w5_svm;
    wnot5_svm=(1/z5_svm(i,1)) - (w5_svm(1,:)*double(train5_svm(i,:))');
    wnot5all_svm(m,:)=wnot5_svm;
    m=m+1;
end

 for i=1:80
    for j=1:40
        r=w5all_svmr(j,:)*double(test5_svm(i,:))'+wnot5all_svm(j,1);
        rall5(j,i)=r;
    end
 end
 
 %create test labels
test5label_svm=[];
for i=1:40
     for j=1:2
         test5label_svm=[test5label_svm;i];
    end
end


for i=1:80
    [Max5_svm,Index5_svm]=max(rall5);
end
Index5_svmt=Index5_svm';
count=0;
for i=1:80
    if test5label_svm(i)==Index5_svmt(i)
        count=count+1;
    end
end

acc5_svm_red=count/80*100;

svmacc_pca = (acc1_svm_red+acc2_svm_red+acc3_svm_red+acc4_svm_red+acc5_svm_red)/5;










        

    


    




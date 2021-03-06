%% Feature Selection
% For motion artifact
F=[];
for i=1:numel(I)
    F=[F ;FeatureExtraction(I{i})];
    disp(['Image number ' num2str(i) ' is done...'])
end
%% SMOTE (Synthetic Minority Over-Sampling Technique)
% allData_smote = mySMOTE([F, Target+1], 3,1:5);
% Fnew=allData_smote(:,1:end-1); Targetnew=allData_smote(:,end)-1;
%% Shuffle
Targetnew=Target;
Fnew=F;

[Fnew,Targetnew]=shuffle(Fnew,Targetnew);
Targetnew=Targetnew+1;
%% Normalization
Normalize=@(x) (x-min(x))/(max(x)-min(x));
for i=1:size(Fnew,2)
    Fnew(:,i)=Normalize(Fnew(:,i));
end
%%
tic
trainValidationPercent=.90;
[trainValidationData,targetTrainValidation,TestData,TargetTest]=HoldOutDivision(Fnew,Targetnew,trainValidationPercent);

k=4;
fun=@(Train,Target) fitctree(Train,Target);
[Out,err,cvMean,cvStd,Mdl,Res,TestOut]=KfoldClass(k,trainValidationData,targetTrainValidation,TestData,TargetTest,fun);
TestOut

Confusionmatrix = confusionmat(TargetTest,TestOut.out)
toc
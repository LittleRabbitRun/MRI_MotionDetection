clc
clear
run('addToolbox.m') 
% %% Load Data
I_person=LoadData_Slices();
%% Add motion artifact
noiseBasePars ={1.^[0:8],2.*[0:8],3.*[0:8],4.*[0:8]}; %% minimal,mild,moderate,severe motion
maxDisp=[1,4,9,14];
maxRot=[1,4,9,14];
show=1;
for i=1:numel(I_person)
    for m=1:4
        [image_simMotion{i,m},fitpars{i,m}]=addMotionArtifactToMRI(I_person{i},noiseBasePars{m},maxDisp(m),maxRot(m),show);
    end
    disp(['Person number ' num2str(i) ' is done...'])
end
%% load images that are saved
% load('simulatedImages.mat')
%% showing add motion artifact
m=1;
addMotionArtifactToMRI(I_person{3},noiseBasePars{m},maxDisp(m),maxRot(m),1);
 % imshowDifferentMotion(I_person,image_simMotion,1,40)
%% non:0 slight:1 mild:2 moderate:3 severe:4 
Strategy1_FeatureSelectionMachineLearning
%%


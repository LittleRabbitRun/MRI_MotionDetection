function I_person=LoadData_Slices()
cD=pwd;
cd('../Data')
I_person={};
StartIndex=20;
EndIndex=20;
%% NormalData
k=1;
p=1;
for i=1:18
    if i==11
        continue
    end
    Name=['IBSR_' num2str(i,'%2.2i')];
    Imgtemp = uint8(analyze75read([Name '/images/analyze/' Name '_ana']));
    I_person{p}=Imgtemp(:,:,StartIndex:end-EndIndex);
    p=p+1;
end
% %% File 126
% files=dir('./126/*.img');
% Img=[];
% k=1;
% for i=StartIndex:numel(files)-EndIndex
%     try
%         fid = fopen(['./126/' files(i).name]);
%         I = double(fread(fid, [256 256], '*int16','b')); %% Big Endian
%         I=uint8(I/max(I(:))*255);
%         if size(I,2)<10
%             fclose(fid);
%             continue;
%         end
%         Img(:,:,k)=Normalize2(imrotate(I,-90));
%         k=k+1;
%         fclose(fid);
%     catch
%         break;
%     end
% end
% I_person{p}=Img;
% p=p+1;
% %% File 536
% folder={'536_32','536_45','536_47','536_68','536_88'};
% for j=1:numel(folder)
%     files=dir(['./536/' folder{j} '/*.img']);
%     Img=[];
%     k=1;
%     for i=StartIndex:numel(files)-EndIndex
%         try
%             fid = fopen(['./536/' folder{j} '/' files(i).name]);
%             I = double(fread(fid, [256 256], '*int16','b')); %% Big Endian
%             
%             I=uint8(I/max(I(:))*255);
%             if size(I,2)<10
%                 fclose(fid);
%                 continue;
%             end
%             Img(:,:,k)=Normalize2(imrotate(I,-90));
%             k=k+1;
%             fclose(fid);
%         catch
%             break;
%         end
%     end
%     I_person{p}=Img;
%     p=p+1;
% end
% %% Khan Prof, Images (20Normals_T1)
% %% File 657
% files=dir('./657_img/*.img');
% Img=[];
% k=1;
% for i=StartIndex:numel(files)-EndIndex
%     try
%         fid = fopen(['./657_img/' files(i).name]);
%         I = double(fread(fid, [256 256], '*int16','b')); %% Big Endian
%         I=uint8(I/max(I(:))*255);
%         if size(I,2)<10
%             fclose(fid);
%             continue;
%         end
%         Img(:,:,k)=Normalize2(imrotate(I,-90));
%         k=k+1;
%         fclose(fid);
%     catch
%         break;
%     end
% end
% I_person{p}=Img;
% p=p+1;
% %% File 788
% files=dir('./788_6.img/*.img');
% Img=[];
% k=1;
% for i=StartIndex:numel(files)-EndIndex
%     try
%         fid = fopen(['./788_6.img/' files(i).name]);
%         I = double(fread(fid, [256 256], '*int16','b')); %% Big Endian
%         I=uint8(I/max(I(:))*255);
%         if size(I,2)<10
%             fclose(fid);
%             continue;
%         end
%         Img(:,:,k)=Normalize2(imrotate(I,-90));
%         k=k+1;
%         fclose(fid);
%     catch
%         break;
%     end
% end
% I_person{p}=Img;
% p=p+1;
% 
% function I=Normalize2(I)
% I=I-mode(I(:));
% d=linspace(min(I(:)),max(I(:)),255);
% I=uint8(arrayfun(@(x) find(abs(d(:)-x)==min(abs(d(:)-x))),I));
% 
% end
%% return to root
cd(cD);

end


data_original = dir('*.xls');
sig=importdata(data_original(1).name);

vect=sig.data;
MatSTD =vect.Sheet10(1:80,1:10);


VMMYF=[];
VMMYO=[];
VPJYF=[];
VPJYO=[];



for i=0:19
   
    VMMYF=[VMMYF; MatSTD(4*i+1,:)];
    VMMYO=[VMMYO; MatSTD(4*i+2,:)];
    VPJYF=[VPJYF; MatSTD(4*i+3,:)];
    VPJYO=[VPJYO; MatSTD(4*i+4,:)];
   
end
% Standardized z score, normalizes X using STD(X) et Mean(X) 
% VMMYF=zscore(VMMYF);
% VMMYO=zscore(VMMYO);
% VPJYF=zscore(VPJYF);
% VPJYO=zscore(VPJYO);


% IGmm=Gmmyf/Gmmyo; 
% IGpj=Gpjyf/Gpjyo;
% IGyf=Gmmyf/Gpjyf;
% IGyo=Gmmyo/Gpjyo;

%For Gains
IGmm=VMMYF(:,1:5)./VMMYO(:,1:5);
IGpj=VPJYF(:,1:5)./VPJYO(:,1:5);
IGyf=VMMYF(:,1:5)./VPJYF(:,1:5);
IGyo=VMMYO(:,1:5)./VPJYO(:,1:5);

%For Frequencies
IFmm=VMMYF(:,6:10)./VMMYO(:,6:10);
IFpj=VPJYF(:,6:10)./VPJYO(:,6:10);
IFyf=VMMYF(:,6:10)./VPJYF(:,6:10);
IFyo=VMMYO(:,6:10)./VPJYO(:,6:10);

resG=[IGmm,IGpj,IGyf,IGyo];
resF=[IFmm,IFpj,IFyf,IFyo];
res=[resG, resF];


Xr=zscore(res);
[COEFF,SCORE] = princomp(Xr);




%     figure;
%     hold on;
%     plot3(SCORE(1:5,1),SCORE(1:5,2),SCORE(1:5,3),'r*');
%     plot3(SCORE(6:10,1),SCORE(6:10,2),SCORE(6:10,3),'b*');
%     plot3(SCORE(11:15,1),SCORE(11:15,2),SCORE(11:15,3),'mo');
%     plot3(SCORE(16:20,1),SCORE(16:20,2),SCORE(16:20,3),'bo');
    
    figure;
    hold on;
    plot3(SCORE(1:10,1),SCORE(1:10,2),SCORE(1:10,3),'r*');
    plot3(SCORE(11:20,1),SCORE(11:20,2),SCORE(11:20,3),'b*');































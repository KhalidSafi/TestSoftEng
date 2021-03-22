data_original = dir('*.xls');
sig=importdata(data_original(1).name);
vect=sig.data;
MatSTD =vect.Sheet8(1:80,1:10);
MatSTD2  =vect.Sheet2(1:240,1:9);
% MatSTD=MatSTD1+MatSTD2;
% MatSTD=(MatSTD1+MatSTD2)./(MatSTD1.*MatSTD2);


STDMMYF=[];
STDMMYO=[];
STDPJYF=[];
STDPJYO=[];



for i=0:19
   
    STDMMYF=[STDMMYF; MatSTD(12*i+1:12*i+3,:)];
    STDMMYO=[STDMMYO; MatSTD(12*i+4:12*i+6,:)];
    STDPJYF=[STDPJYF; MatSTD(12*i+7:12*i+9,:)];
    STDPJYO=[STDPJYO; MatSTD(12*i+10:12*i+12,:)];
   
end


Xr=zscore(STDMMYO);
%  Y = [zeros(20,1); ones(20,1)];

   Y = [zeros(15,1); ones(15,1); 2*ones(15,1);3*ones(15,1)];

   [yhat,err,P]=classify(Xr,Xr,Y,'q');
  
%  [yhat,err,P]=classify([Xr(1:10,:);Xr(51:60,:)],Xr(11:50,:),Y,'q');

% [yhat,err,P]=classify(Xr(11:50,:),Xr(11:50,:),Y,'q');




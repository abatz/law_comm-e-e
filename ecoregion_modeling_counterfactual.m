function [Mdl1,bias,delta,ba_cf]=ecoregion_modeling_counterfactual(fwi,pr,fwic,prc,ba);
tol=0.1;
baf=log10(ba+1);
tbl=table(baf,fwi,pr);
fwi=fwic;pr=prc;
tbl1=table(baf,fwi,pr);

if sum(baf>0)>=length(baf)*3/4
    % if 3/4 of years have non-zero burned area
    Mdl1=fitlm(tbl,'baf ~ pr + fwi');
    yFit=predict(Mdl1,tbl);
    yFit2=predict(Mdl1,tbl1);   
    ress=Mdl1.Residuals.Raw;
    %sample error term from the redisuals
    rr=randn(length(baf),1);[a,b]=sort(rr);
    %calculate bias after transforming back to burned area
    bb=nanmean(10.^(yFit+ress(b)))./nanmean(10.^baf);
    % cases where the bias in the calibrated model exceeds tol (10%)
    while abs(bb-1)>tol
        if bb>1 ress=ress*.95;
        else ress=ress*1.05;end
        bb=nanmean(10.^(yFit+ress(b)))./nanmean(10.^baf);
    end
    bias=bb;
    
    delta=nanmean(10.^(yFit+ress(b)))./nanmean(10.^(yFit2+ress(b)));
    ratio=(10.^(yFit2+ress(b)))./(10.^(yFit+ress(b)));
    ba_cf=ratio.*ba;
else
   Mdl1=NaN;
   bias=NaN;
   delta=NaN;
   ba_cf=ba;
end


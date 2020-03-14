function H = naloga1(besedilo,p)
% besedilo - stolpicni vektor znakov (char)
% p  - stevilo poznanih predhodnih znakov; 0, 1, 2 ali 3.
%    p = 0 pomeni, da racunamo povprecno informacijo na znak
%        abecede brez poznanih predhodnih znakov: H(X1)
%    p = 1 pomeni, da racunamo povprecno informacijo na znak 
%        abecede pri enem poznanem predhodnemu znaku: H(X2|X1)
%    p = 2: H(X3|X1,X2)
%    p = 3: H(X4|X1,X2,X3)
%
% H - skalar; povprecna informacija na znak abecede 
%     z upostevanjem stevila poznanih predhodnih znakov p

besedilo = upper(besedilo(isletter(besedilo)));
H = 0;
if p == 0
    [GC, GR] = groupcounts(besedilo);
    GC;
    GR;
    sum(GC);
    P = ones(1,size(GR,1));
    for i = 1:size(GR,1) 
        P(1,i) = GC(i,1)/sum(GC);
    end
    H = 0;
    for i = 1:size(GR, 1) 
       H = H + P(i) * -log2(P(1,i)); 
    end
elseif p == 1
    pari = strings(1, size(besedilo,1) - 1);
    for i = 1:size(pari,2)
        besedilo(i+1,1);
        pari(1,i) = strcat(besedilo(i,1),besedilo(i+1,1))
    end
    pari
    [GC, GR] = groupcounts(besedilo,'rows');
    GC
    GR
end
besedilo';
H;
end

function H = entropy(p) 
H = 0;
for i=1:size(p,2)
    H = H + p(1,i) * -log2(p(1,i));
end
H;
end




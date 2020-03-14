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

%za p=0 nas zanima H(X1): -sum(i:N) pi * log2 pi
%za p=1 nas zanima H(X2|X1): H(X1,X2) - H(X1)
%za p=2 nas zanima H(X3|X1, X2): H(X1,X2,X3) - H(X1,X2)
%za p=3 nas zanima H(X4|X1, X2, X3): H(X1,X2,X3,X4) - H(X1,X2,X3)

besedilo = upper(besedilo(isletter(besedilo)));
H0 = 0;
H1 = 0; 
H2 = 0; 
H3 = 0; 
[GC, GR] = groupcounts(besedilo);
P = ones(1,size(GR,1));
for i = 1:size(GR,1) 
    P(1,i) = GC(i,1)/sum(GC);
    H0 = H0 + P(i) * -log2(P(1,i)); 
end
% izracunan H(X1), spremenljivka H0
if p >= 1
    besedilo = besedilo';
    pari = [besedilo(1:end-1); besedilo(2:end)]';
    [U, iA, iB] = unique(pari, 'rows');
    [GC, GR] = groupcounts(iB);
    P = ones(1,size(GR,1));
    for i = 1:size(GR,1) 
        P(1,i) = GC(i,1)/sum(GC);
        H1 = H1 + P(i) * -log2(P(1,i)); 
    end
    H1temp = H1;
    H1 = H1 - H0;
    %izracunan H(X1, X2), to je spremenljivka H1temp ter izracunan
    %H(X2|X1), to je spremenljivka H1
    if p >= 2
        trojcki = [besedilo(1:end-2); besedilo(2:end-1); besedilo(3:end)]';
        [U, iA, iB] = unique(trojcki, 'rows');
        [GC, GR] = groupcounts(iB);
        for i = 1:size(GR,1) 
            P(1,i) = GC(i,1)/sum(GC);
            H2 = H2 + P(i) * -log2(P(1,i));
        end
        H2temp = H2;
        H2 = H2 - H1;
        %izracunan H(X1, X2, X3), to je spremenljivka H2temp ter izracunan
        %H(X3|X1, X2), to je spremenljivka H2
        if p == 3 
            cetvorcki = [besedilo(1:end-3); besedilo(2:end-2); besedilo(3:end-1); besedilo(4:end)]';
            [U, iA, iB] = unique(cetvorcki, 'rows');
            [GC, GR] = groupcounts(iB);
            P = ones(1,size(GR,1));
            for i = 1:size(GR,1) 
                P(1,i) = GC(i,1)/sum(GC);
            end
            for i = 1:size(GR, 1) 
               H3 = H3 + P(i) * -log2(P(1,i)); 
            end
            H3 = H3 - H2temp;
            %izracunan H(X4|X1, X2, X3), to je spremenljivka H3
        end
    end   
end
    %izpis ustrezne entropije
    if p == 0 
        H = H0;
    elseif p == 1
        H = H1;
    elseif p == 2
        H = H2;
    elseif p == 3
        H = H3;
    end
end



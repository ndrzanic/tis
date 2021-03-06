function [izhod, R, kodBela, kodCrna] = naloga2(vhod)
% Kodiranje slike "vhod" po prilagojenem standardu ITU-T T.4.
%
% vhod     - matrika, ki predstavlja sliko [n X 1728]
% izhod    - binarni vrsticni vektor
% R        - kompresijsko razmerje
% kodBela  - tabela dolzin kodnih zamenjav belih slikovnih tock
% kodCrna  - tabela dolzin kodnih zamenjav crnih slikovnih tock

kodBela = [];
kodCrna = [];

    relMatTemp = [];
    relMat = [];
    i = 1;
    while i <= size(vhod,1)
        vh = vhod(i, :);
        J = find(diff([vh(1) - 1, vh]));
        relMatTemp = [vh(J); diff([J, numel(vh) + 1])];
        if(vh(1,1) == 0) 
            relMatTemp = cat(2, [1;0], relMatTemp);
        end
        relMat = cat(2, relMat, relMatTemp) ;
        i = i+1;
    end
    [a b] = find(relMat(1,:) == 1);
    beli = relMat(2, b);
    stBelih = size(beli, 2);
    sumBelih = sum(beli); 
    beli;
    [a b] = find(relMat(1,:) == 0);
    crni = relMat(2, b);
    stCrnih = size(crni, 2); 
    sumCrnih = sum(crni);
    crni;
    [bincountsB, indB] = groupcounts(crni');
    testB = sortrows([bincountsB, indB], "descend");
    bincountsB = testB(:,1);
    indB = testB(:,2);
    pCrni = bincountsB/stCrnih;
    %RELMAT JE OK 
    
    lCrni = dolzine(indB, pCrni')

    [bincountsW, indW] = groupcounts(beli');
    testW = sortrows([bincountsW, indW]);
    bincountsW = testW(:,1);
    indW = testW(:,2);
    pBeli = bincountsW/stBelih;
    lBeli = dolzine(indW, pBeli');
    lBeli = sortrows(lBeli);
    lCrni = sortrows(lCrni);
    % 1 - bela, 0 - crna
    kodBela = [lBeli(:,2),lBeli(:,1)];
    kodCrna = [lCrni(:,2),lCrni(:,1)];
    zBeli = zamenjave(lBeli);
    zCrni = zamenjave(lCrni);   
    izhod = kodiranje(beli, crni, zBeli, zCrni);
    R = size(izhod,2) / size(vhod,2)
end

function l = dolzine(z, p)
    arr = zeros(size(p,2), 5);
    size(arr);
    arr(:, 5) = z';
    arr(1:size(p,2)) = p;
    arr = sortrows(arr, "ascend");
    iter = size(p,2);
    arr;
    for i=1:log2(size(p,2))
        for j=1:(ceil(log2(size(p,2))))
            test = arr(:,1);
            [a1, b1] = min(test(test~= 0));
            test(b1,1) = 42;
            arr(b1, 1) = 42;
            [a2, b2] = min(test(test~= 0));
            test(b2, 1) = 42;
            arr(b2, 1) = 42;
            [a1,b1];
            [a2,b2];
            arr(iter + i + j - 1, :) = zeros(1, size(arr,2));
            arr(iter + i + j - 1, 1) = a1 + a2;
            arr(iter  + i + j - 1, 2) = b1;
            arr(iter  + i + j - 1 , 3) = b2;
            test(iter + i + j - 1, :) = zeros(1, size(test,2));
            test(iter + i + j - 1, 1) = a1 + a2;
            arr;
        end
        arr;
        iter = iter + (ceil(log2(size(p,2)))) - i;
    end
    arr;
    arr(length(arr(:,1)), 4) = 0;
    n = length(arr(:,1));
    for i=1:size(p,2)-1
        ind1 = arr(n-i+1, 2);
        ind2 = arr(n-i+1, 3);
        [ind1,ind2];
        arr(ind1, 4) = arr(n-i+1, 4) + 1;
        arr(ind2, 4) = arr(n-i+1, 4) + 1;
        arr;
    end
    l = [arr(1:size(p,2),4), arr(1:size(p,2), 5)];
end

function l = zamenjave(a) 
    l = zeros(size(a,1), 3);
    l(:,1) = a(:,1);
    l(:,2) = a(:,2);
    l(1,3) = 0;
    for i=2:size(a,1) 
        l(i, 3) = l(i-1,3) + 1;
        l(i, 3) = l(i,3) * power(2,(l(i,1) - l(i-1,1)));
    end
end

function izhod = kodiranje(beli, crni, lBeli, lCrni) 
    beli;
    crni;
    lBeli;
    lCrni;
    iterW = 0;
    iterB = 0;
    iter = 1;
    izhod = zeros(1, sum(lBeli(:, 1)) + sum(lCrni(:,1)));
    for i=1:(size(beli,2) + size(crni,2))
    %for i=1:3
        if (mod(i,2) ~= 0) % character je bel 
            iterW = iterW + 1;
            belElement = beli(1, iterW);
            ind = find(lBeli(:,2) == belElement);
            belDolzina = lBeli(ind, 1);
            belTest = lBeli(ind, 3);
            belKod = dec2bin(belTest);
            for k=1:(belDolzina - length(belKod))
                izhod(1, iter) = 0;
                iter = iter + 1;
            end
            for j=1:length(belKod)
                izhod(1, iter) = str2double(belKod(1,j));
                iter = iter + 1;
            end
        else 
            iterB = iterB + 1;
            crnElement = crni(1, iterB);
            ind = find(lCrni(:,2) == crnElement);
            crnDolzina = lCrni(ind, 1);
            crnTest = lCrni(ind, 3);
            crnKod = dec2bin(crnTest);
            for k=1:(crnDolzina - length(crnKod))
                izhod(1, iter) = 0;
                iter = iter + 1;
            end
            for j=1:crnDolzina
                izhod(1, iter) = str2double(crnKod(1,j));
                iter = iter + 1;
            end
        end
    end
end

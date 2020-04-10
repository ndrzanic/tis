% Funkcija za preverjanje naloge 2.
% Primer zagona:
% test_naloga2('primeri',1);

function score = test_naloga2(caseDir,caseID)
% Zahtevana natancnost rezultata
tol = 1e-6;

% Nalozi vhodne podatke in resitev
caseData = load([caseDir,filesep,num2str(caseID),'.mat']);

% Pozeni funkcijo
clear naloga2;
tic();
[izhod, R, kodBela, kodCrna] = naloga2(caseData.vhod);
timeElapsed = toc();

% Preveri rezultate
success1 = abs(R - caseData.R) < tol;
success2 = isequal(izhod, caseData.izhod);
success3 = isequal(kodBela, caseData.kodBela);
success4 = isequal(kodCrna, caseData.kodCrna);

if ~success2
    if(length(izhod) == length(caseData.izhod))
        fprintf('Kodiran "izhod" ni enak resitvi, vendar se ne pomeni nujno, da je napacen.\nPoskusimo ga dekodirati (FaxDecode) in rezultat nato primerjajmo z "vhod".\n');
        fprintf('Dekodiranje ...\n');
        ticID = tic();
        Y = FaxDecode(izhod, kodBela, kodCrna);
        time_decoder = toc(ticID);
        fprintf('Cas dekodiranja: %f sekund\n',time_decoder);
        
        if isequal(caseData.vhod,Y)
            fprintf('Dekodirani "izhod" se ujema z vhodom, resitev je pravilna.\n');
            success2 = 1;
            if isequal(size(kodBela), size(caseData.kodBela))
                success3 = 1;
            end
            if isequal(size(kodCrna), size(caseData.kodCrna))
                success4 = 1;
            end
        else
            fprintf('Dekodirani "izhod" se ne ujema z vhodom, resitev je napacna.\n');
        end
    else
        fprintf('Napaka: dolzina vektorja "izhod" je napacna.\n');
    end
end

% Pol tocke za R in pol tocke za pravilnost izhoda (skupaj s kodnimi tabelami).
score = 0.5 * success1 + 0.5 * (success2 & success3 & success4);

fprintf('\nRezultati za primer %d:\n',caseID);
fprintf('-----------------------------\n');
fprintf('R:       %d\nizhod:   %d\nkodBela: %d\nkodCrna: %d\n',success1,success2,success3, success4);
fprintf('-----------------------------\n');
fprintf('Skupni rezultat: %d\n\n', score);
fprintf('Cas izvajanja (naloga2.m): %f sekund.\n',timeElapsed);

import random 


vprasanja1 = '''Kdo se je prvi ukvarjal z matematično formulacijo informacije? Zapiši njegove ugotovitve
Do kakšne ugotovitve je prišel Shannon leta 1948 glede veerjetnosti znakov?
Definiraj lastno informacijo. Kakšne so njene enote(za 2, 3, e, 10)
Kaj je razlika med lastno informacijo in entropijo?
Opiši diskretni vir informacije
Kaj je entropija? Zapiši jo s formulo
Opiši 5 lastnosti entropije
izpelji pogojno entropijo
povezava med vezano in pogojno entropijo
kakšna je entropija za binarni simetrični kanal brez spomina?
izpelji vezano entropijo'''

vprasanja2 = '''Kaj je kod? S čim označimo r? 
Definiraj povprečno dolzino kodne zamenjave
Kakšne tipe kodov poznamo
kdaj je povprečna kodna zamenajva najkrajša? 
Definiraj Kraftovo neenakost
Zapiši zvezo med povprečno dolžino zamenjav in entropijo za en obravnavani znak
Kaj je gospodaren kod? 
Kaj je idealen kod? 
Kaj je značilno za optimalen kod?
Definiraj učinkovitost koda
Kakšne so zveze med povprečno dolžino zamenjav in entropijo za več obravnavanih znakov
1. Shannonov teorem
SHANNONOV KOD - opiši korake
FANOJEV KOD - opiši korake
HUFFMANOV KOD - kaj je Huffmanov kod, kakšna vrsta koda je, kaj je razlika med Fanojevim in Huffmanovim kodom, opiši korake
Ali je Huffmanov kod optimalen? Dokaži
Ali je vsak optimalen enoznačen kod Huffmanov? 
Ali je vsak optimalen kod Huffmanov?
Ali je Huffmanov kod en sam? 
Katera relacija mora veljati pri Huffmanovem kodu preden začnemo graditi drevo? 
Opiši relacijo med entropijo, LH in LS(kjer je LH povprečna dolžina kodne zamenjave pri Huffmanovem, LS pa povprečna dolžina kodne zamenjave pri Shannonovem kodiranju)
Opiši kodiranje z razširitvijo abecede(kaj se zgodi če uporabljamo čedalje večje bloke) 
ARITMETIČNI KOD- kaj je, opiši njegove lastnosti, znake nam je treba razvrstiti(DA/NE), opiši korake, kaj je težava pri aritmetičnem kodu
Zakaj aritmetični kod ni optimalen?'''

vprasanja3 = '''Kaj je težava stiskanja na osnovi verjetnosti?
Kako gradimo slovar?
Kaj je funkcija kodirnika in dekodirnika pri gradnji slovarja?
kod Lempel-Ziv: kaj je to, kaj je vloga kodirnika, kateri 2 komponenti uporablja ta kod, kako je podana referenca
deflate algoritem: na čim temelji, zakaj je tako popularen, kakšne pare uporablja, kakšni kodni tabeli uporablja(opiši ju), na kaj se razdeli vsebina, ki jo želimo zakodirati, kakšne načine kodiranja poznamo
kanonični Huffmanov kod: kaj je njegova prednost pred navadnim Huffmanom, opiši korake, kakšno je drevo kanoničnega Huffmana
kod LZW: kje najdemo ta algoritem, ali doseže optimalno stiskanje?
RLE: opiši ga, kje se uporablja, v kombinaciji s čim se največkrat uporablja, kaj imamo v 8-bitnem RLE na začetku 
Kateri standard uporablja RLE? 
Kateri algoritem uporablja RLE in kje?'''

vprasanja4 = '''kaj je razlika med stiskanjem z izgubami in stiskanjem brez izgub? katere pristope še posebej upoštevamo pri stiskanju z izgubami?
definiraj kompresijsko razmerje, kakšna so kompresijska razmerja tipično pri stiskanju brez izgub/z izgubami
JPEG kodiranje(kaj najprej pripravimo, na kaj se razdeli slika, kaj pravi psihovizualni pristop, kaj kodiramo pri blokih, kako so kodirane dolžine iz RLE)
MP3 kodiranje(del katerega standarda je, kateri pristop uporablja, kako dobimo koeficiente, kako jih popravimo, kako je poskrbljeno da ne trpi kvaliteta zvoka)
MPEG kodiranje(iz česa je sestavljen, kakšne okvirje imamo)'''

vprasanja5 = '''kaj je kanal? kako ga opišemo matematično? tipi kanalov
DISKRETNI KANAL BREZ SPOMINA(kaj povezuje, zakaj je kanal brez spomina, v kaj se seštejejo pogojne verjetnosti)
BINARNI SIMETRIČNI KANAL(skica, zapiši verjetnosti, zapiši skico za 2 binarna simetrična kanala, zapiši entropijo)
obračanje kanala - kaj obračamo, kakšen je pogoj za obrat, kako dobimo izhodne verjetnosti, kaj določi sprejemnik
kapaciteta kanala(kaj je ugotovil Shannon, formula za kapaciteto, od česa je odvisna, kaj moramo narediti, da bo kapaciteta maksimalna, izpelji kapaciteto za BSK in za binarki kanal z brisanjem)
kaj je medsebojna informacija? kakšne so njene lastnosti?
kaj je hitrost koda/prenosa?
kaj pravi Shannonov drugi teorem?
Shannonov 2. teorem na BSK
kdaj imamo lahko zanesljiv prenos čez kanal?'''

vprasanja6 = '''kaj so ponavljajoči kodi? 
zakaj pri prenosu pride do napak in kako se pred njimi obvarujemo?
kaj dodamo podatkovnim bitom pri kontrolnih vsotah?
opiši pravokotni in trikotni kod
definiraj Hammingovo razdaljo in Hammingovo razdaljo koda
zapiši formulo za število napak, ki jih kod lahko zazna in število napak, ki jih kod lahko odpravi
definiraj Hammingov pogoj'''

vprasanja7 = '''kaj je značilno za linearne bločne kode? kako jih označimo?
čemu je enaka Hammingova razdalja koda pri linearnih bločnih kodih(dokaz)
kaj moramo množiti, da dobimo kodno zamenjavo?
generatorska matrika - kakšne vrstice mora imeti, kakšna je generatorska matrika 
matrika za preverjanje sodosti - kakšnih dimenzij je, kaj predstavlja vsaka vrstica, katera zveza vedno velja in če velja G=(I_k | A) koliko je potem H?
dokaži zvezo GH^T = 0
SINDROM - definiraj ga, nariši skico kanala, kaj določa njegov vektor, kaj pomeni s=0, ali se nam sploh splača popravljati napake?
STANDARDNA TABELA KODA - kakšne oblike je, kateri nizi so v isti vrstici, kaj je popravljalnik, kako dobimo ostale nize, kako popravljamo, kje se tak postopek zalomi
opiši Hammingove kode(kakšna je njihova oznaka, kako jih najlažje predstavimo, kakšen je leksikografski Hammingov kod, kakšna vrsta koda je to)'''

vprasanja8 = '''kaj so ciklični kodi?
zapiši formulo za krožni premik za i mest
kaj je generatorski polinom(kaj so vrstice generatorske matrike, kaj vsebuje zadnja vrstica, kakšne oblike je polinom, kako iz generatorskega polinoma dobimo generatorsko matriko, ali dobimo s tako zgrajeno matriko sistematičen kod, kaj generatorski polinom deli)
kaj je sistematični kod? dokaži zvezo GH^T = 0
kakšna sta polinom in matrika za preverjanje sodosti
definiraj kodiranje z množenjem in kodiranje z deljenjem 
nariši shemo kodiranja na osnovi množenja in kodiranja na osnovi deljenja
kako poteka dekodiranje s polinomi? nariši shemo dekodirnika! kako najdemo napake?
kakšne so zmožnosti cikličnih kodov?
opiši CRC'''

vprasanja9 = '''kaj je signal? kaj je diskretni signal in kaj zvezen signal? kako zajemamo signale?
kakšni so temeljni koncepti pri frekvenci? 
definiraj Fourierovo vrsto
za katere funkcije velja Fourierova vrsta?
predstavi Fourierovo vrsto z Eulerjevo formulo(kaj so pri tem negativne frekvence)
definiraj Fourierovo transformacijo
katere lastnosti veljajo za Fourierovo transformacijo
kaj je energija signala?
kaj je Parsevalov teorem? Kako imenujemo člen v integralu? Kakšna je diskretna različica Parsevalovega teorema? Kaj je močnostni spekter?
definiraj DFT, kakšna je povezava s Fourierovo transformacijo?
kakšna je formula za rekonstrukcijo signala? 
kapaciteta zveznega kanala?
kaj pravi teorija vzorčenja'''
while 1:
        print('''1 - ENTROPIJA, INFORMACIJA \n2 - KODIRANJE \n3 - STISKANJE Z IZGUBAMI\n4 - STISKANJE BREZ IZGUB\n5 - KANALI\n6 - VARNO KODIRANJE\n7 - LINEARNI BLOCNI KODI\n8 - CIKLIČNI KODI\n9 - SIGNALI''')
        numInput = input("vnesi številko sklopa: " )
        numInput = int(numInput)
        params = ''
        if numInput == 1:
                params = vprasanja1.split('\n')
        elif numInput == 2:
                params = vprasanja2.split('\n')
        elif numInput == 3:
                params = vprasanja3.split('\n')
        elif numInput == 4:
                params = vprasanja4.split('\n')
        elif numInput == 5:
                params = vprasanja5.split('\n')
        elif numInput == 6:
                params = vprasanja6.split('\n')
        elif numInput == 7:
                params = vprasanja7.split('\n') 
        elif numInput == 8:
                params = vprasanja8.split('\n')   
        elif numInput == 9:
                params = vprasanja9.split('\n')                 
        while len(params) > 0 :
            vprasanje=random.choice(params)
            print(vprasanje+ "\n")
            params.remove(vprasanje)
            input("enter for next question " );
            

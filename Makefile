.PHONY: all ExtraLight Light Normal Regular Medium Bold Heavy

all: ExtraLight Light Normal Regular Medium Bold Heavy

ExtraLight: ttc/ResourceHanRounded-ExtraLight.ttc out/ResourceHanRoundedJ-ExtraLight.ttf out/ResourceHanRoundedK-ExtraLight.ttf out/ResourceHanRoundedSC-ExtraLight.ttf out/ResourceHanRoundedTC-ExtraLight.ttf out/ResourceHanRoundedHC-ExtraLight.ttf out/ResourceHanRoundedJP-ExtraLight.ttf out/ResourceHanRoundedKR-ExtraLight.ttf out/ResourceHanRoundedCN-ExtraLight.ttf out/ResourceHanRoundedTW-ExtraLight.ttf out/ResourceHanRoundedHK-ExtraLight.ttf

ttc/ResourceHanRounded-ExtraLight.ttc: out/ResourceHanRoundedJ-ExtraLight.ttf out/ResourceHanRoundedK-ExtraLight.ttf out/ResourceHanRoundedSC-ExtraLight.ttf out/ResourceHanRoundedTC-ExtraLight.ttf out/ResourceHanRoundedHC-ExtraLight.ttf
	mkdir -p ttc
	otf2otc -o $@ $<

out/ResourceHanRoundedJ-ExtraLight.otd: src/SourceHanSansJ-ExtraLight.otd
	mkdir -p out
	python round.py J ExtraLight

out/ResourceHanRoundedJ-ExtraLight.ttf: out/ResourceHanRoundedJ-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJ-ExtraLight.otd: src/SourceHanSansJ-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJ-ExtraLight.ttf: src/SourceHanSans-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedK-ExtraLight.otd: src/SourceHanSansK-ExtraLight.otd
	mkdir -p out
	python round.py K ExtraLight

out/ResourceHanRoundedK-ExtraLight.ttf: out/ResourceHanRoundedK-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansK-ExtraLight.otd: src/SourceHanSansK-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansK-ExtraLight.ttf: src/SourceHanSansK-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedSC-ExtraLight.otd: src/SourceHanSansSC-ExtraLight.otd
	mkdir -p out
	python round.py SC ExtraLight

out/ResourceHanRoundedSC-ExtraLight.ttf: out/ResourceHanRoundedSC-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansSC-ExtraLight.otd: src/SourceHanSansSC-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansSC-ExtraLight.ttf: src/SourceHanSansSC-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTC-ExtraLight.otd: src/SourceHanSansTC-ExtraLight.otd
	mkdir -p out
	python round.py TC ExtraLight

out/ResourceHanRoundedTC-ExtraLight.ttf: out/ResourceHanRoundedTC-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTC-ExtraLight.otd: src/SourceHanSansTC-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTC-ExtraLight.ttf: src/SourceHanSansTC-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHC-ExtraLight.otd: src/SourceHanSansHC-ExtraLight.otd
	mkdir -p out
	python round.py HC ExtraLight

out/ResourceHanRoundedHC-ExtraLight.ttf: out/ResourceHanRoundedHC-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHC-ExtraLight.otd: src/SourceHanSansHC-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHC-ExtraLight.ttf: src/SourceHanSansHC-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedJP-ExtraLight.otd: src/SourceHanSansJP-ExtraLight.otd
	mkdir -p out
	python round.py JP ExtraLight

out/ResourceHanRoundedJP-ExtraLight.ttf: out/ResourceHanRoundedJP-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJP-ExtraLight.otd: src/SourceHanSansJP-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJP-ExtraLight.ttf: src/SourceHanSansJP-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedKR-ExtraLight.otd: src/SourceHanSansKR-ExtraLight.otd
	mkdir -p out
	python round.py KR ExtraLight

out/ResourceHanRoundedKR-ExtraLight.ttf: out/ResourceHanRoundedKR-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansKR-ExtraLight.otd: src/SourceHanSansKR-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansKR-ExtraLight.ttf: src/SourceHanSansKR-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedCN-ExtraLight.otd: src/SourceHanSansCN-ExtraLight.otd
	mkdir -p out
	python round.py CN ExtraLight

out/ResourceHanRoundedCN-ExtraLight.ttf: out/ResourceHanRoundedCN-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansCN-ExtraLight.otd: src/SourceHanSansCN-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansCN-ExtraLight.ttf: src/SourceHanSansCN-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTW-ExtraLight.otd: src/SourceHanSansTW-ExtraLight.otd
	mkdir -p out
	python round.py TW ExtraLight

out/ResourceHanRoundedTW-ExtraLight.ttf: out/ResourceHanRoundedTW-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTW-ExtraLight.otd: src/SourceHanSansTW-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTW-ExtraLight.ttf: src/SourceHanSansTW-ExtraLight.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHK-ExtraLight.otd: src/SourceHanSansHK-ExtraLight.otd
	mkdir -p out
	python round.py HK ExtraLight

out/ResourceHanRoundedHK-ExtraLight.ttf: out/ResourceHanRoundedHK-ExtraLight.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHK-ExtraLight.otd: src/SourceHanSansHK-ExtraLight.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHK-ExtraLight.ttf: src/SourceHanSansHK-ExtraLight.otf
	otf2ttf -o $@ $<

Light: ttc/ResourceHanRounded-Light.ttc out/ResourceHanRoundedJ-Light.ttf out/ResourceHanRoundedK-Light.ttf out/ResourceHanRoundedSC-Light.ttf out/ResourceHanRoundedTC-Light.ttf out/ResourceHanRoundedHC-Light.ttf out/ResourceHanRoundedJP-Light.ttf out/ResourceHanRoundedKR-Light.ttf out/ResourceHanRoundedCN-Light.ttf out/ResourceHanRoundedTW-Light.ttf out/ResourceHanRoundedHK-Light.ttf

ttc/ResourceHanRounded-Light.ttc: out/ResourceHanRoundedJ-Light.ttf out/ResourceHanRoundedK-Light.ttf out/ResourceHanRoundedSC-Light.ttf out/ResourceHanRoundedTC-Light.ttf out/ResourceHanRoundedHC-Light.ttf
	mkdir -p ttc
	otf2otc -o $@ $<

out/ResourceHanRoundedJ-Light.otd: src/SourceHanSansJ-Light.otd
	mkdir -p out
	python round.py J Light

out/ResourceHanRoundedJ-Light.ttf: out/ResourceHanRoundedJ-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJ-Light.otd: src/SourceHanSansJ-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJ-Light.ttf: src/SourceHanSans-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedK-Light.otd: src/SourceHanSansK-Light.otd
	mkdir -p out
	python round.py K Light

out/ResourceHanRoundedK-Light.ttf: out/ResourceHanRoundedK-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansK-Light.otd: src/SourceHanSansK-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansK-Light.ttf: src/SourceHanSansK-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedSC-Light.otd: src/SourceHanSansSC-Light.otd
	mkdir -p out
	python round.py SC Light

out/ResourceHanRoundedSC-Light.ttf: out/ResourceHanRoundedSC-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansSC-Light.otd: src/SourceHanSansSC-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansSC-Light.ttf: src/SourceHanSansSC-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTC-Light.otd: src/SourceHanSansTC-Light.otd
	mkdir -p out
	python round.py TC Light

out/ResourceHanRoundedTC-Light.ttf: out/ResourceHanRoundedTC-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTC-Light.otd: src/SourceHanSansTC-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTC-Light.ttf: src/SourceHanSansTC-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHC-Light.otd: src/SourceHanSansHC-Light.otd
	mkdir -p out
	python round.py HC Light

out/ResourceHanRoundedHC-Light.ttf: out/ResourceHanRoundedHC-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHC-Light.otd: src/SourceHanSansHC-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHC-Light.ttf: src/SourceHanSansHC-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedJP-Light.otd: src/SourceHanSansJP-Light.otd
	mkdir -p out
	python round.py JP Light

out/ResourceHanRoundedJP-Light.ttf: out/ResourceHanRoundedJP-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJP-Light.otd: src/SourceHanSansJP-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJP-Light.ttf: src/SourceHanSansJP-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedKR-Light.otd: src/SourceHanSansKR-Light.otd
	mkdir -p out
	python round.py KR Light

out/ResourceHanRoundedKR-Light.ttf: out/ResourceHanRoundedKR-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansKR-Light.otd: src/SourceHanSansKR-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansKR-Light.ttf: src/SourceHanSansKR-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedCN-Light.otd: src/SourceHanSansCN-Light.otd
	mkdir -p out
	python round.py CN Light

out/ResourceHanRoundedCN-Light.ttf: out/ResourceHanRoundedCN-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansCN-Light.otd: src/SourceHanSansCN-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansCN-Light.ttf: src/SourceHanSansCN-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTW-Light.otd: src/SourceHanSansTW-Light.otd
	mkdir -p out
	python round.py TW Light

out/ResourceHanRoundedTW-Light.ttf: out/ResourceHanRoundedTW-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTW-Light.otd: src/SourceHanSansTW-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTW-Light.ttf: src/SourceHanSansTW-Light.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHK-Light.otd: src/SourceHanSansHK-Light.otd
	mkdir -p out
	python round.py HK Light

out/ResourceHanRoundedHK-Light.ttf: out/ResourceHanRoundedHK-Light.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHK-Light.otd: src/SourceHanSansHK-Light.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHK-Light.ttf: src/SourceHanSansHK-Light.otf
	otf2ttf -o $@ $<

Normal: ttc/ResourceHanRounded-Normal.ttc out/ResourceHanRoundedJ-Normal.ttf out/ResourceHanRoundedK-Normal.ttf out/ResourceHanRoundedSC-Normal.ttf out/ResourceHanRoundedTC-Normal.ttf out/ResourceHanRoundedHC-Normal.ttf out/ResourceHanRoundedJP-Normal.ttf out/ResourceHanRoundedKR-Normal.ttf out/ResourceHanRoundedCN-Normal.ttf out/ResourceHanRoundedTW-Normal.ttf out/ResourceHanRoundedHK-Normal.ttf

ttc/ResourceHanRounded-Normal.ttc: out/ResourceHanRoundedJ-Normal.ttf out/ResourceHanRoundedK-Normal.ttf out/ResourceHanRoundedSC-Normal.ttf out/ResourceHanRoundedTC-Normal.ttf out/ResourceHanRoundedHC-Normal.ttf
	mkdir -p ttc
	otf2otc -o $@ $<

out/ResourceHanRoundedJ-Normal.otd: src/SourceHanSansJ-Normal.otd
	mkdir -p out
	python round.py J Normal

out/ResourceHanRoundedJ-Normal.ttf: out/ResourceHanRoundedJ-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJ-Normal.otd: src/SourceHanSansJ-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJ-Normal.ttf: src/SourceHanSans-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedK-Normal.otd: src/SourceHanSansK-Normal.otd
	mkdir -p out
	python round.py K Normal

out/ResourceHanRoundedK-Normal.ttf: out/ResourceHanRoundedK-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansK-Normal.otd: src/SourceHanSansK-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansK-Normal.ttf: src/SourceHanSansK-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedSC-Normal.otd: src/SourceHanSansSC-Normal.otd
	mkdir -p out
	python round.py SC Normal

out/ResourceHanRoundedSC-Normal.ttf: out/ResourceHanRoundedSC-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansSC-Normal.otd: src/SourceHanSansSC-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansSC-Normal.ttf: src/SourceHanSansSC-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTC-Normal.otd: src/SourceHanSansTC-Normal.otd
	mkdir -p out
	python round.py TC Normal

out/ResourceHanRoundedTC-Normal.ttf: out/ResourceHanRoundedTC-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTC-Normal.otd: src/SourceHanSansTC-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTC-Normal.ttf: src/SourceHanSansTC-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHC-Normal.otd: src/SourceHanSansHC-Normal.otd
	mkdir -p out
	python round.py HC Normal

out/ResourceHanRoundedHC-Normal.ttf: out/ResourceHanRoundedHC-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHC-Normal.otd: src/SourceHanSansHC-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHC-Normal.ttf: src/SourceHanSansHC-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedJP-Normal.otd: src/SourceHanSansJP-Normal.otd
	mkdir -p out
	python round.py JP Normal

out/ResourceHanRoundedJP-Normal.ttf: out/ResourceHanRoundedJP-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJP-Normal.otd: src/SourceHanSansJP-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJP-Normal.ttf: src/SourceHanSansJP-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedKR-Normal.otd: src/SourceHanSansKR-Normal.otd
	mkdir -p out
	python round.py KR Normal

out/ResourceHanRoundedKR-Normal.ttf: out/ResourceHanRoundedKR-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansKR-Normal.otd: src/SourceHanSansKR-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansKR-Normal.ttf: src/SourceHanSansKR-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedCN-Normal.otd: src/SourceHanSansCN-Normal.otd
	mkdir -p out
	python round.py CN Normal

out/ResourceHanRoundedCN-Normal.ttf: out/ResourceHanRoundedCN-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansCN-Normal.otd: src/SourceHanSansCN-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansCN-Normal.ttf: src/SourceHanSansCN-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTW-Normal.otd: src/SourceHanSansTW-Normal.otd
	mkdir -p out
	python round.py TW Normal

out/ResourceHanRoundedTW-Normal.ttf: out/ResourceHanRoundedTW-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTW-Normal.otd: src/SourceHanSansTW-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTW-Normal.ttf: src/SourceHanSansTW-Normal.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHK-Normal.otd: src/SourceHanSansHK-Normal.otd
	mkdir -p out
	python round.py HK Normal

out/ResourceHanRoundedHK-Normal.ttf: out/ResourceHanRoundedHK-Normal.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHK-Normal.otd: src/SourceHanSansHK-Normal.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHK-Normal.ttf: src/SourceHanSansHK-Normal.otf
	otf2ttf -o $@ $<

Regular: ttc/ResourceHanRounded-Regular.ttc out/ResourceHanRoundedJ-Regular.ttf out/ResourceHanRoundedK-Regular.ttf out/ResourceHanRoundedSC-Regular.ttf out/ResourceHanRoundedTC-Regular.ttf out/ResourceHanRoundedHC-Regular.ttf out/ResourceHanRoundedJP-Regular.ttf out/ResourceHanRoundedKR-Regular.ttf out/ResourceHanRoundedCN-Regular.ttf out/ResourceHanRoundedTW-Regular.ttf out/ResourceHanRoundedHK-Regular.ttf

ttc/ResourceHanRounded-Regular.ttc: out/ResourceHanRoundedJ-Regular.ttf out/ResourceHanRoundedK-Regular.ttf out/ResourceHanRoundedSC-Regular.ttf out/ResourceHanRoundedTC-Regular.ttf out/ResourceHanRoundedHC-Regular.ttf
	mkdir -p ttc
	otf2otc -o $@ $<

out/ResourceHanRoundedJ-Regular.otd: src/SourceHanSansJ-Regular.otd
	mkdir -p out
	python round.py J Regular

out/ResourceHanRoundedJ-Regular.ttf: out/ResourceHanRoundedJ-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJ-Regular.otd: src/SourceHanSansJ-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJ-Regular.ttf: src/SourceHanSans-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedK-Regular.otd: src/SourceHanSansK-Regular.otd
	mkdir -p out
	python round.py K Regular

out/ResourceHanRoundedK-Regular.ttf: out/ResourceHanRoundedK-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansK-Regular.otd: src/SourceHanSansK-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansK-Regular.ttf: src/SourceHanSansK-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedSC-Regular.otd: src/SourceHanSansSC-Regular.otd
	mkdir -p out
	python round.py SC Regular

out/ResourceHanRoundedSC-Regular.ttf: out/ResourceHanRoundedSC-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansSC-Regular.otd: src/SourceHanSansSC-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansSC-Regular.ttf: src/SourceHanSansSC-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTC-Regular.otd: src/SourceHanSansTC-Regular.otd
	mkdir -p out
	python round.py TC Regular

out/ResourceHanRoundedTC-Regular.ttf: out/ResourceHanRoundedTC-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTC-Regular.otd: src/SourceHanSansTC-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTC-Regular.ttf: src/SourceHanSansTC-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHC-Regular.otd: src/SourceHanSansHC-Regular.otd
	mkdir -p out
	python round.py HC Regular

out/ResourceHanRoundedHC-Regular.ttf: out/ResourceHanRoundedHC-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHC-Regular.otd: src/SourceHanSansHC-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHC-Regular.ttf: src/SourceHanSansHC-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedJP-Regular.otd: src/SourceHanSansJP-Regular.otd
	mkdir -p out
	python round.py JP Regular

out/ResourceHanRoundedJP-Regular.ttf: out/ResourceHanRoundedJP-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJP-Regular.otd: src/SourceHanSansJP-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJP-Regular.ttf: src/SourceHanSansJP-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedKR-Regular.otd: src/SourceHanSansKR-Regular.otd
	mkdir -p out
	python round.py KR Regular

out/ResourceHanRoundedKR-Regular.ttf: out/ResourceHanRoundedKR-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansKR-Regular.otd: src/SourceHanSansKR-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansKR-Regular.ttf: src/SourceHanSansKR-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedCN-Regular.otd: src/SourceHanSansCN-Regular.otd
	mkdir -p out
	python round.py CN Regular

out/ResourceHanRoundedCN-Regular.ttf: out/ResourceHanRoundedCN-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansCN-Regular.otd: src/SourceHanSansCN-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansCN-Regular.ttf: src/SourceHanSansCN-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTW-Regular.otd: src/SourceHanSansTW-Regular.otd
	mkdir -p out
	python round.py TW Regular

out/ResourceHanRoundedTW-Regular.ttf: out/ResourceHanRoundedTW-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTW-Regular.otd: src/SourceHanSansTW-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTW-Regular.ttf: src/SourceHanSansTW-Regular.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHK-Regular.otd: src/SourceHanSansHK-Regular.otd
	mkdir -p out
	python round.py HK Regular

out/ResourceHanRoundedHK-Regular.ttf: out/ResourceHanRoundedHK-Regular.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHK-Regular.otd: src/SourceHanSansHK-Regular.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHK-Regular.ttf: src/SourceHanSansHK-Regular.otf
	otf2ttf -o $@ $<

Medium: ttc/ResourceHanRounded-Medium.ttc out/ResourceHanRoundedJ-Medium.ttf out/ResourceHanRoundedK-Medium.ttf out/ResourceHanRoundedSC-Medium.ttf out/ResourceHanRoundedTC-Medium.ttf out/ResourceHanRoundedHC-Medium.ttf out/ResourceHanRoundedJP-Medium.ttf out/ResourceHanRoundedKR-Medium.ttf out/ResourceHanRoundedCN-Medium.ttf out/ResourceHanRoundedTW-Medium.ttf out/ResourceHanRoundedHK-Medium.ttf

ttc/ResourceHanRounded-Medium.ttc: out/ResourceHanRoundedJ-Medium.ttf out/ResourceHanRoundedK-Medium.ttf out/ResourceHanRoundedSC-Medium.ttf out/ResourceHanRoundedTC-Medium.ttf out/ResourceHanRoundedHC-Medium.ttf
	mkdir -p ttc
	otf2otc -o $@ $<

out/ResourceHanRoundedJ-Medium.otd: src/SourceHanSansJ-Medium.otd
	mkdir -p out
	python round.py J Medium

out/ResourceHanRoundedJ-Medium.ttf: out/ResourceHanRoundedJ-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJ-Medium.otd: src/SourceHanSansJ-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJ-Medium.ttf: src/SourceHanSans-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedK-Medium.otd: src/SourceHanSansK-Medium.otd
	mkdir -p out
	python round.py K Medium

out/ResourceHanRoundedK-Medium.ttf: out/ResourceHanRoundedK-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansK-Medium.otd: src/SourceHanSansK-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansK-Medium.ttf: src/SourceHanSansK-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedSC-Medium.otd: src/SourceHanSansSC-Medium.otd
	mkdir -p out
	python round.py SC Medium

out/ResourceHanRoundedSC-Medium.ttf: out/ResourceHanRoundedSC-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansSC-Medium.otd: src/SourceHanSansSC-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansSC-Medium.ttf: src/SourceHanSansSC-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTC-Medium.otd: src/SourceHanSansTC-Medium.otd
	mkdir -p out
	python round.py TC Medium

out/ResourceHanRoundedTC-Medium.ttf: out/ResourceHanRoundedTC-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTC-Medium.otd: src/SourceHanSansTC-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTC-Medium.ttf: src/SourceHanSansTC-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHC-Medium.otd: src/SourceHanSansHC-Medium.otd
	mkdir -p out
	python round.py HC Medium

out/ResourceHanRoundedHC-Medium.ttf: out/ResourceHanRoundedHC-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHC-Medium.otd: src/SourceHanSansHC-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHC-Medium.ttf: src/SourceHanSansHC-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedJP-Medium.otd: src/SourceHanSansJP-Medium.otd
	mkdir -p out
	python round.py JP Medium

out/ResourceHanRoundedJP-Medium.ttf: out/ResourceHanRoundedJP-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJP-Medium.otd: src/SourceHanSansJP-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJP-Medium.ttf: src/SourceHanSansJP-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedKR-Medium.otd: src/SourceHanSansKR-Medium.otd
	mkdir -p out
	python round.py KR Medium

out/ResourceHanRoundedKR-Medium.ttf: out/ResourceHanRoundedKR-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansKR-Medium.otd: src/SourceHanSansKR-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansKR-Medium.ttf: src/SourceHanSansKR-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedCN-Medium.otd: src/SourceHanSansCN-Medium.otd
	mkdir -p out
	python round.py CN Medium

out/ResourceHanRoundedCN-Medium.ttf: out/ResourceHanRoundedCN-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansCN-Medium.otd: src/SourceHanSansCN-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansCN-Medium.ttf: src/SourceHanSansCN-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTW-Medium.otd: src/SourceHanSansTW-Medium.otd
	mkdir -p out
	python round.py TW Medium

out/ResourceHanRoundedTW-Medium.ttf: out/ResourceHanRoundedTW-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTW-Medium.otd: src/SourceHanSansTW-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTW-Medium.ttf: src/SourceHanSansTW-Medium.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHK-Medium.otd: src/SourceHanSansHK-Medium.otd
	mkdir -p out
	python round.py HK Medium

out/ResourceHanRoundedHK-Medium.ttf: out/ResourceHanRoundedHK-Medium.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHK-Medium.otd: src/SourceHanSansHK-Medium.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHK-Medium.ttf: src/SourceHanSansHK-Medium.otf
	otf2ttf -o $@ $<

Bold: ttc/ResourceHanRounded-Bold.ttc out/ResourceHanRoundedJ-Bold.ttf out/ResourceHanRoundedK-Bold.ttf out/ResourceHanRoundedSC-Bold.ttf out/ResourceHanRoundedTC-Bold.ttf out/ResourceHanRoundedHC-Bold.ttf out/ResourceHanRoundedJP-Bold.ttf out/ResourceHanRoundedKR-Bold.ttf out/ResourceHanRoundedCN-Bold.ttf out/ResourceHanRoundedTW-Bold.ttf out/ResourceHanRoundedHK-Bold.ttf

ttc/ResourceHanRounded-Bold.ttc: out/ResourceHanRoundedJ-Bold.ttf out/ResourceHanRoundedK-Bold.ttf out/ResourceHanRoundedSC-Bold.ttf out/ResourceHanRoundedTC-Bold.ttf out/ResourceHanRoundedHC-Bold.ttf
	mkdir -p ttc
	otf2otc -o $@ $<

out/ResourceHanRoundedJ-Bold.otd: src/SourceHanSansJ-Bold.otd
	mkdir -p out
	python round.py J Bold

out/ResourceHanRoundedJ-Bold.ttf: out/ResourceHanRoundedJ-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJ-Bold.otd: src/SourceHanSansJ-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJ-Bold.ttf: src/SourceHanSans-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedK-Bold.otd: src/SourceHanSansK-Bold.otd
	mkdir -p out
	python round.py K Bold

out/ResourceHanRoundedK-Bold.ttf: out/ResourceHanRoundedK-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansK-Bold.otd: src/SourceHanSansK-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansK-Bold.ttf: src/SourceHanSansK-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedSC-Bold.otd: src/SourceHanSansSC-Bold.otd
	mkdir -p out
	python round.py SC Bold

out/ResourceHanRoundedSC-Bold.ttf: out/ResourceHanRoundedSC-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansSC-Bold.otd: src/SourceHanSansSC-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansSC-Bold.ttf: src/SourceHanSansSC-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTC-Bold.otd: src/SourceHanSansTC-Bold.otd
	mkdir -p out
	python round.py TC Bold

out/ResourceHanRoundedTC-Bold.ttf: out/ResourceHanRoundedTC-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTC-Bold.otd: src/SourceHanSansTC-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTC-Bold.ttf: src/SourceHanSansTC-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHC-Bold.otd: src/SourceHanSansHC-Bold.otd
	mkdir -p out
	python round.py HC Bold

out/ResourceHanRoundedHC-Bold.ttf: out/ResourceHanRoundedHC-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHC-Bold.otd: src/SourceHanSansHC-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHC-Bold.ttf: src/SourceHanSansHC-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedJP-Bold.otd: src/SourceHanSansJP-Bold.otd
	mkdir -p out
	python round.py JP Bold

out/ResourceHanRoundedJP-Bold.ttf: out/ResourceHanRoundedJP-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJP-Bold.otd: src/SourceHanSansJP-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJP-Bold.ttf: src/SourceHanSansJP-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedKR-Bold.otd: src/SourceHanSansKR-Bold.otd
	mkdir -p out
	python round.py KR Bold

out/ResourceHanRoundedKR-Bold.ttf: out/ResourceHanRoundedKR-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansKR-Bold.otd: src/SourceHanSansKR-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansKR-Bold.ttf: src/SourceHanSansKR-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedCN-Bold.otd: src/SourceHanSansCN-Bold.otd
	mkdir -p out
	python round.py CN Bold

out/ResourceHanRoundedCN-Bold.ttf: out/ResourceHanRoundedCN-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansCN-Bold.otd: src/SourceHanSansCN-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansCN-Bold.ttf: src/SourceHanSansCN-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTW-Bold.otd: src/SourceHanSansTW-Bold.otd
	mkdir -p out
	python round.py TW Bold

out/ResourceHanRoundedTW-Bold.ttf: out/ResourceHanRoundedTW-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTW-Bold.otd: src/SourceHanSansTW-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTW-Bold.ttf: src/SourceHanSansTW-Bold.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHK-Bold.otd: src/SourceHanSansHK-Bold.otd
	mkdir -p out
	python round.py HK Bold

out/ResourceHanRoundedHK-Bold.ttf: out/ResourceHanRoundedHK-Bold.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHK-Bold.otd: src/SourceHanSansHK-Bold.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHK-Bold.ttf: src/SourceHanSansHK-Bold.otf
	otf2ttf -o $@ $<

Heavy: ttc/ResourceHanRounded-Heavy.ttc out/ResourceHanRoundedJ-Heavy.ttf out/ResourceHanRoundedK-Heavy.ttf out/ResourceHanRoundedSC-Heavy.ttf out/ResourceHanRoundedTC-Heavy.ttf out/ResourceHanRoundedHC-Heavy.ttf out/ResourceHanRoundedJP-Heavy.ttf out/ResourceHanRoundedKR-Heavy.ttf out/ResourceHanRoundedCN-Heavy.ttf out/ResourceHanRoundedTW-Heavy.ttf out/ResourceHanRoundedHK-Heavy.ttf

ttc/ResourceHanRounded-Heavy.ttc: out/ResourceHanRoundedJ-Heavy.ttf out/ResourceHanRoundedK-Heavy.ttf out/ResourceHanRoundedSC-Heavy.ttf out/ResourceHanRoundedTC-Heavy.ttf out/ResourceHanRoundedHC-Heavy.ttf
	mkdir -p ttc
	otf2otc -o $@ $<

out/ResourceHanRoundedJ-Heavy.otd: src/SourceHanSansJ-Heavy.otd
	mkdir -p out
	python round.py J Heavy

out/ResourceHanRoundedJ-Heavy.ttf: out/ResourceHanRoundedJ-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJ-Heavy.otd: src/SourceHanSansJ-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJ-Heavy.ttf: src/SourceHanSans-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedK-Heavy.otd: src/SourceHanSansK-Heavy.otd
	mkdir -p out
	python round.py K Heavy

out/ResourceHanRoundedK-Heavy.ttf: out/ResourceHanRoundedK-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansK-Heavy.otd: src/SourceHanSansK-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansK-Heavy.ttf: src/SourceHanSansK-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedSC-Heavy.otd: src/SourceHanSansSC-Heavy.otd
	mkdir -p out
	python round.py SC Heavy

out/ResourceHanRoundedSC-Heavy.ttf: out/ResourceHanRoundedSC-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansSC-Heavy.otd: src/SourceHanSansSC-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansSC-Heavy.ttf: src/SourceHanSansSC-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTC-Heavy.otd: src/SourceHanSansTC-Heavy.otd
	mkdir -p out
	python round.py TC Heavy

out/ResourceHanRoundedTC-Heavy.ttf: out/ResourceHanRoundedTC-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTC-Heavy.otd: src/SourceHanSansTC-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTC-Heavy.ttf: src/SourceHanSansTC-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHC-Heavy.otd: src/SourceHanSansHC-Heavy.otd
	mkdir -p out
	python round.py HC Heavy

out/ResourceHanRoundedHC-Heavy.ttf: out/ResourceHanRoundedHC-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHC-Heavy.otd: src/SourceHanSansHC-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHC-Heavy.ttf: src/SourceHanSansHC-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedJP-Heavy.otd: src/SourceHanSansJP-Heavy.otd
	mkdir -p out
	python round.py JP Heavy

out/ResourceHanRoundedJP-Heavy.ttf: out/ResourceHanRoundedJP-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansJP-Heavy.otd: src/SourceHanSansJP-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansJP-Heavy.ttf: src/SourceHanSansJP-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedKR-Heavy.otd: src/SourceHanSansKR-Heavy.otd
	mkdir -p out
	python round.py KR Heavy

out/ResourceHanRoundedKR-Heavy.ttf: out/ResourceHanRoundedKR-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansKR-Heavy.otd: src/SourceHanSansKR-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansKR-Heavy.ttf: src/SourceHanSansKR-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedCN-Heavy.otd: src/SourceHanSansCN-Heavy.otd
	mkdir -p out
	python round.py CN Heavy

out/ResourceHanRoundedCN-Heavy.ttf: out/ResourceHanRoundedCN-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansCN-Heavy.otd: src/SourceHanSansCN-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansCN-Heavy.ttf: src/SourceHanSansCN-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedTW-Heavy.otd: src/SourceHanSansTW-Heavy.otd
	mkdir -p out
	python round.py TW Heavy

out/ResourceHanRoundedTW-Heavy.ttf: out/ResourceHanRoundedTW-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansTW-Heavy.otd: src/SourceHanSansTW-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansTW-Heavy.ttf: src/SourceHanSansTW-Heavy.otf
	otf2ttf -o $@ $<

out/ResourceHanRoundedHK-Heavy.otd: src/SourceHanSansHK-Heavy.otd
	mkdir -p out
	python round.py HK Heavy

out/ResourceHanRoundedHK-Heavy.ttf: out/ResourceHanRoundedHK-Heavy.otd
	otfccbuild -O2 -o $@ $<

src/SourceHanSansHK-Heavy.otd: src/SourceHanSansHK-Heavy.ttf 
	otfccdump -o $@ $<

src/SourceHanSansHK-Heavy.ttf: src/SourceHanSansHK-Heavy.otf
	otf2ttf -o $@ $<


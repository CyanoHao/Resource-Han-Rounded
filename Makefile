.PHONY: all ExtraLight Light Normal Regular Medium Bold Heavy

all: ExtraLight Light Normal Regular Medium Bold Heavy

ExtraLight: ttc/MSOffice-RHR-ExtraLight.ttc out/MSOffice-RHR-J-ExtraLight.ttf out/MSOffice-RHR-K-ExtraLight.ttf out/MSOffice-RHR-SC-ExtraLight.ttf out/MSOffice-RHR-TC-ExtraLight.ttf out/MSOffice-RHR-HC-ExtraLight.ttf

ttc/MSOffice-RHR-ExtraLight.ttc: out/MSOffice-RHR-J-ExtraLight.ttf out/MSOffice-RHR-K-ExtraLight.ttf out/MSOffice-RHR-SC-ExtraLight.ttf out/MSOffice-RHR-TC-ExtraLight.ttf out/MSOffice-RHR-HC-ExtraLight.ttf
	mkdir -p ttc
	otf2otc -o $@ $^

out/MSOffice-RHR-J-ExtraLight.otd: src/SourceHanSansJ-ExtraLight.otd
	mkdir -p out
	python round.py J ExtraLight

out/MSOffice-RHR-J-ExtraLight.ttf: out/MSOffice-RHR-J-ExtraLight.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansJ-ExtraLight.otd: src/SourceHanSansJ-ExtraLight.ttf 
	otfccdump -o $@ $^

src/SourceHanSansJ-ExtraLight.ttf: src/SourceHanSans-ExtraLight.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-K-ExtraLight.otd: src/SourceHanSansK-ExtraLight.otd
	mkdir -p out
	python round.py K ExtraLight

out/MSOffice-RHR-K-ExtraLight.ttf: out/MSOffice-RHR-K-ExtraLight.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansK-ExtraLight.otd: src/SourceHanSansK-ExtraLight.ttf 
	otfccdump -o $@ $^

src/SourceHanSansK-ExtraLight.ttf: src/SourceHanSansK-ExtraLight.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-SC-ExtraLight.otd: src/SourceHanSansSC-ExtraLight.otd
	mkdir -p out
	python round.py SC ExtraLight

out/MSOffice-RHR-SC-ExtraLight.ttf: out/MSOffice-RHR-SC-ExtraLight.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansSC-ExtraLight.otd: src/SourceHanSansSC-ExtraLight.ttf 
	otfccdump -o $@ $^

src/SourceHanSansSC-ExtraLight.ttf: src/SourceHanSansSC-ExtraLight.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-TC-ExtraLight.otd: src/SourceHanSansTC-ExtraLight.otd
	mkdir -p out
	python round.py TC ExtraLight

out/MSOffice-RHR-TC-ExtraLight.ttf: out/MSOffice-RHR-TC-ExtraLight.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansTC-ExtraLight.otd: src/SourceHanSansTC-ExtraLight.ttf 
	otfccdump -o $@ $^

src/SourceHanSansTC-ExtraLight.ttf: src/SourceHanSansTC-ExtraLight.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-HC-ExtraLight.otd: src/SourceHanSansHC-ExtraLight.otd
	mkdir -p out
	python round.py HC ExtraLight

out/MSOffice-RHR-HC-ExtraLight.ttf: out/MSOffice-RHR-HC-ExtraLight.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansHC-ExtraLight.otd: src/SourceHanSansHC-ExtraLight.ttf 
	otfccdump -o $@ $^

src/SourceHanSansHC-ExtraLight.ttf: src/SourceHanSansHC-ExtraLight.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

Light: ttc/MSOffice-RHR-Light.ttc out/MSOffice-RHR-J-Light.ttf out/MSOffice-RHR-K-Light.ttf out/MSOffice-RHR-SC-Light.ttf out/MSOffice-RHR-TC-Light.ttf out/MSOffice-RHR-HC-Light.ttf

ttc/MSOffice-RHR-Light.ttc: out/MSOffice-RHR-J-Light.ttf out/MSOffice-RHR-K-Light.ttf out/MSOffice-RHR-SC-Light.ttf out/MSOffice-RHR-TC-Light.ttf out/MSOffice-RHR-HC-Light.ttf
	mkdir -p ttc
	otf2otc -o $@ $^

out/MSOffice-RHR-J-Light.otd: src/SourceHanSansJ-Light.otd
	mkdir -p out
	python round.py J Light

out/MSOffice-RHR-J-Light.ttf: out/MSOffice-RHR-J-Light.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansJ-Light.otd: src/SourceHanSansJ-Light.ttf 
	otfccdump -o $@ $^

src/SourceHanSansJ-Light.ttf: src/SourceHanSans-Light.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-K-Light.otd: src/SourceHanSansK-Light.otd
	mkdir -p out
	python round.py K Light

out/MSOffice-RHR-K-Light.ttf: out/MSOffice-RHR-K-Light.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansK-Light.otd: src/SourceHanSansK-Light.ttf 
	otfccdump -o $@ $^

src/SourceHanSansK-Light.ttf: src/SourceHanSansK-Light.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-SC-Light.otd: src/SourceHanSansSC-Light.otd
	mkdir -p out
	python round.py SC Light

out/MSOffice-RHR-SC-Light.ttf: out/MSOffice-RHR-SC-Light.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansSC-Light.otd: src/SourceHanSansSC-Light.ttf 
	otfccdump -o $@ $^

src/SourceHanSansSC-Light.ttf: src/SourceHanSansSC-Light.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-TC-Light.otd: src/SourceHanSansTC-Light.otd
	mkdir -p out
	python round.py TC Light

out/MSOffice-RHR-TC-Light.ttf: out/MSOffice-RHR-TC-Light.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansTC-Light.otd: src/SourceHanSansTC-Light.ttf 
	otfccdump -o $@ $^

src/SourceHanSansTC-Light.ttf: src/SourceHanSansTC-Light.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-HC-Light.otd: src/SourceHanSansHC-Light.otd
	mkdir -p out
	python round.py HC Light

out/MSOffice-RHR-HC-Light.ttf: out/MSOffice-RHR-HC-Light.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansHC-Light.otd: src/SourceHanSansHC-Light.ttf 
	otfccdump -o $@ $^

src/SourceHanSansHC-Light.ttf: src/SourceHanSansHC-Light.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

Normal: ttc/MSOffice-RHR-Normal.ttc out/MSOffice-RHR-J-Normal.ttf out/MSOffice-RHR-K-Normal.ttf out/MSOffice-RHR-SC-Normal.ttf out/MSOffice-RHR-TC-Normal.ttf out/MSOffice-RHR-HC-Normal.ttf

ttc/MSOffice-RHR-Normal.ttc: out/MSOffice-RHR-J-Normal.ttf out/MSOffice-RHR-K-Normal.ttf out/MSOffice-RHR-SC-Normal.ttf out/MSOffice-RHR-TC-Normal.ttf out/MSOffice-RHR-HC-Normal.ttf
	mkdir -p ttc
	otf2otc -o $@ $^

out/MSOffice-RHR-J-Normal.otd: src/SourceHanSansJ-Normal.otd
	mkdir -p out
	python round.py J Normal

out/MSOffice-RHR-J-Normal.ttf: out/MSOffice-RHR-J-Normal.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansJ-Normal.otd: src/SourceHanSansJ-Normal.ttf 
	otfccdump -o $@ $^

src/SourceHanSansJ-Normal.ttf: src/SourceHanSans-Normal.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-K-Normal.otd: src/SourceHanSansK-Normal.otd
	mkdir -p out
	python round.py K Normal

out/MSOffice-RHR-K-Normal.ttf: out/MSOffice-RHR-K-Normal.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansK-Normal.otd: src/SourceHanSansK-Normal.ttf 
	otfccdump -o $@ $^

src/SourceHanSansK-Normal.ttf: src/SourceHanSansK-Normal.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-SC-Normal.otd: src/SourceHanSansSC-Normal.otd
	mkdir -p out
	python round.py SC Normal

out/MSOffice-RHR-SC-Normal.ttf: out/MSOffice-RHR-SC-Normal.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansSC-Normal.otd: src/SourceHanSansSC-Normal.ttf 
	otfccdump -o $@ $^

src/SourceHanSansSC-Normal.ttf: src/SourceHanSansSC-Normal.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-TC-Normal.otd: src/SourceHanSansTC-Normal.otd
	mkdir -p out
	python round.py TC Normal

out/MSOffice-RHR-TC-Normal.ttf: out/MSOffice-RHR-TC-Normal.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansTC-Normal.otd: src/SourceHanSansTC-Normal.ttf 
	otfccdump -o $@ $^

src/SourceHanSansTC-Normal.ttf: src/SourceHanSansTC-Normal.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-HC-Normal.otd: src/SourceHanSansHC-Normal.otd
	mkdir -p out
	python round.py HC Normal

out/MSOffice-RHR-HC-Normal.ttf: out/MSOffice-RHR-HC-Normal.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansHC-Normal.otd: src/SourceHanSansHC-Normal.ttf 
	otfccdump -o $@ $^

src/SourceHanSansHC-Normal.ttf: src/SourceHanSansHC-Normal.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

Regular: ttc/MSOffice-RHR-Regular.ttc out/MSOffice-RHR-J-Regular.ttf out/MSOffice-RHR-K-Regular.ttf out/MSOffice-RHR-SC-Regular.ttf out/MSOffice-RHR-TC-Regular.ttf out/MSOffice-RHR-HC-Regular.ttf

ttc/MSOffice-RHR-Regular.ttc: out/MSOffice-RHR-J-Regular.ttf out/MSOffice-RHR-K-Regular.ttf out/MSOffice-RHR-SC-Regular.ttf out/MSOffice-RHR-TC-Regular.ttf out/MSOffice-RHR-HC-Regular.ttf
	mkdir -p ttc
	otf2otc -o $@ $^

out/MSOffice-RHR-J-Regular.otd: src/SourceHanSansJ-Regular.otd
	mkdir -p out
	python round.py J Regular

out/MSOffice-RHR-J-Regular.ttf: out/MSOffice-RHR-J-Regular.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansJ-Regular.otd: src/SourceHanSansJ-Regular.ttf 
	otfccdump -o $@ $^

src/SourceHanSansJ-Regular.ttf: src/SourceHanSans-Regular.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-K-Regular.otd: src/SourceHanSansK-Regular.otd
	mkdir -p out
	python round.py K Regular

out/MSOffice-RHR-K-Regular.ttf: out/MSOffice-RHR-K-Regular.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansK-Regular.otd: src/SourceHanSansK-Regular.ttf 
	otfccdump -o $@ $^

src/SourceHanSansK-Regular.ttf: src/SourceHanSansK-Regular.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-SC-Regular.otd: src/SourceHanSansSC-Regular.otd
	mkdir -p out
	python round.py SC Regular

out/MSOffice-RHR-SC-Regular.ttf: out/MSOffice-RHR-SC-Regular.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansSC-Regular.otd: src/SourceHanSansSC-Regular.ttf 
	otfccdump -o $@ $^

src/SourceHanSansSC-Regular.ttf: src/SourceHanSansSC-Regular.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-TC-Regular.otd: src/SourceHanSansTC-Regular.otd
	mkdir -p out
	python round.py TC Regular

out/MSOffice-RHR-TC-Regular.ttf: out/MSOffice-RHR-TC-Regular.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansTC-Regular.otd: src/SourceHanSansTC-Regular.ttf 
	otfccdump -o $@ $^

src/SourceHanSansTC-Regular.ttf: src/SourceHanSansTC-Regular.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-HC-Regular.otd: src/SourceHanSansHC-Regular.otd
	mkdir -p out
	python round.py HC Regular

out/MSOffice-RHR-HC-Regular.ttf: out/MSOffice-RHR-HC-Regular.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansHC-Regular.otd: src/SourceHanSansHC-Regular.ttf 
	otfccdump -o $@ $^

src/SourceHanSansHC-Regular.ttf: src/SourceHanSansHC-Regular.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

Medium: ttc/MSOffice-RHR-Medium.ttc out/MSOffice-RHR-J-Medium.ttf out/MSOffice-RHR-K-Medium.ttf out/MSOffice-RHR-SC-Medium.ttf out/MSOffice-RHR-TC-Medium.ttf out/MSOffice-RHR-HC-Medium.ttf

ttc/MSOffice-RHR-Medium.ttc: out/MSOffice-RHR-J-Medium.ttf out/MSOffice-RHR-K-Medium.ttf out/MSOffice-RHR-SC-Medium.ttf out/MSOffice-RHR-TC-Medium.ttf out/MSOffice-RHR-HC-Medium.ttf
	mkdir -p ttc
	otf2otc -o $@ $^

out/MSOffice-RHR-J-Medium.otd: src/SourceHanSansJ-Medium.otd
	mkdir -p out
	python round.py J Medium

out/MSOffice-RHR-J-Medium.ttf: out/MSOffice-RHR-J-Medium.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansJ-Medium.otd: src/SourceHanSansJ-Medium.ttf 
	otfccdump -o $@ $^

src/SourceHanSansJ-Medium.ttf: src/SourceHanSans-Medium.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-K-Medium.otd: src/SourceHanSansK-Medium.otd
	mkdir -p out
	python round.py K Medium

out/MSOffice-RHR-K-Medium.ttf: out/MSOffice-RHR-K-Medium.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansK-Medium.otd: src/SourceHanSansK-Medium.ttf 
	otfccdump -o $@ $^

src/SourceHanSansK-Medium.ttf: src/SourceHanSansK-Medium.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-SC-Medium.otd: src/SourceHanSansSC-Medium.otd
	mkdir -p out
	python round.py SC Medium

out/MSOffice-RHR-SC-Medium.ttf: out/MSOffice-RHR-SC-Medium.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansSC-Medium.otd: src/SourceHanSansSC-Medium.ttf 
	otfccdump -o $@ $^

src/SourceHanSansSC-Medium.ttf: src/SourceHanSansSC-Medium.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-TC-Medium.otd: src/SourceHanSansTC-Medium.otd
	mkdir -p out
	python round.py TC Medium

out/MSOffice-RHR-TC-Medium.ttf: out/MSOffice-RHR-TC-Medium.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansTC-Medium.otd: src/SourceHanSansTC-Medium.ttf 
	otfccdump -o $@ $^

src/SourceHanSansTC-Medium.ttf: src/SourceHanSansTC-Medium.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-HC-Medium.otd: src/SourceHanSansHC-Medium.otd
	mkdir -p out
	python round.py HC Medium

out/MSOffice-RHR-HC-Medium.ttf: out/MSOffice-RHR-HC-Medium.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansHC-Medium.otd: src/SourceHanSansHC-Medium.ttf 
	otfccdump -o $@ $^

src/SourceHanSansHC-Medium.ttf: src/SourceHanSansHC-Medium.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

Bold: ttc/MSOffice-RHR-Bold.ttc out/MSOffice-RHR-J-Bold.ttf out/MSOffice-RHR-K-Bold.ttf out/MSOffice-RHR-SC-Bold.ttf out/MSOffice-RHR-TC-Bold.ttf out/MSOffice-RHR-HC-Bold.ttf

ttc/MSOffice-RHR-Bold.ttc: out/MSOffice-RHR-J-Bold.ttf out/MSOffice-RHR-K-Bold.ttf out/MSOffice-RHR-SC-Bold.ttf out/MSOffice-RHR-TC-Bold.ttf out/MSOffice-RHR-HC-Bold.ttf
	mkdir -p ttc
	otf2otc -o $@ $^

out/MSOffice-RHR-J-Bold.otd: src/SourceHanSansJ-Bold.otd
	mkdir -p out
	python round.py J Bold

out/MSOffice-RHR-J-Bold.ttf: out/MSOffice-RHR-J-Bold.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansJ-Bold.otd: src/SourceHanSansJ-Bold.ttf 
	otfccdump -o $@ $^

src/SourceHanSansJ-Bold.ttf: src/SourceHanSans-Bold.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-K-Bold.otd: src/SourceHanSansK-Bold.otd
	mkdir -p out
	python round.py K Bold

out/MSOffice-RHR-K-Bold.ttf: out/MSOffice-RHR-K-Bold.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansK-Bold.otd: src/SourceHanSansK-Bold.ttf 
	otfccdump -o $@ $^

src/SourceHanSansK-Bold.ttf: src/SourceHanSansK-Bold.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-SC-Bold.otd: src/SourceHanSansSC-Bold.otd
	mkdir -p out
	python round.py SC Bold

out/MSOffice-RHR-SC-Bold.ttf: out/MSOffice-RHR-SC-Bold.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansSC-Bold.otd: src/SourceHanSansSC-Bold.ttf 
	otfccdump -o $@ $^

src/SourceHanSansSC-Bold.ttf: src/SourceHanSansSC-Bold.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-TC-Bold.otd: src/SourceHanSansTC-Bold.otd
	mkdir -p out
	python round.py TC Bold

out/MSOffice-RHR-TC-Bold.ttf: out/MSOffice-RHR-TC-Bold.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansTC-Bold.otd: src/SourceHanSansTC-Bold.ttf 
	otfccdump -o $@ $^

src/SourceHanSansTC-Bold.ttf: src/SourceHanSansTC-Bold.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-HC-Bold.otd: src/SourceHanSansHC-Bold.otd
	mkdir -p out
	python round.py HC Bold

out/MSOffice-RHR-HC-Bold.ttf: out/MSOffice-RHR-HC-Bold.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansHC-Bold.otd: src/SourceHanSansHC-Bold.ttf 
	otfccdump -o $@ $^

src/SourceHanSansHC-Bold.ttf: src/SourceHanSansHC-Bold.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

Heavy: ttc/MSOffice-RHR-Heavy.ttc out/MSOffice-RHR-J-Heavy.ttf out/MSOffice-RHR-K-Heavy.ttf out/MSOffice-RHR-SC-Heavy.ttf out/MSOffice-RHR-TC-Heavy.ttf out/MSOffice-RHR-HC-Heavy.ttf

ttc/MSOffice-RHR-Heavy.ttc: out/MSOffice-RHR-J-Heavy.ttf out/MSOffice-RHR-K-Heavy.ttf out/MSOffice-RHR-SC-Heavy.ttf out/MSOffice-RHR-TC-Heavy.ttf out/MSOffice-RHR-HC-Heavy.ttf
	mkdir -p ttc
	otf2otc -o $@ $^

out/MSOffice-RHR-J-Heavy.otd: src/SourceHanSansJ-Heavy.otd
	mkdir -p out
	python round.py J Heavy

out/MSOffice-RHR-J-Heavy.ttf: out/MSOffice-RHR-J-Heavy.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansJ-Heavy.otd: src/SourceHanSansJ-Heavy.ttf 
	otfccdump -o $@ $^

src/SourceHanSansJ-Heavy.ttf: src/SourceHanSans-Heavy.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-K-Heavy.otd: src/SourceHanSansK-Heavy.otd
	mkdir -p out
	python round.py K Heavy

out/MSOffice-RHR-K-Heavy.ttf: out/MSOffice-RHR-K-Heavy.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansK-Heavy.otd: src/SourceHanSansK-Heavy.ttf 
	otfccdump -o $@ $^

src/SourceHanSansK-Heavy.ttf: src/SourceHanSansK-Heavy.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-SC-Heavy.otd: src/SourceHanSansSC-Heavy.otd
	mkdir -p out
	python round.py SC Heavy

out/MSOffice-RHR-SC-Heavy.ttf: out/MSOffice-RHR-SC-Heavy.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansSC-Heavy.otd: src/SourceHanSansSC-Heavy.ttf 
	otfccdump -o $@ $^

src/SourceHanSansSC-Heavy.ttf: src/SourceHanSansSC-Heavy.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-TC-Heavy.otd: src/SourceHanSansTC-Heavy.otd
	mkdir -p out
	python round.py TC Heavy

out/MSOffice-RHR-TC-Heavy.ttf: out/MSOffice-RHR-TC-Heavy.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansTC-Heavy.otd: src/SourceHanSansTC-Heavy.ttf 
	otfccdump -o $@ $^

src/SourceHanSansTC-Heavy.ttf: src/SourceHanSansTC-Heavy.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@

out/MSOffice-RHR-HC-Heavy.otd: src/SourceHanSansHC-Heavy.otd
	mkdir -p out
	python round.py HC Heavy

out/MSOffice-RHR-HC-Heavy.ttf: out/MSOffice-RHR-HC-Heavy.otd
	otfccbuild -O2 -s -o $@ $^

src/SourceHanSansHC-Heavy.otd: src/SourceHanSansHC-Heavy.ttf 
	otfccdump -o $@ $^

src/SourceHanSansHC-Heavy.ttf: src/SourceHanSansHC-Heavy.otf
	otfccdump --ignore-hints $^ | otfcc-c2q | otfccbuild -O2 -o $@


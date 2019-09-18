# Resource Han Rounded

This font is derived from [Source Han Sans](https://github.com/adobe-fonts/source-han-sans).

![Preview](preview.png)

## Download

[Latest Release](https://github.com/CyanoHao/Resource-Han-Rounded/releases).

* **TTF**: language-specific TTFs, recommended for legacy typographic technology or futher development.
* **TTC**: pack 5 TTFs to a single TTC file for each weight, recommended for modern typographic technology.
* **CN** / **TW** / **HK** / **JP** / **KR**: region-specific subset TTFs, following [Source Han Sans](https://github.com/adobe-fonts/source-han-sans) notations.

## How to Build

Dependencies:
+ Python;
+ [afdko](https://pypi.org/project/afdko/);
+ [otfcc](https://github.com/caryll/otfcc).

Put SHS files (OTF and Subset OTF) into `src/`, then
```bash
./configure
make -j<threads>
```

**Note**: `make`-ing all variants × all weights will take hours and much disk space. To make a specific font, run
```bash
make out/ResourceHanRounded<var>-<w>.ttf
```
where `<var>` can be one of `J`, `K`, `SC`, `TC`, `HC`, `JP`, `KR`, `CN`, `TW`, `HK`, and `<w>` can be one of `ExtraLight`, `Light`, `Normal`, `Regular`, `Medium`, `Bold`, `Heavy`.

## Credits

[Source Han Sans](https://github.com/adobe-fonts/source-han-sans) is a high quality open source typeface released by Adobe and Google.

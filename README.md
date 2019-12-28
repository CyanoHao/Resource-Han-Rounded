# Resource Han Rounded for Microsoft Office

Resource Han Rounded with shorter name.

| Typographic Subfamily | Font Family (NameID 1) | Font Subfamily (NameID 2) | MSOffice Font Menu       |
| --------------------- | ---------------------- | ------------------------- | ------------------------ |
| ExtraLight            | RHR _Region_ XLt       | Regular                   | RHR _Region_ XLt         |
| Light                 | RHR _Region_ Lt        | Regular                   | RHR _Region_ Lt          |
| Normal                | RHR _Region_ Nm        | Regular                   | RHR _Region_ Nm          |
| Regular               | RHR _Region_           | Regular                   | RHR _Region_             |
| Medium                | RHR _Region_ Md        | Regular                   | RHR _Region_ Md          |
| Bold                  | RHR _Region_           | Bold                      | (linked to RHR _Region_) |
| Heavy                 | RHR _Region_ Hv        | Regular                   | RHR _Region_ Hv          |

## Download

Distributions can be found at a [seperate repo](https://github.com/CyanoHao/MSOffice-RHR/releases).

## How to Build

Dependencies: Python, [otfcc](https://github.com/caryll/otfcc), [otfcc-c2q](https://www.npmjs.com/package/otfcc-c2q), [afdko](https://pypi.org/project/afdko/).

Put SHS files (OTF) into `src/`, then
```bash
./configure
make -j<threads>
```

**Note**: `make`-ing all variants × all weights will take hours and much disk space. To make a specific font, run
```bash
make out/ResourceHanRounded<var>-<w>.ttf
```
where `<var>` can be one of `J`, `K`, `SC`, `TC`, `HC`, and `<w>` can be one of `ExtraLight`, `Light`, `Normal`, `Regular`, `Medium`, `Bold`, `Heavy`.

## Credits

[Source Han Sans](https://github.com/adobe-fonts/source-han-sans) is a high quality open source typeface released by Adobe and Google.

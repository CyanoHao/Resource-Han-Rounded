# Resource Han Rounded

This font is derived from [Source Han Sans](https://github.com/adobe-fonts/source-han-sans).

[Live preview: font variation](https://nowar-fonts.github.io/rhr-next/)

![Preview: weight and orthography](res/preview.png)

![Preview: roundness variation](res/roundness.png)

## Download & Deployment Configurations

[Pre-release](https://github.com/CyanoHao/Resource-Han-Rounded/releases).

The pre-release currently only includes OpenType/CFF2 variable font configuration.

For usage with Microsoft Office series software, please visit [MSOffice-RHR](https://github.com/CyanoHao/MSOffice-RHR) for a shorter name version to prevent bugs in software.

### Configuration: OpenType/CFF2 Variable Font

OpenType/CFF2 variable font (theoretically) works with Windows 10 1803+, macOS 10.15+, Linux with FreeType 2.8+. However, latest OS releases are always recommended because early releases may have critical bugs like [source-han-sans#290](https://github.com/adobe-fonts/source-han-sans/issues/290) with this format.

* **OTC**: pack 5 language-specific OTFs to a single OTC file, recommended for latest OS.
* **OTF**: language-specific OTFs for developers and Windows 10 1809 users.
* **Subset OTF** (CN/TW/HK/JP/KR): region-specific subset OTFs, following [Source Han Sans](https://github.com/adobe-fonts/source-han-sans) notations.

## How to Build

Resource Han Rounded can be built on Linux or WSL (2).

Note: GNU userland is assumed in makefile. macOS is not tested.

**WARNING**: Each job requires ~12 GiB memory at peak.

Dependencies:

- [Node.js](https://nodejs.org/).

Put Source Han Sans variable OTF and subset OTF files (5 + 5 = 10 files) to `src/`, and run:

```bash
npm install
node configure.js >Makefile
make -j<n> all
```

Other `make` targets:

* `cff2-vf`: OpenType/CFF2 OTFs and subset OTFs.

## Credits

[Source Han Sans](https://github.com/adobe-fonts/source-han-sans) is a high quality open source typeface released by Adobe and Google.

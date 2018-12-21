import json
import math
import cmath

# round conners of a glyph, assume outer outline is clockwise and inner outline in anti-clockwise

def MergeNearPoints(glyph, threshold):
    if 'contours' not in glyph:
        return
    for contour in glyph['contours']:
        # do merge until nothing to merge
        merged = True
        while merged:
            merged = False
            i = 0
            while i < len(contour):
                nextPointIndex = (0 if i + 1 == len(contour) else i + 1)
                thisToNext = complex(contour[nextPointIndex]['x'] - contour[i]['x'], contour[nextPointIndex]['y'] - contour[i]['y'])
                if abs(thisToNext) >= threshold:
                    i += 1
                    continue
                
                merged = True
                # they are equal, merge to center
                if contour[i]['on'] == contour[nextPointIndex]['on']:
                    contour[nextPointIndex]['x'] = (contour[i]['x'] + contour[nextPointIndex]['x']) / 2
                    contour[nextPointIndex]['y'] = (contour[i]['y'] + contour[nextPointIndex]['y']) / 2
                    del contour[i]
                # this one is more important
                elif contour[i]['on']:
                    del contour[nextPointIndex]
                # next one is more important
                else:
                    del contour[i]

def RoundGlyph(glyph, outerRadius, innerRadius):
    if 'contours' not in glyph:
        return
    MergeNearPoints(glyph, math.sqrt(outerRadius * innerRadius))
    for contour in glyph['contours']:
        i = 0
        prevPointIndex = -1
        while i < len(contour):

            # control point, pass
            if not contour[i]['on']:
                prevPointIndex = i
                i += 1
                continue

            prevToThis = complex(contour[i]['x'] - contour[prevPointIndex]['x'], contour[i]['y'] - contour[prevPointIndex]['y'])
            nextPointIndex = (0 if i + 1 == len(contour) else i + 1)
            thisToNext = complex(contour[nextPointIndex]['x'] - contour[i]['x'], contour[nextPointIndex]['y'] - contour[i]['y'])
            angle = cmath.phase(thisToNext / prevToThis)
            isCollinear = abs(angle) < math.pi / 180

            # curve point or tangent point, pass
            if isCollinear:
                prevPointIndex = i
                i += 1
                continue

            # conner point:
            radius = outerRadius if angle < 0 else innerRadius

            # change this connor point to control point
            contour[i]['on'] = False

            prevPointIndex = i

            # do not insert new on-curve point if no space for radius, just let it go
            if abs(prevToThis) > 2 * radius:
                contour.insert(i, {
                    'x': contour[i]['x'] - radius * math.cos(cmath.phase(prevToThis)),
                    'y': contour[i]['y'] - radius * math.sin(cmath.phase(prevToThis)),
                    'on': True})
                prevPointIndex += 1
                i += 1

            if abs(thisToNext) > 2 * radius:
                contour.insert(i + 1, {
                    'x': contour[i]['x'] + radius * math.cos(cmath.phase(thisToNext)),
                    'y': contour[i]['y'] + radius * math.sin(cmath.phase(thisToNext)),
                    'on': True})
                i += 1

            i += 1

def RoundFont():

    with open("SourceHanSansCN-Medium.otd", 'rb') as baseFile:
        baseFont = json.loads(
            baseFile.read().decode('UTF-8', errors='replace'))

    # Name, Copyright and License
    baseFont['OS_2']['achVendID'] = 'Cyan'

    baseFont['name'] = [
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 0,
            "nameString": "Copyright © 2018 Cyano Hao. Portions © 2014, 2015, 2018 Adobe (http://www.adobe.com/)."
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 1,
            "nameString": "Resource Han Rounded CN Medium"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 2,
            "nameString": "Regular"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 3,
            "nameString": "Resource Han Rounded CN Medium 1.9.9"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 4,
            "nameString": "Resource Han Rounded CN Medium"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 5,
            "nameString": "1.9.9"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 6,
            "nameString": "Resource-Han-Rounded-CN-Medium"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 8,
            "nameString": "Cyano Hao"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 9,
            "nameString": "Cyano Hao (round all glyphs); Ryoko NISHIZUKA 西塚涼子 (kana, bopomofo & ideographs); Paul D. Hunt (Latin, Greek & Cyrillic); Sandoll Communications 산돌커뮤니케이션, Soo-young JANG 장수영 & Joo-yeon KANG 강주연 (hangul elements, letters & syllables); Dr. Ken Lunde (project architect, glyph set definition & overall production); Masataka HATTORI 服部正貴 (production & ideograph elements)"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 11,
            "nameString": "https://github.com/CyanoHao"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 13,
            "nameString": "This Font Software is licensed under the SIL Open Font License, Version 1.1. This Font Software is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the SIL Open Font License for the specific language, permissions and limitations governing your use of this Font Software."
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 14,
            "nameString": "http://scripts.sil.org/OFL"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 16,
            "nameString": "Resource Han Rounded CN"
        },
        {
            "platformID": 3,
            "encodingID": 1,
            "languageID": 1033,
            "nameID": 17,
            "nameString": "Medium"
        }
    ]

    for (_, glyph) in baseFont['glyf'].items():
    	RoundGlyph(glyph, 50, 10)

    # output
    outStr = json.dumps(baseFont, ensure_ascii=False)
    with open("ResourceHanRoundedCN-Medium.otd", 'w') as outFile:
        outFile.write(outStr)


RoundFont()

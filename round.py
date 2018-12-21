import json
import math
import cmath

def ComplexVector(point1, point2):
	return complex(point2['x'] - point1['x'], point2['y'] - point1['y'])

def Distance(point1, point2):
	return abs(ComplexVector(point1, point2))

def Get(contour, index, advance = 0):
	index += advance
	return contour[index % len(contour)]

def MergeNearPoints(contour, threshold = 3):
	# do merge until nothing to merge
	merged = True
	while merged:
		merged = False
		i = 0
		while i < len(contour):
			this = Get(contour, i)
			nextP = Get(contour, i, 1)
			thisToNext = ComplexVector(this, nextP)
			if abs(thisToNext) >= threshold:
				i += 1
				continue

			merged = True
			# they are equal, merge to center
			if this['on'] == nextP['on']:
				nextP['x'] = (this['x'] + nextP['x']) / 2
				nextP['y'] = (this['y'] + nextP['y']) / 2
				contour.remove(this)
			# this one is more important
			elif this['on']:
				contour.remove(nextP)
			# next one is more important
			else:
				contour.remove(this)

def MergeAlmostCollinear(contour, tolerance = math.pi / 60, shortEdgeLimit = 90):
	# do merge until nothing to merge
	merged = True
	while merged:
		merged = False
		i = 0
		
		while i < len(contour):
			prev = Get(contour, i, -1)
			this = Get(contour, i)
			nextP = Get(contour, i, 1)

			# this is a tangent point, cannot merge
			if (prev['on'] and this['on'] and not nextP['on']) or (not prev['on'] and this['on'] and nextP['on']):
				i += 1
				continue

			prevToThis = ComplexVector(prev, this)
			thisToNext = ComplexVector(this, nextP)

			# this is a curve point which cannot be merged
			if (not prev['on'] and this['on'] and not nextP['on']) and abs(prevToThis - thisToNext) > 3:
				i += 1
				continue

			# more tolerant for short edge
			minEdge = min(abs(prevToThis), abs(thisToNext))
			threshold = tolerance if minEdge >= shortEdgeLimit else math.atan(math.tan(tolerance) * 2 * shortEdgeLimit / minEdge)

			# print("{}-{}-{}-{}".format(tolerance, prev, this, nextP))
			if abs(cmath.phase(thisToNext / prevToThis)) > threshold:
				i += 1
				continue
			
			merged = True
			contour.remove(this)

def NormalizeStrokeEnds(contour, tolerance = math.pi / 15, maxDistance = 90):
		i = 0
		while i < len(contour):
			prev = Get(contour, i, -1)
			this = Get(contour, i)
			next1 = Get(contour, i, 1)
			next2 = Get(contour, i, 2)
			next3 = Get(contour, i, 3)
			next4 = Get(contour, i, 4)

			# no off-curve point on the end
			if this['on'] and next1['on']:
				prevToThis = ComplexVector(prev, this)
				thisToNext = ComplexVector(next1, next2)
				end = ComplexVector(this, next1)
				angle1 = cmath.phase(end / prevToThis)
				angle2 = cmath.phase(thisToNext / end)
				# they are outer conner, and they are close enough, and the 2 edges are almost parallel
				if angle1 < 0 and angle2 < 0 and abs(end) < 2 * maxDistance and abs(abs(cmath.phase(prevToThis) - cmath.phase(thisToNext)) - math.pi) < tolerance:
					this['x'] += abs(end) / 2 * math.cos(angle1) * math.cos(cmath.phase(prevToThis))
					this['y'] += abs(end) / 2 * math.cos(angle1) * math.sin(cmath.phase(prevToThis))
					next1['x'] -= abs(end) / 2 * math.cos(angle2) * math.cos(cmath.phase(thisToNext))
					next1['y'] -= abs(end) / 2 * math.cos(angle2) * math.sin(cmath.phase(thisToNext))

			# only 1 off-curve point on the end
			elif this['on'] and not next1['on'] and next2['on']:
				prevToThis = ComplexVector(prev, this)
				thisToNext = ComplexVector(next2, next3)
				end = ComplexVector(this, next2)
				angle1 = cmath.phase(end / prevToThis)
				angle2 = cmath.phase(thisToNext / end)
				if angle1 < 0 and angle2 < 0 and max(Distance(this, next1), Distance(next1, next2)) < maxDistance and abs(abs(cmath.phase(prevToThis) - cmath.phase(thisToNext)) - math.pi) < tolerance:
					this['x'] += abs(end) / 2 * math.cos(angle1) * math.cos(cmath.phase(prevToThis))
					this['y'] += abs(end) / 2 * math.cos(angle1) * math.sin(cmath.phase(prevToThis))
					next2['x'] -= abs(end) / 2 * math.cos(angle2) * math.cos(cmath.phase(thisToNext))
					next2['y'] -= abs(end) / 2 * math.cos(angle2) * math.sin(cmath.phase(thisToNext))
					contour.remove(next1)

			# 2 off-curve point on the end
			elif this['on'] and not next1['on'] and not next2['on'] and next3['on']:
				prevToThis = ComplexVector(prev, this)
				thisToNext = ComplexVector(next3, next4)
				end = ComplexVector(this, next3)
				angle1 = cmath.phase(end / prevToThis)
				angle2 = cmath.phase(thisToNext / end)
				if angle1 < 0 and angle2 < 0 and max(Distance(this, next1), Distance(this, next2), Distance(next1, next3), Distance(next2, next3)) < maxDistance and abs(abs(cmath.phase(prevToThis) - cmath.phase(thisToNext)) - math.pi) < tolerance:
					this['x'] += abs(end) / 2 * math.cos(angle1) * math.cos(cmath.phase(prevToThis))
					this['y'] += abs(end) / 2 * math.cos(angle1) * math.sin(cmath.phase(prevToThis))
					next3['x'] -= abs(end) / 2 * math.cos(angle2) * math.cos(cmath.phase(thisToNext))
					next3['y'] -= abs(end) / 2 * math.cos(angle2) * math.sin(cmath.phase(thisToNext))
					contour.remove(next1)
					contour.remove(next2)

			next1 = Get(contour, i, 1)
			next2 = Get(contour, i, 2)
			if Distance(this, prev) < 3:
				contour.remove(prev)
				i -= 1
			if Distance(next1, next2) < 3:
				contour.remove(next2)
				i -= 1
			i += 1

# round conners of a glyph, assume outer outline is clockwise and inner outline in anti-clockwise
def RoundGlyph(glyph, outerRadius, innerRadius):
	if 'contours' not in glyph:
		return
	for contour in glyph['contours']:
		MergeNearPoints(contour)
		MergeAlmostCollinear(contour)
		NormalizeStrokeEnds(contour)

		i = 0
		prevPointIndex = -1
		while i < len(contour):

			this = Get(contour, i)
			# control point, pass
			if not this['on']:
				prevPointIndex = i
				i += 1
				continue

			prev = Get(contour, i, -1)
			next1 = Get(contour, i, 1)
			next2 = Get(contour, i, 2)
			prevToThis = ComplexVector(prev, this)
			thisToNext = ComplexVector(this, next1)
			angle = cmath.phase(thisToNext / prevToThis)
			isCollinear = abs(angle) < math.pi / 180

			# curve point or tangent point, pass
			if isCollinear:
				prevPointIndex = i
				i += 1
				continue

			# conner point:
			radius = outerRadius if angle < 0 else innerRadius

			isNextOuter = next1['on'] and cmath.phase(ComplexVector(next1, next2) / thisToNext) < -math.pi / 180
			isNextInner = next1['on'] and cmath.phase(ComplexVector(next1, next2) / thisToNext) > math.pi / 180

			# change this connor point to control point
			this['on'] = False

			prevPointIndex = i

			# decrease radius if no space for radius
			radius1 = abs(prevToThis) if abs(prevToThis) < radius else radius
			pointToInsert = {
				'x': this['x'] - radius1 * math.cos(cmath.phase(prevToThis)),
				'y': this['y'] - radius1 * math.sin(cmath.phase(prevToThis)),
				'on': True}
			
			if Distance(prev, pointToInsert) > 3:
				contour.insert(i, pointToInsert)
				prevPointIndex += 1
				i += 1

			radius2 = radius
			if isNextOuter:
				radius2 = abs(thisToNext) / 2 if radius2 > abs(thisToNext) / 2 else radius2
			elif isNextInner:
				radius2 = abs(thisToNext) - innerRadius if radius2 + innerRadius > abs(thisToNext) else radius2
			else:
				radius2 = abs(thisToNext) if radius2 > abs(thisToNext) else radius2
			pointToInsert = {
					'x': this['x'] + radius2 * math.cos(cmath.phase(thisToNext)),
					'y': this['y'] + radius2 * math.sin(cmath.phase(thisToNext)),
					'on': True}

			if Distance(pointToInsert, next1) > 3:
				contour.insert(i + 1, pointToInsert)
				i += 1

			i += 1

		MergeNearPoints(contour)
		MergeAlmostCollinear(contour)

# Name, Copyright and License
def NameFont(font, region, weight, version):
	isStandardStyle = weight == "Regular" or weight == "Bold"

	font['OS_2']['achVendID'] = 'Cyan'
	font['name'] = [
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
			"nameString": "Resource Han Rounded {}{}".format(region, "" if isStandardStyle else " " + weight)
		},
		{
			"platformID": 3,
			"encodingID": 1,
			"languageID": 1033,
			"nameID": 2,
			"nameString": "{}".format(weight if isStandardStyle else "Regular")
		},
		{
			"platformID": 3,
			"encodingID": 1,
			"languageID": 1033,
			"nameID": 3,
			"nameString": "Resource Han Rounded {} {} {}".format(region, weight, version)
		},
		{
			"platformID": 3,
			"encodingID": 1,
			"languageID": 1033,
			"nameID": 4,
			"nameString": "Resource Han Rounded {} {}".format(region, weight)
		},
		{
			"platformID": 3,
			"encodingID": 1,
			"languageID": 1033,
			"nameID": 5,
			"nameString": str(version)
		},
		{
			"platformID": 3,
			"encodingID": 1,
			"languageID": 1033,
			"nameID": 6,
			"nameString": "Resource-Han-Rounded-{}-{}".format(region, weight)
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
			"nameString": "Resource Han Rounded {}".format(region)
		},
		{
			"platformID": 3,
			"encodingID": 1,
			"languageID": 1033,
			"nameID": 17,
			"nameString": str(weight)
		},
	]

def RoundFont():

	with open("SourceHanSansCN-Medium.otd", 'rb') as baseFile:
		baseFont = json.loads(
			baseFile.read().decode('UTF-8', errors='replace'))

	NameFont(baseFont, "CN", "Medium", "1.9.9")

	# for (_, glyph) in baseFont['glyf'].items():
	# 	RoundGlyph(glyph, 60, 5)
	RoundGlyph(baseFont['glyf']['uni4EAA'], 60, 5)
	RoundGlyph(baseFont['glyf']['uni4EAB'], 60, 5)

	# output
	outStr = json.dumps(baseFont, ensure_ascii=False)
	with open("ResourceHanRoundedCN-Medium.otd", 'w') as outFile:
		outFile.write(outStr)


RoundFont()

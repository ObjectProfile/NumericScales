"
reate a color with the given hue, saturation, lightness, and alpha.
"
Class {
	#name : #NSColorHSLAInterpolator,
	#superclass : #NSColorRGBAInterpolator,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolation }
NSColorHSLAInterpolator >> interpolate: t [
	^ Color
		h: start hue + ((stop hue - start hue) * t)
		s: start hslSaturation + ((stop hslSaturation - start hslSaturation)  * t)
		l: start luminance + ((stop luminance - start luminance) * t)
		alpha: start alpha + ((stop alpha - start alpha) * t)
]

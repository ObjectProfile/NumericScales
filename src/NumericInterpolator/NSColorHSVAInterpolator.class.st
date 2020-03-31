"
Same as NSColorRGBAInterpolation but for hsva  
"
Class {
	#name : #NSColorHSVAInterpolator,
	#superclass : #NSColorRGBAInterpolator,
	#category : #'NumericInterpolator-Interpolators'
}

{ #category : #interpolation }
NSColorHSVAInterpolator >> interpolate: t [
	^ Color
		h: start hue + ((stop hue - start hue) * t)
		s: start hsvSaturation + ((stop hsvSaturation - start hsvSaturation)  * t)
		l: start luminance + ((stop luminance - start luminance) * t)
		alpha: start alpha + ((stop alpha - start alpha) * t)
]

# User guide

## Introduction

In order to produce roassal we need a package to use scales properties with numbers, colors and points.
We create this package to encansulate several scales scenarios.

## API
* [Domain and Range](#domain-and-range)
* [Continuous](#continuous)
	+ [Linear]
	+ [Log]
	+ [Pow]
* Sequential
* Diverging
* Quantize
* Quantile
* Threshold
* Ordinal (Band, Point)

## Domain and Range

The domain, is the input, The range, is the output, the value for these variables.

In this case a scale is a `f(x) = y`. `x` belongs to Domain. `y` belongs to Range.

The default values for the domain and the range is: `#(0 1)`.


In Numberic Scales, all main scales are subclasses of `TSScale`.Scales have 2 methods `domain:` and `range:`.

```Smalltalk
x domain: #(0 100)."the start value is 0, the end value is 100"
y domain: #(100 -200). "the start value is 100, the end value is -200"
"x and y are scales"
```

## Continuous

Continuous scales map a continuous quantitative input from the domain to a continuous range. If the range is numeric you can use inverted. A continous scale is not contrudted directly insted use selectors [linear](#linear-scales), [power](#power-scales), [log](#log-scales).

Given a value from the domain, returns a correcponding value from the range. If the given value is outside the domain and clamping is not enabled, the mapping may be extrapolated such that the returned value is outside the range.

```Smalltalk
x := TSScale linear domain: #(10 130); range: #(0 960).
x scale: 20."80"
x scale: 50."320"
```
Or to apply a color encoding:

```Smalltalk
color := TSScale linear domain: #(10 100); range: #(red blue).
color scale: 10. "red".
color scale: 100. "blue".
```




asdfasdfasd

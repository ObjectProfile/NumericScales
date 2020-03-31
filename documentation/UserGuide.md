# User guide

## Introduction

In order to produce roassal we need a package to use scales properties with numbers, colors and points.
We create this package to encansulate several scales scenarios.

## API
* [Domain and Range](#domain-and-range)
* [Continuous](#continuous)


## Domain and Range

The domain, is the input, The range, is the output, the value for these variables.

In this case a scale is a `f(x) = y`. `x` belongs to Domain. `y` belongs to Range.

The default values for the domain and the range is: `#(0 1)`.


In Numberic Scales, all main scales are subclasses of `NSScale`.Scales have 2 methods `domain:` and `range:`.

```Smalltalk
x domain: #(0 100)."the start value is 0, the end value is 100"
y domain: #(100 -200). "the start value is 100, the end value is -200"
"x and y are scales"
```

## Continuous

Continuous scales map a continuous quantitative input from the domain to a continuous range. If the range is numeric you can use inverted. A continous scale is not contrudted directly insted use selectors [linear](#linear-scales), [power](#power-scales), [log](#log-scales).

Given a value from the domain, returns a correcponding value from the range. If the given value is outside the domain and clamping is not enabled, the mapping may be extrapolated such that the returned value is outside the range.

```Smalltalk
x := NSScale linear domain: #(10 130); range: #(0 960).
x scale: 20."80"
x scale: 50."320"
```
Or to apply a color encoding:

```Smalltalk
color := NSScale linear domain: #(10 100); range: #(red blue).
color scale: 10. "red".
color scale: 100. "blue".
```

<a name="continous_inver" href="#continous_inver">#</a><i>continuous invert: value</i>

Given a value from the range, returns a corresponding value from the domain.

```Smalltalk
x := NSScale linear domain: #(10 130); range: #(0 960).
x invert: 80. "20".
x invert: 320. "50"
```

If the given value is outside the range, and clamping is not enabled, the mapping may be extrapoled such that the returned value outside the domain. This method is only supported if the range is numeric. If the range is not numeric, returns Float nan.

The continuous scales typically have have 2 value in their domain and range, specifying move than two values produces a piecewise scale. 

```Smalltalk
color := NSScale linear
	domain: #(-1 0 1);
	range: #(red white green).
color scale: -0.5. "red-white"
color scale: 0.5. "white green"
```
Internally a poly scale performs a binary search, for the range interpolator corresponding to the given domain value. Thus, the domain must be in ascending or descending order. If the domain and range have different sizes K and J, only the first `K min: J` elements in each are observed.

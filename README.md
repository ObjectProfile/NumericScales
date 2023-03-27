# Numeric Scales 
[![CI](https://github.com/ObjectProfile/NumericScales/actions/workflows/runTests.yml/badge.svg)](https://github.com/ObjectProfile/NumericScales/actions/workflows/runTests.yml)

Simple scales for numbers, points and colors.
NumericScales is an essential component used by [Roassal3](https://github.com/ObjectProfile/Roassal3).

  - [Installation](#installation)
  - [Quick start](#quick-start)
  - [Contact](#contact)


## Installation

Execute the following incantation in a Playground: 

```Smalltalk
Metacello new
	baseline: 'NumericScales';
	repository: 'github://ObjectProfile/NumericScales/src';
	load.
```

To add NumericScales to your baseline:

```Smalltalk
spec package: 'NumericScales'with: [ 
	spec repository: 'github://ObjectProfile/NumericScales/src' ].
```

## Quick start

The entry point is `NSScale` the package `NumericScales` contains a collection of Scales that you can use to your project, like: linear, log, pow, ordinal and polylinear.

```Smalltalk
scale := NSScale linear
	domain: { 0. 100};
	range: { 'red'. 'blue' }.
scale scale: 100.
"Color blue"

scale scale: 0.
"Color red"

scale scale: 50.
"Half way between red and blue"
```

## Documentation

You can find more information here  
* [User documentation](documentation/UserGuide.md) 
## Contact

If you have any questions or problems do not hesitate to open an issue.

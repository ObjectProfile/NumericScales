# Numeric Scales 

Simple scales for numbers, points and colors.

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
spec
	baseline: 'NumericScales'
	with: [ spec repository: 'github://ObjectProfile/NumericScales/src' ]
```

## Quick start

The entry point is `TSScale` the package `NumericScales` contains a collection of Scales that you can use to your project, like: linear, log, pow, ordinal and polylinear.

```Smalltalk
scale := TSScale linear
	domain: { 0. 100};
	range: { 'red'. 'blue' }.
scale scale: 100.
"Color blue"
```

## Documentation

You can find more information here  
* [User documentation](documentation/UserGuide.md) 
## Contact

If you have any questions or problems do not hesitate to open an issue.

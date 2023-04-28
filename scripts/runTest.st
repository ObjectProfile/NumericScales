| path stream repoPath unitTests numberOfPassed env cout packagesRegExp packages |
"We create a file that will contain the result of the test execution"
path := '/tmp/result.txt'.
path asFileReference exists ifTrue: [ path asFileReference delete ].
stream := path asFileReference writeStream.


env := Smalltalk os environment.
cout := Stdio stdout.
cout << '>>> Removing old roassal and numeric interpolators code'; crlf.
packagesRegExp := { '*Roassal3*' }.

packages := packagesRegExp flatCollect: [ :regExp |
	RPackageOrganizer default packages
		select: [ :p | regExp match: p packageName ] ].

packages := packages reject: [ :pck | pck name = 'Roassal3-Pharo7' ].
packages do: [ :package | package removeFromSystem ].

packagesRegExp := { '*Numeric*' }.

packages := packagesRegExp flatCollect: [ :regExp |
	RPackageOrganizer default packages
		select: [ :p | regExp match: p packageName ] ].
packages do: [ :package | package removeFromSystem ].

cout << '>>> Clonning from: '.

repoPath := 'gitlocal://', (env at: 'GITHUB_WORKSPACE').
cout << 'Loading: '; << repoPath; crlf.
"We load the application software analyzer"
[ Metacello new
    baseline: 'NumericScales';
    repository: repoPath;
    load ] on: MCMergeOrLoadWarning do: [ :warning | warning load ].
cout << '>>> Running tests:'; crlf.
"We identify the unit tests contained in the loaded application"
unitTests := (TestCase withAllSubclasses 
    select: [ :cls | 
        cls package packageName beginsWith: 'NumericInterpolator' ])
    sorted: [ :c1 :c2 | c1 name < c2 name ].

numberOfPassed := 0.
"We run the unit tests"
unitTests do: [ :unitTestClass | | res |
	res := unitTestClass buildSuite run.
	
	res errors , res failures do: [ :err | 
		stream << res asString.
		
	].

	numberOfPassed := numberOfPassed + res passed size.
].

stream crlf.
stream nextPutAll: 'NUMBER OF UNIT TESTS=', unitTests size asString; crlf.
stream nextPutAll: 'NUMBER OF PASSED TEST METHODS=', numberOfPassed asString; crlf.
stream nextPutAll: 'NUMBER OF TEST METHODS=', (unitTests flatCollect: [ :cls | cls buildSuite tests ]) size asString; crlf.
stream nextPutAll: 'END'; crlf.

"We close the stream and quit Pharo"
stream close.

SmalltalkImage current quitPrimitive

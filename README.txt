Sliderule Tester
(c)2009, Jeffrey Reinecke <jeff@paploo.net>


OVERVIEW:
Sliderule Tester is a library and simple framework for a command line slide rule
problem practicing program.  It endeavors to give randomly generated problems
that exercise a variety of sliderule techniques.


FIELDS OF INTEREST:

Multiplication:
Simple mult, C/D
Simple division, C/D
1/x calculations (Using reverse D scale)
Mult/Div Chains (a*c*d / b*d*f --> a/b*c/d*e/f), C/D

Sqrs/Cubes and Roots (Using A,K or Root scales is separate instructions)
Simple Sqrs/Cubes
Simple Roots
a*b^2 (A/B only?)
a*sqrt(b) (A/C and K/C only?)

Pows
simple 10**x
simple e**x
simple any power
a*10*x
a*e^x
a*b^x
Note: Any tricks for computations with *very* large numbers, like 2^32 ?  (2^32 == 10^x ==> x == 32 * Log10(2), then split x into 10^ip and and 10^fp parts)


Logs
simple log10
simple log
a*log10(x)
a*log(x)
log base n
a*logN(x)
Note: Need to do for numbers very close to 1, up to *very* large.
Note: Any tricks for computations with *very* large numbers, like log2(10^8) ?  (8 * log2(10))

Trig
Sin (big and small angles)
Cos (big and small angles)
Tan (big and small angles)
ArcSin
ArcCos
ArcTan
Rads -> Deg
Deg -> Rads


DEV NOTES / REQUIREMENTS:

+ Create random problems using a generator.
+ A generator needs instructions on how problem is worked.
+ Give a field to put in worked solution.
+ Hit button to give correct solution and display error in %
+ Rate the error based on the order of magnitude of the error percentage?
+ Need an I/O engine.

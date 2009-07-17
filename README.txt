Sliderule Tester
Copyright (c) 2009, Jeffrey C. Reinecke
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

CONTACT:
jeff@paploo.net


OVERVIEW:
Sliderule Tester is a library and simple framework for a command line slide rule
problem practicing program.  It endeavors to give randomly generated problems
that exercise a variety of sliderule techniques.

BASIC USAGE:
Start the tester from within the project directory via:
  $ script/start
  $ ruby start.rb
At any time you can type 'exit' or 'quit' at the prompt to quit.


FIELDS OF INTEREST:

Multiplication:
Simple mult, C/D
Simple division, C/D (Chains of division may work best with inverses?)
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
Rect to Polar: The angle was first obtained from θ = tan-1 (y/x), and then r = y / sin θ or x / cos θ. To go the other way, x = r cos θ and y = r sin θ were used (http://mysite.du.edu/~jcalvert/tech/slidrul.htm)


DEV NOTES / REQUIREMENTS:

+ Create random problems using a generator.
+ A generator needs instructions on how problem is worked.
+ Give a field to put in worked solution.
+ Hit button to give correct solution and display error in %
+ Rate the error based on the order of magnitude of the error percentage?
+ Need an I/O engine.

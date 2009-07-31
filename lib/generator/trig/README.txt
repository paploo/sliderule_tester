Sin:
  0 to 0.57 deg: convert to radians.
  0.57 to 5.7 deg: use ST/SRT.
  5.7 to 80 deg: use S.
  80-90 deg: use expansion if S not good enough. (1 - ((90-x)/81.03)^2)
 
Cos:
  Same as for sine, but always with the compliment of the angle.  There are
  often reverse counting ticks to help with that.
 
Tan:
  0 to 0.57 deg: convert to radians.
  0.57 to 5.7 deg: use ST/SRT.
  5.7 to 45 deg: use T.
  45 to 84.3 deg: use T against CI instead of C.
  84.3 to 90 deg: Use expansion 57.30/(90-x)
  
Csc:
  As for sine, but read off of the CI scale instead of the C scale.
  
Sec:
  As for cosine, but read off of the CI scale instead of the C scale.
  
Cot:
  Do as for tangent, except switch between the CI and C scale as necessary.
 


Generators for trig functions.

* sin, asin, csc
* cos, acos, sec
* tan, atan, cot

The usage is different for small angles vs large angles!
1. 0<x<0.57 deg, convert to radians.
2. 0.57<x<5.7 deg, use ST/SRT.
3. 5.7<x<80 deg, use S or T.
4. 80<x<90 deg, use expansions (see below).
* Note that for cosine, we have the reverse relationship as cos is the sin of
  the compliment of the angle.

+ Rad to Degree and back conversions.
+ Multiplication with Pi should be thrown in too.

* Conversion to/from polar/rect coordinates.
    + This is best done by first calculating atan(y/x), and then using r = x/cos(th) = y/sin(th)


Small angles of cos(x) don't usually need to be calculated, because even if you
do, your rule doesn't give enough precision in the 9's to be useful.  However,
in the cases where you need to know this, one can utilize the taylor expansion
to calculate the deviation from 1 via:
  cos(x) ~= 1 - (1/2)*x^2 for x<(pi/18) radian
or:
  cos(theta) ~= 1 - (theta/81.03)^2 when theta<10 degrees.
This can be expanded for use with sin(x)>80 by considering that sin(x)=cos(pi/2-theta):
  x' = pi/2 - x
  sin(x) ~= 1 - (1/2)*(x')^2 for x>(4pi/9) rad
or:
  theta' = 90 - theta
  sin(theta') ~= 1 - (theta'/81.03)^2 when theta>80 degrees.
  
For large angles of tan(x), we need to take advantage of tan(x) = cot(x') where
x' = pi/2 - x.  The series expansion for cot(x') is 1/x' - x'/3, this:
  x' = pi/2 - x
  tan(x) ~= 1/x' - x'/3
or when in degrees
  theta' = 90 - theta
  tan(theta) ~= 57.30/theta' - theta'/171.9
Note that this second term is actually not necessary for most calculations.
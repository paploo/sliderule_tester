Generators for trig functions.

* sin, asin, csc
* cos, acos, sec
* tan, atan, ctan

The usage is different for small angles vs large angles!
1. x>5.7 deg, use S or T.
2. 0.57<x<5.7 deg, use SRT
3. x<0.57, convert to radians.

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
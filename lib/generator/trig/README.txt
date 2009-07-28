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


Small angles don't usually need to be calculated, because even if you do, your
rule doesn't give enough precision in the 9's to be useful.  But here are some
tricks to help if you really need it:

* For the sine of angles over 80, or the cos of angles under 5.7, it is better
  to take advantage of
    sin(a+b) = sin(a)*cos(b) + sin(b)*cos(a) and
    cos(a+b) = cos(a)*cos(b) - sin(a)*sin(b),
  with a as 45 degrees, such that:
    b = theta - 45 degrees (b>45)
    sin(theta) = sin(45 + b) = sin(45)*cos(b)+cos(45)*sin(b) = (cos(b)+sin(b))/sqrt(2)
  and
    b' = 45 degress - theta (b<45)
    cos(theta) = cos(45 + -b') = cos(45)*cos(-b')-sin(45)*sin(-b') = (cos(b')+sin(b'))/sqrt(2)
    
* Even better!  For large angles of sin, take advantage of sin(2u) = 2*sin(u)*cos(u):
    u = theta/2
    sin(theta) = sin(2u) = 2*sin(u)*cos(u)
    
* For small angles of cos, use cos(2u) = 1 - 2*sin(u)^2

* Even better!!  cos(phi) =~ 1 - (1/2)*phi^2 when phi is in radians, or approx 1 - (1/6566)*(theta)^2 when theta is in degrees.
  Since we can calculate the second portion before subtracting, we can accurately get the remainder.
  Additionally, sin(theta) = cos(pi/2-theta), so we can get big angles of sin as well!
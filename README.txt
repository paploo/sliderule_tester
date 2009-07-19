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
Jeff Reinecke
jeff@paploo.net
http://www.paploo.net


REQUIREMENTS:
Ruby 1.9.1 is required for this software to function.


OVERVIEW:
Sliderule Tester is a library and simple framework for a command line slide rule
problem practicing program.  It endeavors to give randomly generated problems
that exercise a variety of sliderule techniques.


BASIC USAGE:
Start the tester from within the project directory via:
  $ script/start
  $ ruby start.rb
At any time you can type 'exit' or 'quit' at the prompt to quit.

Initial navigation is via a menuing system.  Once a test is selected, the prompt
will change to reflect this.

Tests last as long as you let them run.  Enter 'end' at any time to end the test
and get a result summary.  You will then be presented with the main menu again.

Note that if you select a sliderule model from the library, the slide error will
be quoted in inches correctly.  If no model is selected, a theoretical 10" rule
is used.

COMMANDS:

[all contexts]
exit/quit - quit the program
help/? - get a list of valid commands (can be ugly thanks to aliases!)

[menus]
<Item number> - Select said item
up - Go to the previous menu (when available)

[tests]
end - end the test, output statistics, and go to the main menu
instructions - re-print the test instructions


DEVELOPER NOTES:

The basic architecture can be divided into two parts, the cli and the backend:

There is nothing really interesting about the backend.  It is primarily based on
Proctor to control the tests, and Generator subclasses to control the generation
of problems.  (Generator instances are problems).

The CLI is more interesting, as the CLI directory contains the first prototype
of a context based event engine for CLI functionality.  At all times the program
contains a stack of Context instances, each of which knowing how to "draw"
itself and what commands it responds to.  Commands are then passed up through
the contexts until a context knows how to handle it.
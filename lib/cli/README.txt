Overview:

The CLI interface provides a structured way of handling command line interactions
with the following features:

+ Readline support
+ Command Contexts
+ Menuing

In general, this is accomplished by defining contexts that can display themselves
and understand the commands for that context.  When a command is entered, the
input is passed up the contexts until the first context that understands the
command handles it.

Menus, for example, are just a context, and the top level context would know how to handle
things like 'exit'.

Spec Outline:

Context:
+ We need to keep track of the current context hierarchy at all times, and have
  ways of manipulating it.
+ We need to have a way to get both main text and prompt text.
+ We need a way to register commands and map those to blocks.  [register_command(cmd, *aliases, &handler)]
+ We need a way to alias commands. [alias_command(alias, cmd)]
+ We need a way to check if a command is understood in the context.
+ We need a way to execute the command, including handing it args.
+ We need a way to list commands with associated help.

Prompt:
+ Display the main and prompt texts for the bottom level context.
+ Take input, repeat question if invalid input.
+ Input should divide into command and args as closely as to how a shell works as possible.
+ Send for processing when valid.
+ Do NOT handle looping over prompt, that is application's concern.

Menus:
+ A subclass of context
+ Should use menu item class to delegate work.
+ Need to understand trees of menus, and facilitate ascending the structure
  - Can accomplish this by pushing and popping menus to the context stack, *but* we need to make sure not to pop if we are the top level menu.

Menu Item:
+ name
+ commands (we really need the root command and aliases, and then the menu needs to derive all possible abbreviations and maintain an alias hash.)
+ handler block

Test (This is NOT a CLI class, but it depends on CLI):
+ Is a context
+ Initialized with a generator.
+ When asked for the main text, it produces a new problem only if the problems and solutions are the same count.
+ The main text is the problem, the prompt is an '='
+ The instructions are separate, and are posted in response to selecting a test.
+ 'end' concludes the test and gives a summary of the results (avg and stddev of the errors?)
+ 'instructions' should give the instructions for the problems.
+ 'help' should be the basic help, which gives a list of commands and descriptions (when that is implemented)
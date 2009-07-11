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

Prompt:
+ Display the main and prompt texts for the bottom level context.

Menus:
+ A subclass of context
+ Need to understand trees of menus, and facilitate ascending the structure.
+ Should use menu item class to delegate work.

Menu Item:
+ name
+ commands (we really need the root command and aliases, and then the menu needs to derive all possible abbreviations and alias them?)
+ handler block
---
layout: post
title: In Defense of Haskell
author: Forkk
date: 1400355070000
---

Haskell is probably one of my favorite programming languages. Unfortunately
when I try to explain some of the concepts in Haskell to people, they don't
seem to get it. It's not that they don't understand what I mean when I say that
functions have no side effects. They just don't seem to understand *why* functions
have no side effects. They don't understand *why* everything has to return some
value, and they certainly don't understand *why* monads even exist.

In reality, though, functions in Haskell *shouldn't* have side effects, everything
*should* return a value, and Haskell would be nearly useless for any practical
purpose without monads. You just need to understand a few things about Haskell, and
then all of these silly "rules" go from being silly and arbitrary, to being obvious.


### Paradigm Shift

Understanding Haskell requires a paradigm shift. Stop thinking about programs
as sequences of instructions, and start thinking about them as expressions
to be evaluated, because in Haskell, everything is an expression.

If I wanted to create a function to add two to a number, I could say
`add2 x = x + 2`. This function is not something that is "called" to add two
to a number, it simply represents the expression `x + 2` for any value of x.
A function is just an expression which takes some input and gives a result
based on that input.


### No Side Effects

In Haskell, functions have no side effects. This simply means that a function
cannot access or manipulate any global state. In fact, there is not global state.
The only variables a function accesses are its arguments.

In an imperative language, this concept makes no sense. Functions in an imperative
language aren't expressions, they're blocks of code and you call them to execute
them. Of course they'd be able to have side effects. Not allowing side effects in
an imperative language would just be a silly arbitrary restriction.

If you think in terms of mathematical expressions, however,  this concept makes sense.
Of course functions can't have side effects! They're just expressions. All
they do is take some input an give a result. Why would they go out and manipulate
some global state?


### All Functions Return Values

Another confusing concept is the fact that all functions must return values. This
is simple enough to understand, but it makes no sense in an imperative language.
What about functions that don't *need* to return anything. If I have a function
that goes and prints text to the terminal, what does that return? How could that
ever return any meaningful value other than some error code?

Once again, this concept makes sense when everything is an expression. Of course
all functions return values! They're just expressions. Furthermore, how would
any function do anything without being able to return some value. Since there's
no global state, how do we do anything without returning a value?


### Monads

This is the scary one. The ever frightening monad. In reality, however, monads
tie all of our beautiful functions together quite nicely. All the other stuff
before would be useless if we didn't have something to tie it all together. How
do we do IO if there are no side effects? How do we interact with the outside
world? What about functions that need to carry around some sort of state? Do
I just pass some state argument around? That would be a pain.

Monads are the obvious solution to all of these problems. There are many ways
to think of them, but I like to think of them as action values. For example,
what is the return value of a function that prints to a terminal anyway? Well,
the `putStrLn` function's return value is actually `IO ()`. We can call that
an IO *action*.

An IO action simply represents some sort of action to be done involving IO.
For example, `putStrLn` represents an IO action which prints a string. If
we want to actually execute this action, we simply return it from our program's
`main` function like so:

    main = putStrLn "Hello World"

We can also chain multiple IO actions into one using the `>>` (bind) function.
The `>>` function simply creates a new IO action which executes the left hand
side IO action and then executes the right hand side IO action.

    main = putStrLn "Hello" >> putStrLn "World"

Now, we can construct our program out of chains of these IO actions. It doesn't
stop there, though, bind is not specific to IO actions. It's actually a feature
of monads. You can use bind with IO actions, since they're monads. You can also
use it for many other things such as holding some sort of state, or parsing
files.

In the end, though, all monads do is allow you to write Haskell like an imperative
language, by combining them together. They allow you to write expressions which
represent sequences of instructions to be executed in order, but they do so without
breaking the rules of our functional language. Monads make Haskell useful. They're
not just some scary concept.


### Haskell is Beautiful

In the end, if you look at Haskell from the perspective of an imperative programming
language, you're gonna have a bad time. You need to think of it in terms of
mathematical expressions. Once you do that, it stops being weird, and starts
being beautiful.


---
layout: post
title: In Defense of Haskell
author: Forkk
date: 1400258658000
---

You may have heard of a little programming language called Haskell. In fact,
you've probably heard people talk about it as if it were some scary complicated
thing full of these incredibly weird concepts. Some may have even claimed you
needed a degree in category theory to even begin to grasp some of the concepts
in Haskell.

Those people are crazy. I hardly know what category theory even is and I do
just fine.

It seems to me that the problem most people have with Haskell is that they try
to understand it in terms of the imperative languages that they already know,
like C++ and Java. Haskell isn't C++ or Java, though, it's not even similar in
any way.

Switching from an imperative language to a functional language like Haskell
requires a major paradigm shift. Applying imperative concepts to a functional
language is like trying to jam a square peg into a round hole. You don't need
category theory to understand anything in Haskell. You just need to change your
mode of thinking.

So how should one think about Haskell programs? Well, they're certainly not a
sequence of instructions like code in imperative programming languages. Instead,
Haskell takes its inspiration from mathematics. In fact, you could even look at
Haskell as simply a superset of mathematics.

Every program and every function in Haskell is simply an expression to be evaluated.
Functions are simply mathematical expressions. For example, the function
`add2 x = x + 2` should not be thought of as something you "call" which "adds two to
x and returns the result." Instead, this function should be thought of in a mathematical
sense. `add2` is simply an expression which represents the value `x + 2` for any x.

When you think of functions as mathematical expressions, you can then begin to
understand some of the concepts in Haskell that may have sounded confusing at
first. For example, I'm sure you've heard people say that functions in Haskell
have no side effects. This means that no function in Haskell can access any
variable other than its arguments.

The concept of "no side effects" sounds silly at first, but when you consider
functions mathematically, it makes complete sense. Mathematical functions don't
touch outside values. In fact, all a function is is something that takes an input
and produces a result based on the input. When you consider functions this way,
suddenly, it makes sense. Functions *shouldn't* be able to take any outside input
at all.

In an imperative language, this concept would make no sense whatsoever. Why would
you not allow my function, which needs to be able to *do something* to access
things outside of what I've given it? In the beautiful mathematical world of Haskell,
though, it seems obvious that expressions shouldn't do anything outside of giving
some result value.

Speaking of result values, there's another thing that seems to confuse people
sometimes. In Haskell, every single function will *always* return some value.
Once again, this would seem odd in the imperative programming world. What about
functions that print things to the terminal? What do they return? This seems
like an arbitrary restriction.

When everything's an expression and there are no side effects, however, this
makes perfect sense and, once again, is completely logical. Since functions are
just expressions to be evaluated, of course they always have some return value.
Every expression has a value. In fact even the "if then" statement in Haskell is
an expression with a value.

So what about printing to a terminal? What does that return? Well, this is where
things get complicated. Really complicated. This is by far one of the biggest
problems most programmers have with Haskell: monads.

Oh no! I said *the* word. Everyone run!

Seriously, though, monads aren't difficult at all. In fact, they make total sense.
Here, let me prove it.

Everything is an expression and there are no side effects. No function could ever
access anything outside of the pure confined Haskell world it lives in. So how
in the world do we print text to a terminal or do any sort of IO at all?

Monads.

When it comes to printing text, the type of the `putStrLn` function is `IO ()`.
We can call this an IO "action." So the `putStrLn` function returns an IO action
which prints some text to a terminal. The parenthases on the end there represent
the value contained within the IO action. In this case, there's no value because
printing to the terminal doesn't need to give us any result back.

So how does this work? Well any IO action that is returned from the program's 
`main` function will be executed. So, if I write a program and say
`main = putStrLn "Hello world!"`, I'm saying the value of `main` is this IO
action which prints "Hello world."

If I wanted to print two things, I could chain IO actions together using the bind
operator: `>>`. This is a function which takes two IO actions and combines them
into one. So, for example, `putStrLn "Hello" >> putStrLn "World"` is a single IO
action which prints "Hello" and then prints "World."

This is fantastic! We've just taken the "outside" world and reduced it to a concept
that can be contained within the pure, mathematical world of Haskell, without
breaking any of our nice functional programming rules. Everything is still an
expression.

Ultimately, Haskell is not confusing at all. You just need to change your way of
thinking. Changing programming paradigms is literally a huge paradigm shift, but
if you can manage to think differently about functional programming, it might
help you at least understand some of the more complicated concepts in Haskell.


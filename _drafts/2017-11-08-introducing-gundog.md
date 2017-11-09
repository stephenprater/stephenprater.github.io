---
layout: post
title:  "In which In introduce you to my new puppy"
date:   2017-11-07
categories: tools gems howto tracepoint
---

So recently I acquired a _project_.

Said project involves teasing apart *years* worth of spaghetti that has grown
together into a tangled morass of classes, methods, includes, meta-programming
and long since forgotten or obsolete "business rules."

{% include image.html url="/assets/photos/spaghetti.jpg" class="right" caption="A picture of my code base." %}

Given the tendency of Big Bang refactors to fail, and the impatience that
stakeholders rightfully posses for developers who vanish into code holes and
emerge six weeks later with beautiful (and incorrect) software - we wanted to
start by just figuring out what we need to do.

That's easier said than done.  The public interface for the involved classes is
massive - running to hundreds of methods across dozens of files.  The test suite
helps some, but coverage tools are unreliable given the prevalance of mocks and
stubs within the harnesses.  (An additional wrinkle - the test suite is old
enough that it does not use [verifying
doubles](https://relishapp.com/rspec/rspec-mocks/docs/verifying-doubles) to make
sure that the methods it's stubbing are actually even implemented.)

## We're going on a Duck Hunt. (We're gonna catch a big one.)

I can reduce this problem down to a few individual steps - but the first one is
always the same.  In order to implement _what we have now_ I need to **know**
what we have now.  In a staticly typed language this is relatively
straightforward - every method has a signature, and we can find the places where
those methods are called with the help of static analysis.  Ruby - for all of
its many pleasures, does not (cannot) perform this kind of operation.  We need
to discovery the Duck Type of the classes we want to refactor.

Coverage tools will tell us what code was called, but won't tell us who called
them.

Call Graphs and profilers will tell us who called what (and how many times even)
but it can be difficult to focus in on only the parts we need.

Luckily for us, Ruby > 2.0 has this cool feature called Tracepoint. Unluckily
for us Tracepoint does not come with batteries included - Tracepoint scripts are
tricky to right and mistakes tend to lead to segfaults and interpreter crashes -
so _developer beware_.

GunDog is a collection of Tracepoint scripts and analysis tools for discoverying
the duck types of certain classes.

Using it is simple (notably it is not _fast_ since we are using Ruby Tracepoint
scripts.)

{% highlight ruby %}
trace = GunDog.trace(YourClass) {
   some_code_that_calls_your_class
}.explore
{% endhighlight %}

At the end of this Trace outputs a TraceExplorer - which contains a bunch of
information that you can use to inform your refactoring decisions.

Probably one of the more useful one is `unique_call_signatures` - which outputs
the names (and argument types) of every method called from within the GunDog
trace block.





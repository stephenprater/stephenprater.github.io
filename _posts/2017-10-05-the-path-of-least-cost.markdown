---
layout: post
title:  "The Path of Least Cost"
date:   2017-11-07
categories: agile process weird-stories
---

In raster GIS analysis there is a relatively common piece of analysis called the
"least cost path."

{% include image.html url="/assets/photos/least-cost-paths.png"
class="left" caption="I wonder where the river is." %}

The algorithm itself is pretty simple - given a "cost surface" find the
cheapest way to get to a different point on the plane.  The "cost surface"
itself is essentially a grayscale picture where the highest numbers represent
the highest cost.  The analysis is _excellent_ for finding the path that water
will take down hills, or if you want to get a little creative, the fastest way
from your house to the coffeeshop given what you know about road conditions.

It's a simple algorithm - it finds all the paths to the goal, adds up the
costs, and takes the cheapest one.  Does that process sound familiar?  Could it be
~~SATAN~~ AGILE?

{% include image.html url="/assets/photos/satan.jpg"
class="right" caption="Spoiler: Probably Not" %}

But the algorithm is not infallible.

One of my favorite examples of how people "know" better than the least cost
algorithm comes from archaeology.  (Disclaimer  - I am not an archaeologist, but
I am married to one so I get some osmostic learning.) Here's the story:

In Central Arkansas, the Arkansas River runs near the base of Petit Jean
mountain.  Petit Jean is covered in Native American rock art, but
there's little evidence of long term habitation there.  Instead, it seems that
most of the people in the area lived in the nearby bottom land and "commuted" to the
top of the mountain for ritual practice.

Wanting to know what sort of path they might have taken to get to the top of the
mountain - a researcher runs a "least cost analysis" between a known village site
and a known rock art site.  The path leads straight into a shear cliff, and
happily climbs directly up it.  Turns out that it's cheaper to climb the cliff
than to go round to the nice, gentle slope, and cool refreshing water falls on
the other side of the mountain.

I mean ... c'mon.  Clearly - no reasonable human is going to stumble upon a shear 100
meter cliff and think to themselves "I bet scaling this is easier than going
around."

Now - if you're a developer and not a rock art specialist you're probably
thinking one of two things depending on your personal proclivities.

1. "Agile's such horseshit - no longterm thinking and now we're staring down a
    metaphorical cliff of technical debt."

2. "This is probably MVP.  I wonder if we could just do the ritual right here at
   the base of the precipice."

Perhaps suprisingly - this story has an obvious ending.

Nobody climbs a hundred meter cliff.

They especially don't climb a hundred meter cliff if you can go a few kilometers
out of your way and take a nice easy walk through bountiful forests.

Maybe there's a story here - that the "easiest next step" is not always the
"correct next step" - a little bit of vision here can go a long way.  We can
no more imagine clueless native pilgrims stumbling up to a surprise cliff face
than we can them climbing it.  _Because they weren't stupid._

Without robotic devotion to process we all see the cliff coming - but the desire
to make Software into a Factory has produced a type of willfully ignorant Agile
Cult that (like all cults) has convinced themselves to believe things they know
aren't true, and to deny truths they can plainly see.

## Software Is Not A Factory

We (by which I mean "the people who write the checks and the code") want, and
maybe even need, to believe that once we 'discover' the correct way to write
Software we can eliminate human creativity from it and get right into producing
software exactly like we do cars or houses or anything else that's mass
manufactured by humans.

Eliminate the ability (or need) to make decisions and we can Taylorism our way
right into profitability.  I'm pretty sure this is _mostly_ wrong for several
reasons - but one of the biggest gets back to our parable of the Least Cost
Path.

Software Is Not A Factory - but it is _also_ not a journey with a map.  There is
little doubt given the "least cost path" analysis that it _is_ in fact cheaper
to climb the cliff.  It's not really arguable that from the birds-eye view
(where you can clearly see the entire cost surface) that walking around the cliff
is the more expensive option.  But while planners like to see themselves as
the algorithm - with perfect foreknowledge of the lay of the land and all of
the costs associated - we are _far, far, far_ more like the people trying to get
to the top of the mountain to make some Rock Art.

It's a pretty sensible approach to not start out with idea that we're going to
go the long way round - and so start hiking directly toward the peak of the
mountain (where lies our Finished Product) - but we don't have to walk all the
way up to the base of the cliff to realize the cliff is there and that maybe we
should go another way.  And, on our next trip, there's no reason to take a
several-days detour to the base of the cliff to see if it's still there - we can
start planning for the walk around.

Convincing yourself that you don't know things that you _do know_ is just as
much of a cognitive bias as convincing yourself that you do know things you
_don't know_ - and it has the same kind of negative impact.

You plan for the world as you see it, and if you see it wrong, you plan for it
wrong.  That's something of a truism and extraordinarily reductive - but I think
it's something that we could all benefit from remembering.  Programmers even
have an acronym for this: **G**arbage **I**n **G**arbage **O**ut.

So it goes, watch out for cliffs.

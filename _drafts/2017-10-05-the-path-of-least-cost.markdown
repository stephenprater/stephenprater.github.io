---
layout: post
title:  "The Path of Least Cost"
date:   2017-11-07
categories: agile process weird-stories
---

In raster GIS analysis there is a relatively common piece of analysis called the "least cost path."

{% include image.html url="/assets/photos/least-cost-paths.png"
class="left" caption="I wonder where the river is." %}

The algorithim itself is pretty simple - given a "cost surface" find the
cheapest way to get to a different point on the plane.  The "cost surface"
itself is essentially a grayscale picture where the highest numbers represent
the highest cost.  The analysis is _excellent_ for finding the path that water
will take down hills, or if you want to get a little creative, the fastest way
from your house to the coffeeshop given what you know about road conditions.

It's a simple algorithim - it always takes the least costly next step that moves
it closer to it's ultimate goal.  Does that process sound familiar?  Could it be
~~SATAN~~ AGILE?

{% include image.html url="/assets/photos/satan.jpg"
class="right" caption="Spoiler: Probably Not" %}

But the algorithim is not infallible.

One of my favorite examples of how people "know" better than the least cost
algorithim comes from archaeology.  (Disclaimer  - I am not an archaeologist, but
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
than to go round to the nice, gentle slope and cool refreshing water falls on
the other side of the mountain.

I mean ... c'mon.  Clearly - no sane human is going to stumble upon a shear 100
meter cliff and think to themselves "I bet scaling this is easier than going
around."

Now - if you're a developer and not a rock art specialist you're probably
thinking one of two things depending on your personal proclivities.

1. "Agile's such horseshit - no longterm thinking and now we're staring down a
    metaphorical cliff of technical debt."

2. "This is probably MVP.  I wonder if we could just do the ritual right here at
   the base of the cliff."

Perhaps suprisingly - this story has an obvious ending.

Nobody climbs a hundred meter cliff.

The especially don't climb a hundred meter cliff if you can go a few kilometers
out of your way and take a nice easy walk through bountiful forests.

Maybe there's a story here - that the "easiest next step" is not always the
"correct next step" - a little bit of vision here can go a long way.  We can
no more imagine clueless native pilgrims stumbling up to a surprise cliff face
than we can them climbing it.

Without robotic devotion to process we all see the cliff coming - but the
desire to make Software into a Factory has produced a willfully ignorant Agile
Cult that (like all cults) has convinced themselves to believe things they know
aren't true.

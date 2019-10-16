---
layout: post
title: "Introducing UserLAnd Cloud"
date: 2019-08-29
categories: product announcement
---

# In the Before Now

About a year ago, I was hired by [UserLAnd](http://userland.tech) to bring their
platform to the cloud. UserLAnd is a great app that allows people with lower
power and inaccessible computing devices to unlock the full potential of their
device by running an (almost) fully functional Linux Desktop on their
smartphone. From the pitch: UserLAnd is a project designed to bring accessible
computing to "undercomputed" communities, including those in the global south.

In fact, UserLAnd the app works great. You can run _almost_ anything on your
smartphone that you can run on a (low power) laptop, and if you're creative with
the accessories, you can even get a keyboard and mouse working with the device.
But it's the 21st Century, nominally and local computing just ain't it chief, if
you're going to participate in the tech economy, you're going to need The
Internet.

UserLAnd is a stepping stone technology for consumers in the developing world to
participate fully in the global information sphere.

That's where Userland Cloud comes in. The global south isn't just
undercomputed, it's _undernetworked_. Although a patchwork of cellular network
spans most of the globe, much of it is EDGE or EVDO (3G) outside of Europe and
North America. Developing markets like Nigeria and rural India don't _just_
need computing access, they also need _network access_.

The problem here is that while inexpensive virtual machines are available, they
are difficult to use, the management plane often requires a high-speed
connection, and they are targeted primarily at people who already know how to
use them! Additionally, the target audience for UserLAnd might not have access
to the wealth of information on the web about *how* to create these kinds of
services, since the vast, vast majority of that information is in English. Our
small team couldn't write exhaustive documentation for a complex and powerful
workflow like AWS or GCP, so we focused on an direct and easy to understand UX.

UserLAnd Cloud is a little different. It is built from the ground up to be
accessible and private. Two of it's primary design goals are:

* Cheap
* Easy

Absolute reliability is easy to throw away when your current service level is
effectively zero. UserLAnd boxes are meant to be somewhat ephemeral. (If they
get sick they'll get better -- probably.) A server available 95% of the time for
$1/month is better than one with 99.9999% update for $30.

A primary goal of UserLAnd is _user empowerment_, which leads us into our next
design pillar - privacy. This was a complex issue for our team, we we're going
to take a little detour to recap some of the dicussions we had.

## Story Time

One of the uses cases that I always thought of when developing UserLAnd was a
woman that I worked with several years ago. She was a young Nigerian woman
working out of Bolivia and was developing a networking service for victims of
sexual assault and domestic violence. Its primary function was to connect
victims to each other and create a kind of mutual aid network for them. Need a
place to stay? This was the app that could connect you with nearby safe
couches.

She was running this website off of her laptop, and would use ngrok to expose
the service (which was "advertised" almost entirely by word of mouth) when she
had network access. She felt this was necessary both because of the price of
hosting, and because her worry that exposure of the data could have serious
consequence for her users. So, in this instance, there was another concern that
we needed to keep in mind, **privacy**. In fact, one of the commonalities of
many of UserLAnd's target communities is marginizaltion. The UserLAnd team
benefits from immense privilege, and we wanted to build a platform that took
into account the needs of marginalized and under-serviced communities from the
start. We read a lot of information, and consulted an anthropologist with a
background in indigenous communities to make sure that we were on the right
track when developing our road map. Also, and most importantly, we listened to
the users we already had.

That gives us our third pillar, privacy.

And honestly, we struggled with this one. Why is that? Well, we want to make a
product that our users would want, and would serve their needs, but we didn't
want to introduce yet another place for internet trolls to hide. It was obvious
to all of us that privacy was going to be a double-edged feature. Features that
kept us from spying on marginzalized and threatened communities ALSO kept us from
spying on criminals, trolls and harassers.

Unfortunately, I don't think there's a way to square this circle. Instead of
building in the ability to proactively monitor user activity, we decided we
would need to respond to this reactively. We built UserLAnd so that it was
impossible for us to provide information about what any given user was doing on
their cloud boxes. The situation currently unfolding in the US was what pushed
us toward this solution. In both our hometown of Portland and in the Southwest
border region it has been shown that legal officials have used their ability to
compel the release of emails and logs to prosecute activists for unrelated and
often spurious "crimes" surrounding their activies. In keeping with values of
our sister company, Private Internet Access, we decided that the best course for
us would be to limit our _ability_ to cooperate with potentially hostile law
enforcement, whether American or otherwise.

We cannot give evidence that we do not have.

That said, if something objectionable did occur on UserLAnd, and frankly, this
being the internet, there was little doubt that something _would_ eventually, we
retained the ability and the discretion to halt their boxes and suspend their
accounts.

## The Curtain Lifts

Sadly, UserLAnd as a company dedicated to producing this product sustainably no
longer exists. It's possible with a little luck we could resurrect it, but at
this point, there's probably not much hope, just a fool's hope.

But! The servers are paid up through the end of the year, and since we spent a
lot of time focusing on costs, there's not much cost associated with continuing
to run the platform. Today, we're able to release a limited beta of UserLAnd
Cloud with the ability for a small number of users to take advantage of the
platform we've built, and hope that at least some find it useful. The UserLAnd
App is also being maintained as an open source project going forward, with the
same core group of developers working on it as their availability allows. If
you're interested in helping with this effort, hit us up on
[github](http://github.com/cypherpunkarmory/userland) (NB - we will probably
change up the organization as our parent company winds down it's involvement
in day-to-day operations. They are currently gracious enough to continue paying
for our infrastructure costs, as well as a single FTE employee.)

Sign up for the UserLAnd Cloud beta at [userland.tech](http://userland.tech).
Reclaim the power of your smartphone and help us put the power of the internet
back into the hands of the people who use it and benefit from it.

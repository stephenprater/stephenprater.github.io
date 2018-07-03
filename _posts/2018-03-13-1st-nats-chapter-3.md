---
layout: post
title: "The Book of NATS I - Chapter 3"
date: 2018-03-13
categories: cautionary-tales tools nats
---

Sit down everybody, lemme tell you a story.  **Flicks the lightswitch**

In a time long ago, there was ActiveSupport::Notifications, and it was good.
But the people desired to send messages to remote applications without crafting
specific calls to special API endpoints.  And Prater came upon this problem and
decide "I will fix it" so he paired with Peychich and created the NATSAdapter
for Goldstar Notifications, and it required no code changes to work with
existing code.  And he looked upon his PR and saw that it was good.

And then, behold he tried to deploy it to Staging and all was well, and he
looked upon his code and he should have been suspicious, but his mind was
undone with the promise of the beauty of the world to come, and the elegance of
the thing he had crafted, and he put down his doubts, and he pushed himself to
deploy.

And deploy he did.  In the beginning the Deploy was with Jenkins and the
Jenkins had the deploy - and lo it came to pass that Staging was Very Different
Than Production, and signals that were received in Production were not received
in Staging, and therefore that case was not handled.  So Prater went back to
his editor, where he introduced _reconnection logic_.  And the PR review saw that it
was good and smiled.  And they deployed the _reconnection logic_ to Staging, and all
was well.

But when, in the fullness of time, he deployed to production again, the Great
Enemy _MultiThreading_ bared it's mouth of fangs and said "Lo, beware, for
although you have introduce _reconnection_ I have Thread Safe Concurrency
Constructs that are as Queues and Condition Variables and it is not my will that your
deploy should go smoothly."

Indeed, when the time for the deploy was upon the developers, the Unicorn
processes would shut down, and they would disconnect from NATS, and they would
send messages that said "We are no longer interested in what you have to say,
for we are tired, and wish to shut down.  Give your messages to the children of
the new master!"  But little did the developers know, that they had been
deceived - for no messages could be received on _any_ channel when they were
disconnected, and there was much wailing and gnashing of teeth - for every
deploy resulted in 15 seconds of intermittent downtime.

But then Prater and Jared beheld the situation and in their folly they
proclaimed "A one line change!" and so they changed the one line and proceed
with testing.  For in in the darkness had been crafted that most terrible
of sins, the thing that developers have dreaded since the dawn of time - _a
library bug_.  And Prater and Jared looked upon their minimal reproduction case
and despaired - for the bug was not in their code, but deep within the library,
and any method called from within the threaded closure would fail, and it's
children would fail, and so-on for ever and ever, deadlock.

Many changes were thrown against the problem that day - and many dark avenues of
promising fixes came to their ends in alleys of shared state, but finally, in a
a final fit of desperation, Prater and Jared decided to use the weapons of their
enemey against them, and introduced a Thread Safe Queue to their own code.

And there was much rejoicing in the land, for all of their testing indicated
that it would work.  The developers recreated an environment with forks and
signals locally and they applied their changes, and everything worked as expected, and
connections were not lost, and the people did feast upon the glory that was a
distributed pub-sub system, and there was much rejoicing in the land.

But still, Prater is watchful - for he has been burned before and it has left
scars upon his heart, and fell mood upon his mind.

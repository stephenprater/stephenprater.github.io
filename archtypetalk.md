# In which we mediate on the various species of programmers, their various and
# sundry habits, and their place in the whole of creation.

We've all heard the old joke about there being three kinds of projects, good,
fast, and smart. Here's a venn diagram.  Venn diagrams are cool.  You may have
heard this as good cheap and fast, but it's the other thing - because otherwise
this talk won't make much sense.

Because we know there are three types of *programs* it follows that there should
be three types of *programers*.  We won't use words like "good" here because
that implies that the other two are "bad" and that's not what we really want to
say.  So instead of that, let's go with "correct" - which is still kind of
unfortunate because it implies "incorrect" - but I'm thinking more along the
lines of "teachers edition."

#Correct - The Engineer

Beautiful Code Like reading poetry 
Seriously, you could use it to teach rodents.

The guy who throws DOWN over white space.

He can ALWAYS point out a violation of SRP in your project.

Comes back to a project after FIVE years - still understands it.

The guy you want teaching other devs to code.
The guy you do NOT WANT doing your code review.

Examples:
Guido Van Rossum
Sandi Metz

Likes:
Nothing is really worth liking - it's all crap.
The CONCEPT of beauty.

Hates:
Deadlines
Sharing with you philistines.
Repositories where other people have commit rights.

Editor:
None.  Programs as god intended - by flippings bits in ram with cosmic rays.

Language most likely to learn:
Agda, Haskell

May have submitted a pull request to:
Add the final keyword to Ruby.
Delete all code from previous version and replace with the platonic form of
equivalent functionality.

The worst part about this guy:
He's almost always right, and you know it.

The best part about this guy:
You can almost always improve your code by asking him.

Weaknesses:
Having to look at your shitty code.
Unaligned assignments

D&D Joke:
Paladin

Quote:
OH GOD MY EYES.

#Smart - the Artist

There's a solution you didn't see.  It's elegant, fast and perfect.  He came up
with it.

Know every dark corner of every language he knows.
May have implemented co-routines in BASIC as a child.

Has actually typed the words 'require "continuation"' - and knows why.

Has NEVER come back to a project after three years.

Solves P = NP, bitches

Examples:
\_why

Likes:
The flipflop operator, re-entrant combinators, and monads

Hates:
Bugs (you have to fix them)
Writing tests.

Editor:
Emacs, Tricked-Out Vim.

Language most likely to learn:
Lisp, Prolog

May have submitted a pull request to:
Condense 5 classes and a state machine to a Fiber and Proc

The worst part about this girl:
You never understand what he's talking about

The best part about this girl:
She can teach you the deep magick if you are willing to learn.

Weaknesses:
Chances to use asynchronous re-entrant fibers.

D&D Joke:
Druid

Quote:
Hey - have you seen this?!


#Fast - the Hacker

It's already done. Yes it works.

Doesn't actually get to carry a gun.

Has a crap ton of Stackoverflow book marks.

Comes back to a project after three years - rewrites it in less time than it
took you to understand it the first time.

Examples:
Larry Wall
matz

Likes:
Loops, ternaries, hashes.

Hates:
charts, code reviews, meetings, edge cases

Editor:
Whatever's around.  Sublime? Great - Vim - Great.  Notepad? Cool.

Language most likely to learn:
PHP, Perl, Ruby

May have submitted a pull request to:
A pull request?  Submitted 30.

#The programmer archtype cosmo quiz

1) You have some free time.  What are you doing with it?
  a) I'm cleaning up this mess I left.
  b) I'm thinking about rewrite this app in Clojure
  c) I'm arguing with the premise that I have 'free time'


2) You have just received a new project - what's your first thought.
  a) I need to write features!
  b) Ooo! Where's that article about hyper-APIs?
  c) I think I can just copy 85% of the last project I did.


3) One of your coworkers has a question about one of your previous projects
- your response is:
  a) That's never actually happened to me.
  b) Are you familiar with co-routines?
  c) Fake your own death and try to establish a new identity in Tasmania


4) The deadline is looming.  You're not going to make it - what do you do?
  a) It's done when's done.  Soldier on.
  b) Break out this new technique you've been wanting to try.  Should be faster.
  c) Perform a miracle, meet the deadline.


5) You have a degree in:
  a) Computer Science - Abstract Mathematics minor.
  b) English - Russian Existenialist literature minor.
  c) BS from the University of Gettin' Shit Done.

6) People have described you as:
  a) an asshole
  b) a flake
  c) dangerous


7) You have a choice of what project to work on next - which one do you take?
  a) Refactoring a legacy application into composable modules.
  b) Trying to write an algorithim to pack boxes more efficiently.
  c) Spiking out a new user interface


8) Write your own question 8.
  a) No.
  b) Have you read Gödel, Escher and Bach?
  c) Hell no.

9) What's the best way to train new developers?
  a) Master & Apprentice - Jedi Style.
  b) Have them read important books until enlightment descends upon them.
  c) Start swimming motherfucker.

6) You find this quiz:
  a) Ludicrous
  b) Could've been funnier.
  c) Wasteful
  d) all of the above


#The point of all of this crap

Note that these are the kinds of *good* programmers.

There are an infinite number of ways to be *bad* programmer - you can even be
one of these three types and not be any good at your job.

HOWEVER - let's speak frankly. Programmers are _duck typed_ - we may all
respond_to? :write_code - but the implemenation of that method is going to be
different from every single person.

Some of us will spit out this.
    d = ["herp", "derp"]
    for derpage in d do
      puts derpage
    end

Face it.  That works.

Some uf us will spit out this.

    class Herper
      def herp
        "herp"
      end

      def derp
        "derp"
      end

      def derpage
        puts herp
        puts derp
      end
    end

Face it.  You know exactly what this does.

Some of us will write this.

    Class.new(Object) do |c|
      %w(herp derp).each do |p|
        define_method p do
          p.to_s
        end
      end

      def method_missing
        puts [herp, derp].inject("", &:concat)
      end
    end


Face it.  Thats.... I didn't know you could do that with inject.

Eace one of these gals brings something to the team that you otherwise
wouldn't have - whether it'sa  need for speed, discipline and craft, or
a sidewise perspective.  Without them all you get a group steepd in groupthink
and self-reinforcing behavior.

And old aphorism: 'It's impossible to impress other engineers.'

How many bikeshedding arguments have we all been in about stupid concerns
orthognal to the task at hand.  Should this be class or a method?  Should we
escape from this deeply nested loop with a throw or with an exception?  Is this
good enough?

The point of developing is not to be the smartest person in the room - it's not
to be the best programmer in three states or to impresss girls (or guys) at
parties.  (Futhermore - what sort of party is it that people are impressed by
programmer knowledge?) it's to make people's lives better through software

So quit yer bitchin' about how Bob at the next desk uses inject when clearly he
means each_with_object or how Frank downstairs keeps replacing five line methods
with AbstractFactoryInterfaceFactories.  Focus on ideas - not the people doing
the work.

Great minds discuss ideas; average minds discuss events; small minds discuss
people. - Eleanor Roosevelt

Remember we are all special snowflakes - small minded special snowflakes.







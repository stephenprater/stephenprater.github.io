---
layout: post
title:  "A Docker, quickly"
date:   2016-10-12
categories: docker ops howto
---

Today, I needed a way to test a gem with some sort of odd dependencies.  That
is - it had very specific opsy stuff that needed to happen in order for it to
be tested, but CI being what it is, that's easier said than done.


Luckily for me, I've got Docker. Docker Compose (the program formerly known as
fig) is pretty much perfect for this application, since it can start various
services that might or might not exist in your CI service.  Unfortunately, if
you're using TravisCI, the version of Docker they support (1.9 last time I
checked) doesn't really support `docker-compose.`  We're using CircleCI though,
so with a little bit of effort, we're able to lean on Compose to provide services
during the test run.

Anyway, this gem is pretty simple - it provides a CLI and API wrapper around a
[consul](https://www.consul.io) - a key value store great for managing distributed
application configuration.

Compose provides a simple way to declaratively describe your "app" and it's associated
services.  In this case, that's easy - we have a Consul Cluster and a simple CLI
container to run our tests in.

{% highlight yaml %}
version: '2'
services:

  consul:
    image: consul

  default:
    build: .
    command: bash -l -c 'bundle exec rspec spec'
    links:
      - consul
    volumes:
      - .:/gem/
{% endhighlight %}

{% include image.html url="/assets/photos/containers.jpg" class="right" caption="Running in containers" %}

This is pretty straightforward, we need to make sure that we have a consul
container and a `default` container that runs the specs.  Make sure that
`consul` appears in the links section, and link the current working directory to
the `/gem` directory in the default container.

If you've got multiple services, add them all into the `docker-compose.yml` file.

However, we're missing a pretty critical piece of the puzzle here, which is the
definition of the default docker container.  The `build: .` line tells compose to
build it from the Dockerfile found in the working directory, and again, it's
surprisingly straightforward.

{% highlight docker %}
# pull our ruby version
FROM ruby:2.3.1-alpine
MAINTAINER <your name here>

RUN apk update && apk add bash build-base git gcc abuild binutils binutils-doc gcc-doc
RUN gem install bundler

WORKDIR /gem/
ADD . /gem/
RUN bundle install

VOLUME .:/gem/

ENTRYPOINT ["bundle", "exec"]
CMD ["rake", "-T"]
{% endhighlight %}


You can pretty much copy this straight up, unless you want to run on a different
ruby version, or you need specialized packages compiled (imagemagick
or pg_client maybe?)  We're using the offical Alpine Ruby container because it's
pretty lightweight for a docker container.  Alpine Linux doesn't include very much in the
way of dependencies right out of the gate (not even bash) - so we do have to install a few
things using Alpines package manager `apk.` Mounting the volume at the current
working directory let's us work on our gem without needing to attach to the container
and copy the files back and forth.

At this point, you're ... done-ish.  A simple `docker-compose up` will run the tests
and since they all passed the first time, you can push to RubyGems and call it a
day right?

But if you still have work to do - here's a couple of things to remember.

* The hostname of your service within the container is the top-level YAML key

> In my case, this was `consul` - I needed to make sure my consul connection
> was configurable in my Gem, since rather than `localhost`, I needed to
> connect to `consul` in my tests.

* Running individual tests requires some extra ceremony, but you have a couple of
different choices here.

> `docker-compose run default bundle exec rspec spec`

Uhh. Yikes.  If you disect it it's pretty clear what it's doing, but that's a lot
of words to type. I use zsh, so I generally add a function like this to my `.zshrc`

{% highlight zsh %}
dbe() {
  docker_cmd="$(which docker-compose)"
  ${docker_cmd} run default bundle exec "$*"
}
{% endhighlight %}

This lets me type `dbe rspec spec` - which is super short, and less typing is obivously
the ultimate goal of any programmer worth their weight in bacon.

At this point, we can use `dbe` as a sort-of-kind-of standalone executable for the entire
environment the gem needs. (Think bundle, but it includes a database!) It's simpler than
trying to make sure you've got your local environment setup perfectly, and when you push
it to a CI system with Docker support, there's less configuration to do there as well.

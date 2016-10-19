---
layout: post
title:  "Stupid Ruby Tricks"
date:   2016-10-18
categories: ruby
---

```
1] pry(main)> a = { foo: 'bar' }
{
    :foo => "bar"
}
[2] pry(main)> a * 2
NoMethodError: undefined method `*' for {:foo=>"bar"}:Hash
from (pry):3:in `__pry__'
[3] pry(main)> [a] * 2
[
    [0] {
        :foo => "bar"
    },
    [1] {
        :foo => "bar"
    }
]
[4] pry(main)>
```


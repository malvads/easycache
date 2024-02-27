# EasyCache
<p align="center">

[![Gem Version](https://badge.fury.io/rb/easy-cache.svg)](https://badge.fury.io/rb/easy-cache)
![License](https://img.shields.io/badge/license-AGPL%203.0-blue.svg)
[![Lint](https://github.com/malvads/easy-cache/actions/workflows/lint.yml/badge.svg)](https://github.com/malvads/easy-cache/actions/workflows/lint.yml)
[![Tests](https://github.com/malvads/easy-cache/actions/workflows/tests.yml/badge.svg)](https://github.com/malvads/easy-cache/actions/workflows/tests.yml)
[![Build](https://github.com/malvads/easy-cache/actions/workflows/build.yml/badge.svg)](https://github.com/malvads/easy-cache/actions/workflows/build.yml)
</p>
EasyCache is an in-memory cache system for Ruby designed for situations where you don't want to set up Redis or Memcached but still need a simple solution for caching key-value data.

## Install

```
gem install easy-cache
```

## Usage

To use EasyCache in your Ruby project, require the library and include it in your code:

```ruby
require 'easycache'

cache = EasyCache.new
```

## Storing data

```ruby
key = "my_key"
cache_ttl = 3600
store_in_mem = true
data = cache.fetch(cache_key, cache_ttl, store_in_mem) do
    my_http_get
end
```

Now data is in-mem for the next 3600 second (store_in_mem variable is important for storing data first time).

## Getting data

If i want to get the data stored in mem i do

```ruby
data = cache.fetch("my_key")
```

or i can also re-call the same function

```ruby
data = cache.fetch("my_key", cache_ttl, store_in_mem) do
    my_http_get
end
```

because the data is already cached, so it will not call the block, it will return the cached data instead.

This will output the cached data, remember that cached data is stored in mem for only 3600 seconds

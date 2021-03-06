# NamedStruct [![Build Status](https://travis-ci.org/mshytikov/named_struct.svg?branch=master)](https://travis-ci.org/mshytikov/named_struct) [![Code Climate](https://codeclimate.com/github/mshytikov/named_struct/badges/gpa.svg)](https://codeclimate.com/github/mshytikov/named_struct)

Simple object to wrap your configuration, it can be instantiated only
with required named arguments.

Usually you do :

```
class MyConfig
  att_reader :a, :b, :c

  def initialize(a:, b:, c:)
    @a = a
    @b = b
    @c = c
  end

end

```

But now you can :

```
class MyConfig < NamedStruct::Config
   attr_required :a, :b, :c
end

```

## Installation

Add this line to your application's Gemfile:

    gem 'named_struct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install named_struct

## Usage

```
require 'named_struct'

class MyConfig < NamedStruct::Config
   attr_required :a, :b, :c
end

my_config = MyConfig.new(a: 10, b: 20, c: 30)

class MySuperAlgorithm
   def initialize(my_param, **config)
      @my_param = my_param
      @config = MyConfig.new(**config)
   end
end

MySuperAlgirithm.new("some param", a: 12, b: 10, c: 50)
```

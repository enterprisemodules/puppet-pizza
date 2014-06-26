####Table of Contents

[![Powered By EasyType](https://raw.github.com/hajee/easy_type/master/powered_by_easy_type.png)](https://github.com/hajee/easy_type)


1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the pizza module](#setup)
    * [What the pizza module affects](#what-the-pizza-module-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
    * [OS support](#os-support)
    * [Tests - Testing your configuration](#testing)

##Overview

This module contains a couple of Puppet custom types to be used in teaching people what puppet is and how it works. We use the concept of baking a pizza to explain Puppet resources and the order of the resources. Checkout [this blog post](http://hajee.github.io/2014/06/26/pietros-puppet-pizza-place-1/) if you want to learn Puppet.

##Module Description

This module contains custom types that can help in learning about puppet. We 've created some types to help Pietro's Puppet Pizza Place. Pietro's place is running like crazy. He actually gets more customers than he can handle. He is now working on a pizza backing robot. However, he needs some (configuration management) tools to tell the robot what to bake if a large pepperoni pan pizza is ordered.

With the custom types in this module you can instruct the robot to:
* Create a Pizza Crust
* Add tomato Sauce
* Add Cheese
* Add slices of salami
* Add slices of bacon
* Add some anchovy
* Add some mushrooms

##Setup

###What the pizza module affects

The pizza module writes all Pizza resources to ~/.puppet_data.yaml. If you want to start from scratch, just delete the file. Because we use a user specific file. Every user on the system can do this without running into each other.

###Setup Requirements

The pizza module is based on [easy_type](https://github.com/hajee/easy_type). You need to have it installed.

```
$ puppet module install hajee/easy_type
$ puppet module install hajee/pizza
```


##Usage

The module contains the following types:

`crust`, `tomato_sauce`, `salami` , `bacon`, `mushroom`, `anchovy` and `cheese`. Here are a couple of examples on how to use them.

###crust

To get started, select a pizza crust. You can specify what dough you want; how large it needs to be in inched. If you prefer a pan pizza, just select type pan. If you want a regular one, just use type regular.

```puppet
crust {'large_wholesome_pan_crust':
  ensure  => 'baked',
  dough  => 'wholesome',
  size   => '40',
  type   => 'pan',
}
```

###tomato_souce

Pizza is no pizza without some delicious tomato sauce. We have a lot of types tomato sauces for you. You can select:
- cristal,
- tamaris,
- sampei

If you want **A LOT OF SAUCE** specify a large amount. We also have support for thick and thin composure of the sauce.

```puppet
  tomato_souce{'think_cristal':
    type        => 'cristal',
    composure   => 'thick',
    amount      => 2, # grams
    notify      => Crust['large_wholesome_pan_crust'],
  }
```

Because you want the customer to get warm pizza, you add a notify to the sauce and any other ingredients. This means that when you change something, the pizza is put back in the oven toe be reheated.

###salami

You need an excuse to drink some extra beer? Select the salami on the pizza.  Select the number of slices you want.

```puppet
  salami{'extra_salami':
    slices      => 6,
    require     => Tomato_souce['think_cristal'],
    notify      => Crust['large_wholesome_pan_crust'],
  }
```

###bacon

If salami is too spicy, but you want the meat, you can select bacon.

```puppet
  salami{'extra_salami':
    slices      => 6,
    require     => Tomato_souce['think_cristal'],
    notify      => Crust['large_wholesome_pan_crust'],
  }
```

###anchovy

If you are more of a fish eater, you can select anchovy for your pizza.

```puppet
  anchovy{'some_seafood':
    amount      => 2, # grams
    require     => Tomato_souce['think_cristal'],
    notify      => Crust['large_wholesome_pan_crust']
  }
```

###mushrooms

For vegetarians, we've got something special. You can select the mushrooms. They might be magical.

```puppet
  mushroom{'magical':
    amount      => 2, # grams
    require     => Tomato_souce['think_cristal'],
    notify      => Crust['large_wholesome_pan_crust']
  }
```

###cheese

We have a lot of flavor's cheese available. You can select:
- mozzarella,
- provolone,
- parmigiano_reggiano,
- grana_padano

Just name your pick.

```puppet
  cheese{'mozzarella_thick':
    type    => 'mozzarella',
    amount  => 2g,
    require => Salami['extra_salami'],
    notify      => Crust['large_wholesome_pan_crust']
  }
```

##Your own toppings

You are welcom to create your own toppings. Using easy_type it's actually very easy. Just take a look at the bacon custom type for example.

##Limitations

This module runs on ruby 1.8.7 and higher. We need at least puppet version 2.7. There are no other known limitations.

##Development

This is an open source projects, and all contributions are welcome. 

###OS support

Currently we have tested:

* OSX 10.9

It will probably run on any OS because it doesn't really contain any OS specific stuff.


###Testing

There are no tests implemented. If this starts to be used at a larger scale, we should add them.

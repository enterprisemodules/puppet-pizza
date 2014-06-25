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

This module contains a couple of Puppet custom types to be used in teaching people what puppet is and how it works. We use the consept of baking a pizza to explain Puppet resources and the order of the resources.

##Module Description

This module contains custom types that can help you manage DBA objects in an Oracle database. It runs **after** the database is installed. IT DOESN'T INSTALL the Oracle database software. With this module, you can setup a database to receive an application. You can:

* create a Pizza Crust
*  Add tomato Sauce
*  Add Cheese
*  Add slices of salami

##Setup

###What the pizza module affects

The pizza module writes all Pizza resources to ~/.puppet_data.yaml. If you want to start from scratch, just delete the file. Because we use a user specific file. Every use on a system can do this without running into each other.

###Setup Requirements

The pizza module is based on [easy_type](https://github.com/hajee/easy_type). You need to have it installed.

```
$ puppet module install hajee/easy_type
```


##Usage

The module contains the following types:

`crust`, `tomato_sauce`, `salami` and `cheese`. Here are a couple of examples on how to use them.

###crust

To get started, select a pizza crust. You can specify what dough you want; how large it needs to be in inched. If you prefer a pan pizza, just select type pan. If you want a regular one, just use type regular.

```puppet
crust {'large_wholesome_pan_crust':
  ensure  => 'present',
  dough  => 'wholesome',
  size   => '40',
  type   => 'pan',
}
```
###tomato_souce

Pizza is no pizza without some delicious tomatou sauce. We have a lot of types tomato souces for you. You can select:
- cristal,
- tamaris,
- sampei

If you want **A LOT OF SAUCE** specify a large amount. We also have support for thick and thin composure of the sauce.

```puppet
  tomato_souce{'think_cristal':
    type        => 'cristal',
    composure   => 'thick',
    amount      => 2g
    require     => Crust['large_wholesome_pan_crust']
  }
```

###salami

You need an excuse to drink some extra beer? Select thesalami on the pizza.  select the number of slices you want.

```puppet
  salami{'extra_salami':
    slices      => 6,
    require     => Tomato_souce['think_cristal'],
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
  }
```
##Limitations

This module runs on ruby 1.8.7 and higher. We need at least puppet version 2.7. There are no other known limitations.

##Development

This is an open projects, and contributions are welcome. 

###OS support

Currently we have tested:

* OSX 10.9

probably it will run an any OS because it doesn't really contain any OS specific stuff.


###Testing

There are no tests implemented. If this starts to be used at a larger scale, we should add them.

crust{"large_wholesome_thin_crust":
    ensure    => baked,
    size      => 20,          # 10", 20"
    type      => 'thin',       # thin
    dough     => 'wholesome', # wholesome ore white
  }

  tomato_sauce{"thin_cristal":
    ensure      => 'present',
    type        => 'cristal',
    composure   => 'thick',
    amount      => 5,
  }


  cheese{"mozzarella_thick":
    ensure      => 'present',
    type        => 'mozzarella',
    amount      => '2',
  }


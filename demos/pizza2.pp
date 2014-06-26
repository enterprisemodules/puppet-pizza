crust{"medium_wholesome_thin_crust":
    ensure    => baked,
    size      => 10,          # 10", 20"
    type      => 'thin',       # thin
    dough     => 'wholesome', # wholesome ore white
}

tomato_sauce{"thick_cristal":
  ensure      => 'present',
  type        => 'cristal',
  composure   => 'thick',
  amount      => 5,
  require     => Crust["medium_wholesome_thin_crust"],
}

cheese{"a_lot_of_mozzarella":
  ensure      => 'present',
  type        => 'mozzarella',
  amount      => '4',
  require     => Tomato_sauce["thick_cristal"],
}


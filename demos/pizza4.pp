define pizza($order_no)
{
  crust{"${order_no}/medium_wholesome_thin_crust":
      ensure    => baked,
      size      => 10,          # 10", 20"
      type      => 'thin',       # thin
      dough     => 'wholesome', # wholesome ore white
  }
  tomato_sauce{"${order_no}/thick_cristal":
    ensure      => 'present',
    type        => 'cristal',
    composure   => 'thick',
    amount      => 5,
    require     => Crust["${order_no}/medium_wholesome_thin_crust"],
  }
  cheese{"${order_no}/a_lot_of_mozzarella":
    ensure      => 'present',
    type        => 'mozzarella',
    amount      => '4',
    require     => Tomato_sauce["${order_no}/thick_cristal"],
  }
}
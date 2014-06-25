class pizza::large_pepperoni_pan( 
  $order_no = undef,
)
{
  if $order_no {
    $order = "${order_no}/"
  } else {
    $oder = ''
  }

  crust{"${order}large_wholesome_pan_crust":
    ensure    => baked,
    size      => 20,          # 10", 20"
    type      => 'pan',       # thin
    dough     => 'wholesome', # wholesome ore white
  }

  tomato_sauce{"${order}thin_cristal":
    ensure      => 'present',
    type        => 'cristal',
    composure   => 'thick',
    amount      => 5,
    notify      => Crust["${order}large_wholesome_pan_crust"],
  }

  salami{"${order}extra_salami":
    ensure      => 'present',
    slices      => 6,
    require     => Tomato_sauce["${order}thin_cristal"],
    notify      =>  Crust["${order}large_wholesome_pan_crust"], 
  }

  cheese{"${order}mozzarella_thick":
    ensure      => 'present',
    type        => 'mozzarella',
    amount      => '2',
    require     => Salami["${order}extra_salami"],
    notify      =>  Crust["${order}large_wholesome_pan_crust"], 
  }

}
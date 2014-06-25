class pizza::large_pepperoni_pan
{
  crust{'large_wholesome_pan_crust':
    size      => 20,          # 10", 20"
    type      => 'pan',       # thin
    dough     => 'wholesome', # wholesome ore white
  }

  tomato_sauce{'think_cristal':
    type        => 'cristal',
    composure   => 'thick',
    amount      => '2',
    require     => Crust['large_wholesome_pan_crust'],
  }

  salami{'extra_salami':
    slices      => 6,
    require     => Tomato_sauce['think_cristal'],
  }

  cheese{'mozzarella_thick':
    type    => 'mozzarella',
    amount  => '2',
    require => Salami['extra_salami'],
  }

}
require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'
require 'utils/pizza'

module Puppet
  Type.newtype(:tomato_sauce) do
    include EasyType
    include Utils::JsonAccess
    include Utils::Pizza

    desc <<-'EOT'
      Add tomato sauce to the pizza or modify the amount of
      sauce on your pizza. An example:

          tomato_sauce{"thin_cristal":
            ensure      => 'present',
            type        => 'cristal',
            composure   => 'thick',
            amount      => 5,
            notify      => Crust["${order}large_wholesome_pan_crust"],
          }

    EOT

    ensurable

    define_type_methods

    parameter :name
    property  :composure
    property  :amount
    property  :type

  end
end

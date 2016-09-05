require 'pathname'
require 'yaml'

$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'
require 'utils/pizza'

module Puppet
  #
  # Create a new type oracle_user. Oracle user, works in conjunction
  # with the SqlResource provider
  #
  Type.newtype(:cheese) do
    include EasyType
    include Utils::JsonAccess
    include Utils::Pizza

    desc <<-'EOT'
      Add cheese to the pizza or modify the amount of
      cheese on your pizza. An example:

        cheese{"extra_cheese":
          ensure      => 'present',
          amount      => 2, # gr
          require     => Tomato_sauce["thin_cristal"],
          notify      => Crust["large_wholesome_pan_crust"],
        }

    EOT

    ensurable

    define_type_methods


    parameter :name
    property  :amount
    property  :type

  end
end

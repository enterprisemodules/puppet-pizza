require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'
require 'utils/pizza'

module Puppet
  Type.newtype(:salami) do
    include EasyType
    include Utils::JsonAccess
    include Utils::Pizza

    desc <<-'EOT'
      Add salami to the pizza or modify the amount of
      salami on your pizza. An example:

        salami{"extra_salami":
          ensure      => 'present',
          slices      => 2,
          require     => Tomato_sauce["thin_cristal"],
          notify      => Crust["large_wholesome_pan_crust"],
        }

    EOT

    ensurable

    define_type_methods

    parameter :name
    property  :slices

  end
end

require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'
require 'utils/pizza'

module Puppet
  Type.newtype(:bacon) do
    include EasyType
    include Utils::JsonAccess
    include Utils::Pizza

    desc <<-'EOT'
      Add bacon to the pizza or modify the amount of
      bacon on your pizza. An example:

        bacon{"extra_bacon":
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

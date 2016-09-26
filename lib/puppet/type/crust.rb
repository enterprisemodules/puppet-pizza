require 'pathname'
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'
require 'utils/pizza'

module Puppet
  Type.newtype(:crust) do
    include EasyType
    include Utils::JsonAccess
    include Utils::Pizza

    desc <<-'EOT'
      Select the crust for your pizza. An example:

      crust{"large_wholesome_pan_crust":
        ensure    => baked,
        size      => 20,          # 10", 20"
        type      => 'pan',       # thin
        dough     => 'wholesome', # wholesome ore white
      }

    EOT

    define_type_methods

    on_notify do
      Puppet.info 'Putting pizza in oven for a reheating'
    end

    parameter :name
    property  :ensure
    property  :size
    property  :type
    property  :dough
  end
end

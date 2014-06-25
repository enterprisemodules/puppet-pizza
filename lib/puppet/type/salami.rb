require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/pizza_access'

module Puppet
  newtype(:salami) do
    include EasyType
    include ::Utils::PizzaAccess

    desc %q{
      This resource manages the salami you put on your pizza.
    }

    ensurable

    to_get_raw_resources do
      read_yaml_for(:salami)
    end

    on_create do | command_builder |
      add_to_yaml(:salami, sanitized_resource)
    end

    on_modify do | command_builder |
      modify_in_yaml(:salami, sanitized_resource)
    end

    on_destroy do | command_builder |
      delete_from_yaml(:salami, sanitized_resource)
    end


    parameter :name
    property  :slices

  end
end

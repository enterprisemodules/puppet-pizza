require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'

module Puppet
  newtype(:tomato_sauce) do
    include EasyType
    include ::Utils::JsonAccess

    desc %q{
      This resource manages the tomato_sauce you put on your pizza.
    }

    ensurable

    to_get_raw_resources do
      read_yaml_for(:tomato_sauce)
    end

    on_create do | command_builder |
      add_to_yaml(:tomato_sauce, sanitized_resource)
    end

    on_modify do | command_builder |
      modify_in_yaml(:tomato_sauce, sanitized_resource)
    end

    on_destroy do | command_builder |
      delete_from_yaml(:tomato_sauce, sanitized_resource)
    end

    parameter :name
    property  :composure
    property  :amount
    property  :type

  end
end

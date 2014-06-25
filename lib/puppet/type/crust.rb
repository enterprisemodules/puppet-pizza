require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'ruby-debug'
require 'utils/json_access'

module Puppet
  newtype(:crust) do
    include EasyType
    include Utils::JsonAccess

    desc %q{
      This resource manages the crust you use for your pizza
    }

    ensurable

    to_get_raw_resources do
      read_yaml_for(:crust)
    end

    on_create do | command_builder |
      add_to_yaml(:crust, sanitized_resource)
    end

    on_modify do | command_builder |
      modify_in_yaml(:crust, sanitized_resource)
    end

    on_destroy do | command_builder |
      delete_from_yaml(:crust, sanitized_resource)
    end

    parameter :name
    property  :size
    property  :type
    property  :dough

  end
end

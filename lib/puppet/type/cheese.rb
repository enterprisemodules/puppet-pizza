require 'pathname'
require 'yaml'

$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'

module Puppet
  #
  # Create a new type oracle_user. Oracle user, works in conjunction 
  # with the SqlResource provider
  #
  newtype(:cheese) do
    include EasyType
    include Utils::JsonAccess

    desc %q{
      This resource manages the cheese you put on your pizza.
    }

    ensurable

    to_get_raw_resources do
      read_yaml_for(:cheese)
    end

    on_create do | command_builder |
      add_to_yaml(:cheese, sanitized_resource)
    end

    on_modify do | command_builder |
      modify_in_yaml(:cheese, sanitized_resource)
    end

    on_destroy do | command_builder |
      delete_from_yaml(:cheese, sanitized_resource)
    end


    parameter :name
    property  :amount
    property  :type

  end
end

require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/json_access'
require 'utils/pizza'

module Puppet
  newtype(:crust) do
    include EasyType
    include Utils::JsonAccess
    include Utils::Pizza

    desc %q{
      This resource manages the crust you use for your pizza
    }


    define_type_methods

    parameter :name
    property  :ensure
    property  :size
    property  :type
    property  :dough

  end
end

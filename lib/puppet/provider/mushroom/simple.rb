Puppet::Type.type(:mushroom).provide(:simple) do
  include EasyType::Provider
  mk_resource_methods

end


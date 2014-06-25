Puppet::Type.type(:bacon).provide(:simple) do
  include EasyType::Provider
  mk_resource_methods

end


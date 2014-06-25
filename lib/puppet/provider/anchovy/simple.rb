Puppet::Type.type(:anchovy).provide(:simple) do
  include EasyType::Provider
  mk_resource_methods

end


Puppet::Type.type(:ansjovis).provide(:simple) do
  include EasyType::Provider
  mk_resource_methods

end


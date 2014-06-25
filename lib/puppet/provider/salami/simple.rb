Puppet::Type.type(:salami).provide(:simple) do
	include EasyType::Provider
  mk_resource_methods

end


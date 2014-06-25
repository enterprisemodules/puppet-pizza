Puppet::Type.type(:oracle_service).provide(:simple) do
	include EasyType::Provider
  mk_resource_methods

end


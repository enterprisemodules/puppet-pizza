Puppet::Type.type(:role).provide(:simple) do
	include EasyType::Provider

  mk_resource_methods

end


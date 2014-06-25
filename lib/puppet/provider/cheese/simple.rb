Puppet::Type.type(:cheese).provide(:simple) do
	include EasyType::Provider

  mk_resource_methods

end


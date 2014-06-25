Puppet::Type.type(:tomato_sauce).provide(:simple) do
	include EasyType::Provider

  mk_resource_methods

end


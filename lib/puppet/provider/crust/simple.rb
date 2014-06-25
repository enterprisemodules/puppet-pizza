Puppet::Type.type(:crust).provide(:simple) do
	include EasyType::Provider

  mk_resource_methods

end


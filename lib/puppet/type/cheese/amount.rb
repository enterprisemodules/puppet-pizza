newproperty(:amount) do
  include EasyType

  desc "the type mount of cheese in gram's to put on your pizza"

  to_translate_to_resource do | raw_resource|
    raw_resource.column_data('amount')
  end
end

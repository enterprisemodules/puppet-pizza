newproperty(:slices) do
  include EasyType
  include EasyType::Mungers::Integer

  desc "the number of slices to put on your pizza"

  defaultto 4

  to_translate_to_resource do | raw_resource|
    raw_resource.column_data('slices')
  end
end

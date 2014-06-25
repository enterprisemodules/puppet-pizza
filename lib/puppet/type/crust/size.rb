newproperty(:size) do
  include EasyType
  include EasyType::Mungers::Integer

  desc "the size of the pizza crus in inches"

  to_translate_to_resource do | raw_resource|
    raw_resource.column_data('size')
  end
end

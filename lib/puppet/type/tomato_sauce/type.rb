newproperty(:type) do
  include EasyType

  desc "The type of tomato sauce to put on your pizza"
  newvalues(
    :cristal,
    :tamaris,
    :sampei
    )

  defaultto :cristal

  to_translate_to_resource do | raw_resource|
    raw_resource.column_data('type').downcase.to_sym
  end
end

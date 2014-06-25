newproperty(:type) do
  include EasyType

  desc "The type of crust"
  newvalues(
    :thin,
    :pan,
    :regular
    )

  defaultto :regular

  to_translate_to_resource do | raw_resource|
    raw_resource.column_data('type').downcase.to_sym
  end
end

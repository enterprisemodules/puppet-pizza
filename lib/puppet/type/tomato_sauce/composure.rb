newproperty(:composure) do
  include EasyType

  desc "The type of tomato sauce to put on your pizza"
  newvalues(
    :thick,
    :thin
    )

  to_translate_to_resource do | raw_resource|
    raw_resource.column_data('composure').downcase.to_sym
  end
end

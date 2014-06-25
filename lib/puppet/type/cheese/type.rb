newproperty(:type) do
  include EasyType

  desc "The type of cheese to put on your pizza"
  newvalues(
    :mozzarella,
    :provolone,
    :parmigiano_reggiano,
    :grana_padano
    )

  to_translate_to_resource do | raw_resource|
    raw_resource.column_data('type').downcase.to_sym
  end
end

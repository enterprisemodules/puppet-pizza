newproperty(:dough) do
  include EasyType

  desc 'The type of dough to use for your crust'
  newvalues(
    :wholesome,
    :white,
    :regular
  )

  defaultto(:regular)

  to_translate_to_resource do |raw_resource|
    raw_resource.column_data('dough').downcase.to_sym
  end
end

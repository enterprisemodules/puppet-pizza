require 'puppet/face'
require 'utils/json_access'

Puppet::Face.define(:clean, '0.0.1') do
  extend Utils::JsonAccess

  option "--ingredient INGREDIENT" do
    summary "The ingredients to clean."
  end

  action(:clean) do
   default
   summary "Clean all piza's from the oven"
   when_invoked do | options |
    ingredient = options.fetch(:ingredient){'all'}
    Puppet.notice "Cleaned #{ingredient} from oven"
    clean_oven(ingredient)
    nil
   end
  end

  def clean_oven(ingredient)
    if ingredient == 'all'
      clean_all
    else
      delete_type(ingredient)
    end
  end

  def clean_all
    delete_yaml
  rescue Errno::ENOENT
    # Do nothing if file not found
  end

end


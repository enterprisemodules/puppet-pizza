module Utils
  module Pizza
    def self.included(parent)
      parent.extend(ClassMethods)
    end

    module ClassMethods

      def methods_for(type = name)
        to_get_raw_resources do
          read_yaml_for(type)
        end

        on_create do | command_builder |
          add_to_yaml(type, sanitized_resource)
        end

        on_modify do | command_builder |
          modify_in_yaml(type, sanitized_resource)
        end

        on_destroy do | command_builder |
          delete_from_yaml(type, sanitized_resource)
        end

      end
      alias_method :define_type_methods, :methods_for

    end
  end
end

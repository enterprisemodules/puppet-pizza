require 'yaml'
require 'easy_type'


module Utils
  module JsonAccess
    include EasyType::Helpers

    DATA_FILE = File.expand_path('~/.puppet_data.yaml')
    PUPPET_META_ATTRIBUTES = [:alias, :audit, :before, :loglevel, :noop, :notify, :require, :schedule, :stage, :subscribe, :tag, :provider]


    def self.included(parent)
      parent.extend(JsonAccess)
    end

    def sanitized_resource
      resource = sanetize(self.to_hash)
      resource[:ensure] = resource[:ensure].to_s if resource[:ensure]
      resource = key_to_string(resource)
      resource = symbol_value_to_string(resource)
      resource
    end

    def read_yaml_for(type)
      entry = yaml_data_for(type)
      entry.nil? ? [] : entry.collect {|e| InstancesResults[e]}
    end

    def add_to_yaml(type, data)
      if yaml_data_for?(type)
        yaml_data_for(type) << data
      else
        add_entry(yaml_data_for(type),data)
      end
      write_yaml_file
      nil #
    end

    def modify_in_yaml(type, data)
      if not yaml_data_for?(type)
        fail "We expected yaml file #{DATA_FILE} to exist, but it doesn't."
      else
        replace_entry(yaml_data_for(type),data)
      end
      write_yaml_file
      nil #
    end

    def delete_from_yaml(type, data)
      if not yaml_data_for?(type)
        fail "We expected yaml file #{DATA_FILE} to exist, but it doesn't."
      else
        delete_entry(yaml_data_for(type),data)
      end
      write_yaml_file
      nil #
    end


  private

    def delete_entry(set, value)
      set.delete_if {|entry| entry['name'] == value['name']}
    end

    def add_entry(set, value)
      set << value
    end

    def replace_entry(set, value)
      delete_entry(set,value)
      add_entry(set,value)
    end


    def write_yaml_file
      File.open( DATA_FILE, 'w' ) do |yaml_file|
        YAML.dump(yaml_data, yaml_file)
      end
    end

    def symbol_value_to_string(hash)
      hash.inject({}){|h,(k,v)| v.is_a?(Symbol) ? h[k] = v.to_s : h[k] = v; h}
    end

    def key_to_string(hash)
      hash.inject({}){|h,(k,v)| h[k.to_s] = v; h}
    end

    def sanetize(resource)
      resource.delete_if{|key, vaue| PUPPET_META_ATTRIBUTES.include?(key)}
    end

    def yaml_data
      @yaml_data ||= YAML.load_file(DATA_FILE)
    rescue Errno::ENOENT
      @yaml_data = {}
    end

    def yaml_data_for(type)
      key = type.to_s
      if yaml_data[key]
        yaml_data[key]
      else
        yaml_data[key] = []
      end
    end

    def yaml_data_for?(type)
      !yaml_data_for(type).nil?
    end


  end
end
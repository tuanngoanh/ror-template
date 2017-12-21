class AppConfig
  include Singleton

  attr_reader :config

  def initialize
    @config = Node.new
    load_config(name: 'smtp')
    load_config(name: 'paginater')
  end

  def self.config
    self.instance.config
  end

  def self.[](value)
    self.config[value]
  end

  def self.method_missing(name, *args)
    self.config.send(name, *args)
  end

  def hash_to_object(h)
    h.empty? ? Object.new : Struct.new(*h.keys).new(*h.values)
  end

  private

  def load_config(options)
    name = options.delete(:name)
    filename = options.delete(:filename) || name
    @config[name.to_sym] = Node.hash_to_node(load_file("#{filename}.yml"))
  end

  def load_file(name)
    YAML.load_file(Rails.root.join('config', name))[Rails.env].with_indifferent_access
  end

  def method_missing(name, *args)
    if name[-1] == '='
      @config[name] = args[0]
    else
      @config[name]
    end
  end

  class Node < HashWithIndifferentAccess
    def self.hash_to_node(h)
      if h.empty?
        Node.new
      else
        h = Node[h]
        h.each do |k, v|
          if v.is_a?(Hash)
            h[k] = self.hash_to_node(v)
          end
        end
      end
    end

    def method_missing(name, *args)
      if name[-1] == '='
        name = name[0..-2]
        value = args[0]

        if value.is_a?(Hash)
          value = self.class.hash_to_node(value)
        end

        self[name] = value
      else
        self[name]
      end
    end
  end
end

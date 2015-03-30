require 'readable_interface/version'

module ReadableInterface
  def readable_interface(name, options = {})
    define_writter(name, options)
    define_reader(name, options)
  end

  private

  def define_writter(name, options)
    singleton_class = class << self; self; end
    singleton_class.send(:define_method, name) do |value|
      instance_variable_set("@_#{name}", value)
    end
  end

  def define_reader(name, options)
    define_method(name) do
      self.class.instance_variable_get("@_#{name}") || fail(NotImplementedError, options[:message])
    end
  end
end

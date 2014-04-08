module Singleton
  class_eval do
    define_method("singletonize") do
      private_class_method :new

      def self.instance(*args)
        @instance ||= new(*args)
      end
    end
  end
end

Object.extend(Singleton)

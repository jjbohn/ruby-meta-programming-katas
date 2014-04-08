module Singleton
  class_eval do
    define_method("singletonize") do
      class << self
        private :new
      end

      def self.instance(*args)
        @instance ||= new(*args)
      end
    end
  end
end

Object.extend(Singleton)

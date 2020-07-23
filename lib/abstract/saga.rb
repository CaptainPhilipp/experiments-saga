module Abstract
  class Saga < LunaPark::Entity
    class << self
      attr_reader :first_step_class

      def call(**attrs)
        new(**attrs).call
      end

      def first_step(first_step_class)
        @first_step_class = first_step_class
      end
    end

    def initialize(**attrs)
      super
      guard_entity_filled
    end

    def call
      self.class.first_step_class.call(self)
    end

    private

    def guard_entity_filled
      # * ...
      raise Errors::EmptyFields.new(empty_fields: empty_fields)
    end

    # * ...
  end
end

module Abstract
  class Saga < LunaPark::Entity
    class << self
      attr_reader :first_step_class

      def call(**attrs)
        dto = new(**attrs)
        first_step_class.call(dto)
      end

      def first_step(first_step_class)
        @first_step_class = first_step_class
      end
    end
  end
end

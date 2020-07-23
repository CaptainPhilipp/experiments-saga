module Abstract
  class Saga < LunaPark::Entity
    def self.call(**attrs)
      new(**attrs).call
    end

    # @abstract
    def call
      raise NotImplementedError
    end

    private

    def guard_entity_filled
      # * ...
      raise Errors::EmptyFields.new(empty_fields: empty_fields)
    end

    # * ...
  end
end

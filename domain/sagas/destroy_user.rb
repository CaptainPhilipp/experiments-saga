module Sagas
  class DestroyUser < Abstract::Saga
    attr :user
    attr :new_email

    def call
      guard_entity_filled

      Step1Auth.call(self)
    end
  end
end

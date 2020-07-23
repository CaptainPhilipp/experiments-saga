module Sagas
  class DestroyUser < Abstract::Saga
    first_step Step1Auth

    attr :user
    attr :new_email
  end
end

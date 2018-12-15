module Types
  class MutationType < Types::BaseObject
    field :test_field, String, null: true

    def test_field
      ''
    end
  end
end

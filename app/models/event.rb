class Event < ApplicationRecord
  belongs_to :creators, class_name: "User"
end

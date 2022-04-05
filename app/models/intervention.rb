class Intervention < ApplicationRecord
    belongs_to :author, class_name: 'Employee', optional: true
    belongs_to :customer, optional: true
    belongs_to :building
    belongs_to :battery
    belongs_to :column
    belongs_to :elevator
    belongs_to :employee, optional: true
end
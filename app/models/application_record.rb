class ApplicationRecord < ActiveRecord::Base
	primary_abstract_class

	def self.required_attributes
		self.validators.select do |validator|
			validator.is_a?(ActiveModel::Validations::PresenceValidator)
		end.flat_map(&:attributes).map(&:to_sym)
	end
end

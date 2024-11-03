class ImportedList < ApplicationRecord
	has_many :imported_items, dependent: :destroy

	validates :file_url, presence: true
	validates :status, presence: true

	validates_presence_of :error_message, if: :failed?

	enum :status, { pending: "pending", processing: "processing", completed: "completed", failed: "failed" }
end

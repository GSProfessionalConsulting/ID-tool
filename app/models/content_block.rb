class ContentBlock < ApplicationRecord
  belongs_to :lesson

  validates :block_type, presence: true, inclusion: { in: %w[text media interactive assessment] }
  validates :position, presence: true, uniqueness: { scope: :lesson_id }, numericality: { greater_than: 0, only_integer: true }
  validates :content, presence: true

  scope :ordered, -> { order(:position) }

  # Parse JSON content for flexible block configuration
  def parsed_content
    return {} if content.blank?
    JSON.parse(content)
  rescue JSON::ParserError
    {}
  end

  def parsed_content=(data)
    self.content = data.to_json
  end

  # Helper methods for different block types
  def text_block?
    block_type == "text"
  end

  def media_block?
    block_type == "media"
  end

  def interactive_block?
    block_type == "interactive"
  end

  def assessment_block?
    block_type == "assessment"
  end
end

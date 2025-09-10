class BlockType < ApplicationRecord
  has_many :content_blocks, foreign_key: 'block_type', primary_key: 'name'
  
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  
  # Parse JSON config schema for block configuration
  def parsed_config_schema
    return {} if config_schema.blank?
    JSON.parse(config_schema)
  rescue JSON::ParserError
    {}
  end
  
  def parsed_config_schema=(data)
    self.config_schema = data.to_json
  end
  
  # Class method to seed default block types
  def self.seed_default_types
    default_types = [
      {
        name: 'text',
        description: 'Rich text content with formatting options',
        config_schema: {
          fields: [
            { name: 'text', type: 'rich_text', required: true },
            { name: 'alignment', type: 'select', options: ['left', 'center', 'right'] }
          ]
        }
      },
      {
        name: 'media',
        description: 'Images, videos, and other media content',
        config_schema: {
          fields: [
            { name: 'media_type', type: 'select', options: ['image', 'video', 'carousel'] },
            { name: 'url', type: 'url', required: true },
            { name: 'alt_text', type: 'text' }
          ]
        }
      },
      {
        name: 'interactive',
        description: 'Interactive elements like flashcards and sorting activities',
        config_schema: {
          fields: [
            { name: 'interaction_type', type: 'select', options: ['flashcard', 'sorting', 'drag_drop'] },
            { name: 'data', type: 'json', required: true }
          ]
        }
      },
      {
        name: 'assessment',
        description: 'Formative assessment items like multiple choice and matching',
        config_schema: {
          fields: [
            { name: 'question_type', type: 'select', options: ['multiple_choice', 'multiple_select', 'matching', 'true_false'] },
            { name: 'question', type: 'text', required: true },
            { name: 'options', type: 'json', required: true },
            { name: 'correct_answer', type: 'json', required: true }
          ]
        }
      }
    ]
    
    default_types.each do |type_data|
      find_or_create_by(name: type_data[:name]) do |block_type|
        block_type.description = type_data[:description]
        block_type.config_schema = type_data[:config_schema].to_json
      end
    end
  end
end

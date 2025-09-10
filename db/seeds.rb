# Seed default block types
BlockType.seed_default_types

# Create a sample course for testing
sample_course = Course.create!(
  title: "Sample Instructional Design Course",
  description: "This is a sample course to demonstrate the ID-tool functionality.",
  status: :draft
)

# Create sample lessons
lesson1 = sample_course.lessons.create!(
  title: "Introduction to Instructional Design",
  lesson_type: :content,
  position: 1
)

lesson2 = sample_course.lessons.create!(
  title: "Learning Objectives Quiz",
  lesson_type: :assessment,
  position: 2
)

# Create sample content blocks
lesson1.content_blocks.create!(
  block_type: 'text',
  position: 1,
  content: {
    text: '<h1>Welcome to Instructional Design</h1><p>This is a <strong>sample course</strong> created with the ID-tool.</p>',
    alignment: 'left'
  }.to_json
)

lesson1.content_blocks.create!(
  block_type: 'media',
  position: 2,
  content: {
    media_type: 'image',
    url: 'https://via.placeholder.com/600x300',
    alt_text: 'Sample instructional design image'
  }.to_json
)

lesson2.content_blocks.create!(
  block_type: 'assessment',
  position: 1,
  content: {
    question_type: 'multiple_choice',
    question: 'What is the primary goal of instructional design?',
    options: [
      'To create engaging content',
      'To facilitate learning',
      'To use technology effectively',
      'To reduce training costs'
    ],
    correct_answer: 1
  }.to_json
)

puts "Seeded database with sample data!"

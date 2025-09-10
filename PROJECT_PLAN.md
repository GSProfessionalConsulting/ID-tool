# ID-Tool: Instructional Design Course Management System

## Project Overview
A Ruby on Rails 8.0.2 web application for creating and managing instructional design courses with rich content blocks, assessments, and interactive elements.

## Current Status ✅
- [x] Rails application scaffolded
- [x] Database models created (Course, Lesson, ContentBlock, BlockType)
- [x] Database migrations completed
- [x] Comprehensive seed data created
- [x] RuboCop style violations fixed
- [x] Tests passing (7 tests, 7 assertions, 0 failures)
- [x] Git repository set up and synced with GitHub
- [x] CI/CD pipeline configured
- [x] **Security-focused URL structure implemented** (Sep 10, 2025):
  - `/designer/courses` - For instructional designers (full CRUD access)
  - `/learn/course/:id` - For learners (view-only, single URL navigation)  
  - `/course/:id` - For public sharing (no auth required)
- [x] **All controllers built** (Designer::CoursesController, LearnController, PublicController, HomeController)
- [x] **Basic view templates** for core functionality
- [x] **Rails master key secured** (properly added to .gitignore)

## 🛌 NEXT SESSION PRIORITIES
**Ready to tackle when you return:**

1. **🧪 Test the application** - Start Rails server (`rails server`) and validate all URL routes work
2. **🔐 Add user authentication** - Implement Devise gem for login/signup functionality  
3. **📝 Build detailed forms** - Course creation, lesson editing, content block management interfaces
4. **🎨 Enhance styling** - Professional UI with Tailwind CSS components and improved UX
5. **👤 Add user permissions** - Ensure designers only see their own courses (current_user scoping)
6. **📊 Implement course publishing** - Draft → Review → Published workflow with proper state management

**Current state: All infrastructure complete, ready for user-facing features! 🚀**

## 🔧 FUTURE IMPROVEMENTS
**Technical debt to address later:**

- **🔄 Single source of truth for Ruby version** - Currently using both `mise.toml` and `.ruby-version`. Should implement proper mise integration in CI to eliminate duplication and ensure version consistency between local development and CI environments.

## Architecture

### Models
- **Course**: Main course entity with status management (draft/published/archived)
- **Lesson**: Individual lessons within courses with positioning
- **ContentBlock**: Rich content blocks for lessons (text, media, interactive, assessment)
- **BlockType**: Configuration schemas for different content types

### Database Schema
```sql
courses: id, title, description, status, created_at, updated_at
lessons: id, course_id, title, lesson_type, position, created_at, updated_at
content_blocks: id, lesson_id, block_type, position, content (JSON), created_at, updated_at
block_types: id, name, description, config_schema, created_at, updated_at
```

## Development Roadmap

### Phase 1: Core Functionality (Current Focus)
- [ ] **1.1 Routes & Controller Setup**
  - [ ] Update routes.rb for RESTful routing
  - [ ] Implement CoursesController actions (index, show, new, create, edit, update, destroy)
  - [ ] Add proper error handling and flash messages

- [ ] **1.2 Basic Views**
  - [ ] Create course index view (list all courses)
  - [ ] Create course show view (display course details and lessons)
  - [ ] Create course form views (new/edit)
  - [ ] Add basic styling and layout

- [ ] **1.3 Lesson Management**
  - [ ] Implement LessonsController
  - [ ] Create lesson views (index, show, new, edit)
  - [ ] Add lesson reordering functionality

### Phase 2: Content Management
- [ ] **2.1 Content Block System**
  - [ ] Implement ContentBlocksController
  - [ ] Create content block editor interface
  - [ ] Support for text blocks (rich text with formatting)
  - [ ] Support for media blocks (images, videos)

- [ ] **2.2 Interactive Elements**
  - [ ] Flashcard functionality
  - [ ] Sorting activities
  - [ ] Drag-and-drop interactions

- [ ] **2.3 Assessment System**
  - [ ] Multiple choice questions
  - [ ] Multiple select questions
  - [ ] True/false questions
  - [ ] Matching exercises

### Phase 3: User Experience
- [ ] **3.1 Course Navigation**
  - [ ] Lesson progression tracking
  - [ ] Previous/Next lesson navigation
  - [ ] Course completion tracking

- [ ] **3.2 Content Editor**
  - [ ] WYSIWYG editor for text blocks
  - [ ] Media upload and management
  - [ ] Content block reordering
  - [ ] Preview functionality

### Phase 4: Export & Publishing
- [ ] **4.1 Course Preview System**
  - [ ] Real-time preview functionality
  - [ ] Preview mode with navigation
  - [ ] Mobile-responsive preview
  - [ ] Assessment preview with scoring

- [ ] **4.2 Export Functionality**
  - [ ] HTML export (standalone course files)
  - [ ] SCORM 1.2 and 2.0 export
  - [ ] ZIP package generation
  - [ ] Custom branding options for exports

- [ ] **4.3 Course Publishing**
  - [ ] Course status workflow (draft → review → published)
  - [ ] Course versioning
  - [ ] Publishing to WordPress integration
  - [ ] Direct hosting deployment options

### Phase 5: Subscription & Account Management
- [ ] **5.1 User Authentication & Accounts**
  - [ ] User registration and login system
  - [ ] Email verification and password reset
  - [ ] User profile management
  - [ ] Account settings and preferences

- [ ] **5.2 Subscription Management**
  - [ ] Subscription tiers (Free, Basic, Pro, Enterprise)
  - [ ] Payment processing integration (Stripe/PayPal)
  - [ ] Billing cycle management (monthly/yearly)
  - [ ] Subscription status tracking
  - [ ] Usage limits and feature restrictions

- [ ] **5.3 Access Control & Permissions**
  - [ ] Feature flags based on subscription tier
  - [ ] Course creation limits per tier
  - [ ] Export functionality restrictions
  - [ ] Storage quota management
  - [ ] API rate limiting

### Phase 6: Advanced Features
- [ ] **6.1 Analytics & Reporting**
  - [ ] Course completion rates
  - [ ] Assessment scores
  - [ ] Learning progress tracking
  - [ ] SCORM tracking integration
  - [ ] Subscription analytics and churn metrics

- [ ] **6.2 WordPress Integration**
  - [ ] WordPress plugin development
  - [ ] Hostinger hosting compatibility
  - [ ] Seamless course embedding
  - [ ] User management integration
  - [ ] Subscription management in WordPress

## Design Inspiration & Competitive Analysis

### Rise 360 Similarities (Non-Infringing)
- **Block-based content creation** - Similar to Rise's lesson blocks
- **Responsive design** - Mobile-first approach like Rise
- **Assessment integration** - Built-in quiz and assessment tools
- **Course preview** - Real-time preview functionality
- **Export capabilities** - Multiple format support (HTML, SCORM)
- **Template system** - Pre-built content block templates

### Key Differentiators
- **Open source** - Full control and customization
- **WordPress integration** - Native hosting on existing WordPress sites
- **Cost-effective** - No subscription fees
- **Custom branding** - Complete control over look and feel
- **Local hosting** - Can be self-hosted or integrated with existing infrastructure

## Hosting & Deployment Strategy

### WordPress Integration
- **Target Platform**: WordPress.org on Hostinger
- **Integration Method**: Custom WordPress plugin
- **Benefits**: 
  - Leverage existing WordPress infrastructure
  - Familiar admin interface for users
  - Built-in user management
  - SEO-friendly course pages

### Export & Distribution Options
1. **HTML Export**: Standalone course files for any web server
2. **SCORM Export**: Compatible with major LMS platforms
3. **WordPress Embed**: Direct integration with WordPress sites
4. **Cloud Hosting**: Optional cloud deployment for standalone use

## Subscription Tiers & Pricing Strategy

### Free Tier
- **Courses**: 1 course maximum
- **Lessons**: 5 lessons per course
- **Content Blocks**: Basic text and image blocks only
- **Export**: HTML export only
- **Storage**: 100MB
- **Support**: Community support only

### Basic Tier ($9.99/month)
- **Courses**: 5 courses maximum
- **Lessons**: Unlimited lessons per course
- **Content Blocks**: All block types (text, media, interactive, assessment)
- **Export**: HTML and SCORM 1.2 export
- **Storage**: 1GB
- **Support**: Email support
- **Features**: Course preview, basic analytics

### Pro Tier ($29.99/month)
- **Courses**: 25 courses maximum
- **Lessons**: Unlimited lessons per course
- **Content Blocks**: All block types + custom templates
- **Export**: HTML, SCORM 1.2, and SCORM 2.0 export
- **Storage**: 10GB
- **Support**: Priority email support
- **Features**: Advanced analytics, custom branding, API access

### Enterprise Tier ($99.99/month)
- **Courses**: Unlimited courses
- **Lessons**: Unlimited lessons per course
- **Content Blocks**: All block types + custom development
- **Export**: All export formats + custom integrations
- **Storage**: 100GB
- **Support**: Phone and email support
- **Features**: White-label options, custom integrations, dedicated support

## Technical Specifications

### Technology Stack
- **Backend**: Ruby on Rails 8.0.2
- **Database**: PostgreSQL
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Styling**: Bootstrap 5 (planned)
- **JavaScript**: Stimulus (Rails 8 default)
- **Export Engine**: Custom SCORM generator, HTML renderer
- **Payment Processing**: Stripe (primary), PayPal (secondary)
- **Authentication**: Devise (Rails gem)
- **Subscription Management**: Custom implementation with Stripe webhooks
- **Testing**: Rails built-in testing framework
- **Code Quality**: RuboCop, Brakeman

### Development Environment
- **OS**: Windows Subsystem for Linux (WSL2) with Ubuntu
- **Ruby Version**: Managed via mise
- **Database**: PostgreSQL
- **Version Control**: Git with GitHub
- **CI/CD**: GitHub Actions

## Current Seed Data
The application includes comprehensive seed data:
- 1 sample course: "Sample Instructional Design Course"
- 2 lessons: "Introduction to Instructional Design" and "Learning Objectives Quiz"
- Multiple content blocks: text, media, and assessment blocks
- Rich JSON-structured content for flexible content types

## Next Immediate Steps
1. **Update routes.rb** - Implement RESTful routing
2. **Implement CoursesController#index** - Display seeded courses
3. **Create course index view** - Basic HTML template
4. **Test in browser** - Verify seeded data displays correctly
5. **Implement remaining CRUD actions** - Complete course management

## Success Metrics

### Phase 1-3 (Core Functionality)
- [ ] All seeded courses display correctly in browser
- [ ] Course CRUD operations work end-to-end
- [ ] Content blocks render properly
- [ ] Assessment questions function correctly
- [ ] Responsive design works on mobile/desktop
- [ ] All tests pass consistently
- [ ] Code quality standards maintained (RuboCop clean)

### Phase 4 (Export & Publishing)
- [ ] Real-time course preview functions correctly
- [ ] HTML export generates standalone course files
- [ ] SCORM 1.2 and 2.0 exports work with major LMS platforms
- [ ] Export files include proper navigation and tracking
- [ ] Custom branding options work in exports
- [ ] WordPress integration plugin functions correctly

### Phase 5 (Subscription & Account Management)
- [ ] User registration and authentication works securely
- [ ] Subscription tiers are properly enforced
- [ ] Payment processing (Stripe/PayPal) functions correctly
- [ ] Billing cycles and renewals work automatically
- [ ] Feature restrictions based on subscription tier work
- [ ] Usage limits and quotas are properly tracked

### Phase 6 (Advanced Features)
- [ ] WordPress hosting integration is seamless
- [ ] SCORM tracking data is properly captured
- [ ] Course analytics provide meaningful insights
- [ ] Subscription analytics and churn metrics are accurate
- [ ] Performance meets professional standards (< 3s load times)

## Notes
- Focus on MVP functionality first
- Prioritize user experience and intuitive navigation
- Maintain clean, readable code with proper documentation
- Regular commits with descriptive messages
- Test-driven development approach

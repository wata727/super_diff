rails_dependencies = proc do
  gem "activerecord-jdbcsqlite3-adapter", platform: :jruby
  gem "jdbc-sqlite3", platform: :jruby
end

appraisals = {
  rails_5_0: proc {
    instance_eval(&rails_dependencies)

    gem "activerecord", "~> 5.0.0"
    gem "railties", "~> 5.0.0"
    gem "sqlite3", "~> 1.3.6", platform: [:ruby, :mswin, :mingw]
  },
  rails_5_1: proc {
    instance_eval(&rails_dependencies)

    gem "activerecord", "~> 5.1.0"
    gem "railties", "~> 5.1.0"
    gem "sqlite3", "~> 1.3.6", platform: [:ruby, :mswin, :mingw]
  },
  rails_5_2: proc {
    instance_eval(&rails_dependencies)

    gem "activerecord", "~> 5.2.0"
    gem "railties", "~> 5.2.0"
    gem "sqlite3", "~> 1.3.6", platform: [:ruby, :mswin, :mingw]
  },
  rails_6_0: proc {
    instance_eval(&rails_dependencies)

    gem "activerecord", "~> 6.0"
    gem "railties", "~> 6.0"
    gem "sqlite3", "~> 1.4.0", platform: [:ruby, :mswin, :mingw]
  },
  no_rails: proc {},
  rspec_lt_3_10: proc { |with_rails|
    version = "< 3.10"

    gem "rspec", version

    if with_rails
      # gem "rspec-core", version
      # gem "rspec-expectations", version
      # gem "rspec-mocks", version
      # gem "rspec-support", version
      gem "rspec-rails"
    # else
      # gem "rspec", version
    end
  },
  rspec_gte_3_10: proc { |with_rails|
    version = [">= 3.10", "< 4"]

    gem "rspec", *version

    if with_rails
      # gem "rspec-core", *version
      # gem "rspec-expectations", *version
      # gem "rspec-mocks", *version
      # gem "rspec-support", *version
      gem "rspec-rails"
    # else
      # gem "rspec", *version
    end
  },
}

rails_appraisals = [
  :rails_5_0,
  :rails_5_1,
  :rails_5_2,
  :no_rails,
]
if Gem::Requirement.new(">= 2.5.0").satisfied_by?(Gem::Version.new(RUBY_VERSION))
  rails_appraisals << :rails_6_0
end

rspec_appraisals = [
  :rspec_lt_3_10,
  :rspec_gte_3_10,
]

rails_appraisals.each do |rails_appraisal|
  rspec_appraisals.each do |rspec_appraisal|
    if rails_appraisal == :no_rails
      appraise "#{rails_appraisal}_#{rspec_appraisal}" do
        instance_eval(&appraisals.fetch(rails_appraisal))
        instance_exec(false, &appraisals.fetch(rspec_appraisal))
      end
    else
      appraise "#{rails_appraisal}_#{rspec_appraisal}" do
        instance_eval(&appraisals.fetch(rails_appraisal))
        instance_exec(true, &appraisals.fetch(rspec_appraisal))
      end
    end
  end
end

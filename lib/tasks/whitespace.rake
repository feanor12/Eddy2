namespace :whitespace do
  desc 'Remove trailing whitespace'
  task :cleanup do
    sh %{find . -name '*.rb' -exec sed -i 's/ *$//g' {} \\;}
  end
end

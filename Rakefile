namespace :docker do
  desc "Build docker image"
  task :build do
    sh 'docker', 'build', '-t', 'rubydata/taiwan201804:latest', './docker'
  end

  desc "Push docker image"
  task :push do
    sh 'docker', 'push', 'rubydata/taiwan201804:latest'
  end

  desc "Pull docker image"
  task :pull do
    sh 'docker', 'pull', 'rubydata/taiwan201804'
  end

  namespace :run do
    desc "Run jupyter notebook on docker"
    task :notebook do
      port = ENV['port'] || 8888
      sh 'docker', 'run', '--rm', '-it', '-p', "#{port}:#{port}", 'rubydata/taiwan201804',
          '/usr/local/bin/start-taiwan2018.sh', "--port=#{port}"
    end

    desc "Run jupyter notebook on docker"
    task :bash do
      port = ENV['port'] || 8888
      sh 'docker', 'run', '--rm', '-it', '-p', "#{port}:#{port}", 'rubydata/taiwan201804', '/bin/bash'
    end
  end
end

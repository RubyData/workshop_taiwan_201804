namespace :docker do
  desc "Build docker image"
  task :build do
    Dir.chdir File.expand_path('../docker', __FILE__) do
      no_cache = ['--no-cache'] if ENV['no_cache']
      sh 'docker', 'build', *no_cache, '-t', 'rubydata/taiwan201804:latest', '.'
    end
  end

  desc "Push docker image"
  task :push do
    Dir.chdir File.expand_path('../docker', __FILE__) do
      sh 'docker', 'push', 'rubydata/taiwan201804:latest'
    end
  end

  desc "Pull docker image"
  task :pull do
    sh 'docker', 'pull', 'rubydata/taiwan201804'
  end

  namespace :run do
    def normalize_volume(volume)
      local, remote = volume.split(':', 2)
      "#{File.expand_path(local)}:#{remote}"
    end

    desc "Run jupyter notebook on docker"
    task :notebook do
      port = ENV['port'] || 8888
      volume = ['-v', normalize_volume(ENV['volume'])] if ENV['volume']
      sh 'docker', 'run', '--rm', '-it', '-p', "#{port}:#{port}", *volume,
           'rubydata/taiwan201804',
           '/usr/local/bin/start-taiwan2018.sh', "--port=#{port}"
    end

    desc "Run jupyter notebook on docker"
    task :bash do
      port = ENV['port'] || '8888'
      port = port.empty? ? [] : ['-p', "#{port}:#{port}"]
      volume = ['-v', normalize_volume(ENV['volume'])] if ENV['volume']
      sh 'docker', 'run', '--rm', '-it', *port, *volume,
           'rubydata/taiwan201804', '/bin/bash'
    end
  end
end

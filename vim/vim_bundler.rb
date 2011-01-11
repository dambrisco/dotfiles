#!/usr/bin/env ruby

require 'fileutils'
require 'open-uri'

class VimBundler
  attr_accessor :github_bundles

  def initialize
    @github_bundles = []
    @bundles_dir    = File.join(File.dirname(__FILE__), "bundle")
    puts "Bundles dir: #{@bundles_dir}"
  end

  def update_all
    FileUtils.cd(@bundles_dir)
    @github_bundles.each do |path|
      dir = path.split('/').last
      puts "\nUpdating #{path}"
      FileUtils.rm_rf(dir)
      `git clone git://github.com/#{path}.git #{dir}`
      FileUtils.rm_rf(File.join(dir, ".git"))
    end
  end

  def get_new
    FileUtils.cd(@bundles_dir)
    @github_bundles.each do |path|
      dir = path.split('/').last
      unless File.exists?(dir)
        puts "\nGetting #{path}"
        `git clone git://github.com/#{path}.git #{dir}`
        FileUtils.rm_rf(File.join(dir, ".git"))
      end
    end
  end
end

class CLI
  def initialize(bundler)
    @bundler = bundler
  end

  def parse_command
    ARGV[0]
  end

  def run!
    cmd = parse_command || "help"
    puts "Running command #{cmd}"
    send(cmd)
  end

  def update_all
    @bundler.update_all
  end

  def get_new
    @bundler.get_new
  end

  def help
    puts <<-EOS
      Usage:
        vim_bundle [command]

      Commands available:

        help:        shows this messages.

        get_new:     downloads only new bundles added to Bundles file.

        update_all:  removes all bundles and redownloads them.

    EOS
  end
end

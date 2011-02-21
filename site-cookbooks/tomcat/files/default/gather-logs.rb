#!/usr/bin/env ruby

require 'fileutils'
require 'socket'

module GatherLogs

  class Log
    
    def initialize(lsof_bin)
      @lsof_bin = lsof_bin
      error 'lsof binary not found' unless File.exists?(lsof_bin)
    end
    
    def error(message)
      puts "Error: #{message}"
      exit 1
    end
    
    # If the string given in 'filter' is matched, store the logfile.
    # otherwise, bin it.
    #
    def move_else_purge(log_dir,dest_dir,filter)
      Dir.entries(log_dir).each do |entry|
        next if (entry == '.' || entry == '..')
        if entry[/#{filter}/]
          newfile = stamped_log(entry)
          move_log_file("#{log_dir}/#{entry}",dest_dir,newfile)
        else
          purge_log_file("#{log_dir}/#{entry}")
        end
      end
    end
    
    def hostname
      Socket::gethostname[/\A[^.]+/]
    end
    
    # Adds a hostname-date stamp to the specified logfile
    #
    def stamped_log(file)
      datestamp = Time.now.strftime('%Y%m%d_%H%M%S')
      [hostname,datestamp,file].join('-')
    end
    
    # Tests whether or not a file is still being written to
    #
    def file_open?(file)
      system("#{@lsof_bin} #{file} 1> /dev/null 2>&1")
    end
    
    def set_dest_dir(base)
      host_name = Socket::gethostname[/\A[^.]+/]
      "#{base}/#{host_name}"
    end
    
    def move_log_file(file,dest,newfile)
      if file_open?(file)
        puts "#{file} open, so skipping."
      else
        puts "Moving #{file} to #{dest}/#{newfile}"
        FileUtils.mkdir_p(dest) unless File.directory?(dest)
        FileUtils.mv(file,"#{dest}/#{newfile}")
      end
    end
    
    def purge_log_file(file)
      if file_open?(file)
        puts "#{file} open, so skipping."
      else
        puts "Purging #{file}"
        FileUtils.rm(file)
      end
    end
    
    def get_log_dirs(dir)
      Dir.entries(dir).map{|e| e unless (e == '.' || e == '..' || File.file?(e))}.compact
    end
    
    def match_current(dir)
      Dir.entries(dir).map{|e| e if e[/\.log\Z/]}.compact
    end
    
    def match_rotated(dir)
      Dir.entries(dir).map{|e| e if e[/\.log[^\Z]/]}.compact
    end
  
  end

end

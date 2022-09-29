require 'etc'


puts "getuid: #{Process::Sys.getuid}"
puts "getgid: #{Process::Sys.getgid}"
puts "cat mysecret.txt"
puts `cat mysecret.txt`

build_user_id = Etc.getpwnam("build").uid
build_group_id = Etc.getpwnam("build").gid
puts "build's uid: #{build_user_id}"
puts "build's gid: #{build_group_id}"
puts "changing to new build user"
Process::Sys.setgid(build_group_id)
Process::Sys.setuid(build_user_id)
puts "new getuid: #{Process::Sys.getuid}"
puts "new getgid: #{Process::Sys.getgid}"
puts "cat mysecret.txt"

puts `cat mysecret.txt`

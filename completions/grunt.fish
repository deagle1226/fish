# # fish completion for grunt

# function __fish_grunt_tasks
#   grunt --version --verbose 2>/dev/null | awk '/Available tasks: / {$1=$2=""; print $0}'
#   return 0
# end

# ### tasks
# complete -f -c grunt -a '(__fish_grunt_tasks)' --description 'Tasks'
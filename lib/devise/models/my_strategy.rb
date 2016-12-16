# require "devise/hooks/lockable"
#
# module Devise
#   module Models
#     module MyStrategy
#       extend Lockable
#       def lock_access!(opts = { })
#         self.locked_at = Time.now.utc
#
#         if unlock_strategy_enabled?(:email) && opts.fetch(:send_instructions, true)
#           send_unlock_instructions
#         else
#           save(validate: false)
#         end
#       end
#     end
#   end
# end

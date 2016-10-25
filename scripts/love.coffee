# Description:
#   Love is the script which captures lines like "I love donuts"
#   and places the content in the channel of your choosing, eg. #love
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None

module.exports = (robot) ->

  robot.hear /^\s*(love|<3|:heart\w*:)\s+((@[\w\-]+\s*)+)(.*)$/i, (msg) ->
    lover = msg.message.user.name
    lovees = msg.match[2].trim()
    action = msg.match[4]
    room = "love"
    robot.messageRoom room, lover + " loves " + lovees + ": " + action
    msg.send "Yay, more love for #love! Thanks, #{lover}!"

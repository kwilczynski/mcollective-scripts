#
# location.mc
#

inventory do
  format "%s %s %s"

  fields do
    [
      identity,
      facts['country']
      facts['location'],
    ]
  end
end

# vim: set ts=2 sw=2 et :
# encoding: utf-8

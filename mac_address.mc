#
# mac_address.mc
#
# Display host identifier, IP address and MAC address using
# colon and dot (Cisco alike) notation ...
#
# For example:
#
#   $ mc-inventory --script mac_address.mc
#   example.host 123.123.123.123 46:38:FC:C0:FA:87 4638.fcc0.fa87
#   [ ... ]
#
# You can apply any filters you wish with mc-inventory ...
#

def cisco_mac_format(address)
  address.tr(':', '').tr('A-Z', 'a-z').unpack('a4a4a4').join('.')
end

inventory do
  format "%s %s %s %s"

  fields do
    [
      identity,
      facts['ipaddress'],
      facts['macaddress'],
      cisco_mac_format(facts['macaddress'])
    ]
  end
end

# vim: set ts=2 sw=2 et :

#
# mac_address.mc
#
# Display host identifier, IP address and MAC address using
# colon and dot (Cisco alike) notation ...
#

def cisco_mac_format(address)
  return address.tr(':', '').tr('A-Z', 'a-z').unpack('a4a4a4').join('.')
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

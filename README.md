# ansible_csv


Create configs from CSV files


BGP neighbors template
```
interface Loopback0
 ip address {{ loop_ip }} 255.255.255.255
 no shut

interface {{ int_name }}
 no switchport
 ip address {{ int_ip }} {{ int_mask }}
!
router bgp {{ local_as }}
  bgp router-id {{ loop_ip }}
  neighbor {{ bgp_neighbor_ip }} remote-as {{ neighbor_as }}
  neighbor {{ bgp_neighbor_ip }} update-source Loopback0
  neighbor {{ bgp_neighbor_ip }} ebgp-multihop 3
  neighbor {{ bgp_neighbor_ip }} activate
  no neighbor {{ bgp_neighbor_ip }} shut
  redistribute connected
!

ip route {{ bgp_neighbor_ip }} 255.255.255.255 {{ neigh_int_ip }}
```

ASA Firewall rules template
```
object-group network {{ source_group }}
network-object object {{ src_1 }}
network-object object {{ src_2 }}
object-group network {{ destination_group }}
network-object host {{ dst_1 }}
network-object host {{ dst_2 }}

access-list Outside-IN remark {{ change_number }}
access-list Outside-IN  extended permit ip object-group {{ source_group }} object-group {{ destination_group }} log 6 interval 300
```

|asa_rule|source_group|src_1|src_2|destination_group|dst_1|dst_2|change_number|
|:-----------|:------:|------------:|------------|
|to the left|in the middle|to the right|wherever|



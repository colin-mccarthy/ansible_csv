# ansible_csv


Create configs from CSV files

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

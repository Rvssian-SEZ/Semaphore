---
- name: win_ping module demo
  host: windows
  become: false
  gather_facts: false
  task:
    - name: test connection
      ansible.windows.win_ping:

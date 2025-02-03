---
- name: Test Playbook
  hosts: 10.10.3.69

  tasks:
  - name: Run shell
    win_shell: |
      $ret = Test-Path -Path C:\tmp
      if ($ret) {
        Remove-Item -Path C:\tmp -Force
      }

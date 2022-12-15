# ansible-pull
Public ansible playbooks (for use with cloud-init &amp; ansible-pull)

## Example use-cases

#### cloud-init

```yaml
#cloud-config
timezone: Europe/Oslo
locale: nb_NO

keyboard:
  layout: 'no'
  model: pc105

packages:
- git
- python3-pip

users:
- default
- name: ansible
  gecos: Ansible Provisioning User
  groups: users,admin,wheel
  sudo: ALL=(ALL) NOPASSWD:ALL
  shell: /bin/bash
  ssh_import_id: 
  - gh:kds-rune
  lock_passwd: true

ansible:
  install_method: pip
  package_name: ansible-core
  run_user: ansible
  galaxy:
    actions:
    - ["ansible-galaxy", "collection", "install", "community.general"]
  pull:
    url: "https://github.com/kred-no/ansible-pull.git"
    playbook_name: ubuntu.yaml
```

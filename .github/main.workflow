workflow "Ansible Lint" {
 on = "pull_request"
 resolves = ["Lint Ansible Playbook"]
}

action "Lint Ansible Playbook" {
  uses = "ansible/ansible-lint-action@v4.1.0"
}

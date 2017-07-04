ansible-jitsi-meet-server
=========

Installs and configures the [Jitsi Meet] videoconferencing software.

Includes [LetsEncrypt] for TLS certificates, OS and SSH hardening (courtesy of the [dev-sec hardening framework], and Tor. 
Also handles setting up a firewall plus unattended software upgrades.

Tested on Ansible 2.3.1 and Debian GNU/Linux (currently stretch or 9.x).

Requirements
------------

You should have a DNS record pointed at the server already.

Variables
--------------

```yaml
# E-mail address used for Let's Encrypt notifications.
certbot_admin_email: ''

# Hostname where you want to set up Jitsi Meet.
jitsi_meet_server_name: ''
```

Dependencies
------------

* [ansible-os-hardening](https://github.com/dev-sec/ansible-os-hardening)
* [ansible-ssh-hardening](https://github.com/dev-sec/ansible-ssh-hardening)

To update the third-party roles, run:

    ansible-galaxy install --ignore-errors --force -r requirements.yml

Example Playbook
----------------

See `jitsi-meet-server.yml`.

To get started, just create an [inventory file](https://docs.ansible.com/ansible/intro_inventory.html) at `inventory/hosts`, and set `certbot_admin_email` and `jitsi_meet_server_name` in your playbook.

Acknowledgments
---------------

The Jitsi Meet role was forked from [ansible-role-jitsi-meet](https://github.com/freedomofpress/ansible-role-jitsi-meet) by [Freedom of the Press Foundation].

License
-------

MIT

Author Information
------------------

[Calyx Institute]

[Jitsi Meet]: https://github.com/jitsi/jitsi-meet
[dev-sec hardening framework]: http://dev-sec.io/
[LetsEncrypt]: https://letsencrypt.org/
[Freedom of the Press Foundation]: https://freedom.press/
[Calyx Institute]: https://calyxinstitute.org/

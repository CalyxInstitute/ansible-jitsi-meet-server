jitsi-meet
=========

Installs and configures the Jitsi Meet videoconferencing software.


Requirements
------------

You should have DNS pointed at the server already, and SSL keys. If you don't have SSL
keys for the domain yet, consider using the excellent [finn93.letsencrypt] Ansible role
to obtain (free!) SSL certs from [LetsEncrypt].

Role Variables
--------------

```yaml
# The default cert files are /var/lib/prosody/localhost.{crt,key}
# NOT setting them here, because empty strings for custom certs will
# cause the custom Nginx config tasks to be skipped.
jitsi_meet_ssl_cert_path: ''
jitsi_meet_ssl_key_path: ''

# Without SSL, "localhost" is the correct default. If SSL info is provided,
# then we'll need a real domain name. Using Ansible's inferred FQDN, but you
# can set the variable value explicitly if you use a shorter hostname
jitsi_meet_server_name: "{{ ansible_fqdn if jitsi_meet_ssl_cert_path else 'localhost' }}"

# Only "anonymous" auth is supported, which lets anyone use the videoconference server.
jitsi_meet_authentication: anonymous

# The Debian package installation of jitsi-meet will generate secrets for the components.
# The role will read the config file and preserve the secrets even while templating.
# If you wish to generate your own secrets and use those, override these vars, but make
# sure to store the secrets securely, e.g. with ansible-vault or credstash.
jitsi_meet_videobridge_secret: ''
jitsi_meet_jicofo_secret: ''
jitsi_meet_jicofo_password: ''

# Default auth information, used in multiple service templates.
jitsi_meet_jicofo_user: focus
jitsi_meet_jicofo_port: 5347

# The default config file at /etc/jitsi/videobridge/config claims the default port
# for JVB is "5275", but the manual install guide references "5347".
# https://github.com/jitsi/jitsi-meet/blob/master/doc/manual-install.md
jitsi_meet_videobridge_port: 5347

# A recent privacy-friendly addition, see here for details:
# https://github.com/jitsi/jitsi-meet/issues/422
# https://github.com/jitsi/jitsi-meet/pull/427
jitsi_meet_disable_third_party_requests: true

# These debconf settings represent answers to interactive prompts during installation
# of the jitsi-meet deb package. If you use custom SSL certs, you may have to set more options.
jitsi_meet_debconf_settings:
  - name: jitsi-meet
    question: jitsi-meet/jvb-hostname
    value: "{{ jitsi_meet_server_name }}"
    vtype: string
  - name: jitsi-meet
    question: jitsi-meet/jvb-serve
    value: "false"
    vtype: boolean
  - name: jitsi-meet-prosody
    question: jitsi-meet-prosody/jvb-hostname
    value: "{{ jitsi_meet_server_name }}"
    vtype: string

# Role will automatically install configure ufw with jitsi-meet port holes.
# If you're managing a firewall elsewise, set this to false, and ufw will be skipped.
jitsi_meet_configure_firewall: true
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).


[Jitsi Meet](https://github.com/jitsi/jitsi-meet)
[thefinn93.letsencrypt](https://github.com/thefinn93/ansible-letsencrypt)
[LetsEncrypt](https://letsencrypt.org/)

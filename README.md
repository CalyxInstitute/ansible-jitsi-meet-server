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

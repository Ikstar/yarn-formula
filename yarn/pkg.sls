{%- from "yarn/map.jinja" import yarn with context %}

{%- if grains['os_family'] in ['Ubuntu', 'Debian'] and salt['pillar.get']('yarn:install_from_ppa') %}
yarn.ppa:
  pkg.installed:
    - name: apt-transport-https
    - require_in:
      - pkgrepo: yarn.ppa
  pkgrepo.managed:
    - humanname: Yarn Repository
    - name: deb {{ salt['pillar.get']('yarn:ppa:repository_url', 'deb https://dl.yarnpkg.com/debian/') }} stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/yarn.list
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
    - require_in:
      pkg: yarn
{%- endif %}
yarn:
  pkg.installed:
    - name: {{ yarn.yarn_pkg }}
    - reload_modules: true
{%- if salt['pillar.get']('yarn:version') %}
    - version: {{ salt['pillar.get']('yarn:version') }}
{%- endif %}

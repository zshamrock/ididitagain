## Debian automation with Ansible

Automate Debian OS on laptop:

- install and setup system packages
- configure dot files
- install and setup everything ready for development: java, clojure, go, docker, git, maven and others
- install essential productivity tools
- install various "media" tools, like dropbox, spotify, slack and others
- and many more ...

### Available tags

```
$ ansible-playbook -i hosts --list-tags site.yml 

playbook: site.yml

  play #1 (localhost):  TAGS: []
      TASK TAGS: [alternatives, apt, atom, chrome, clojure, dev, docker, dot-files, dropbox, git, gnome, go, hipchat, idea, jdk, maven, media, packages, permissions, productivity, sdkman, skype, slack, spotify, system, tools, viber, vim]

```

Tags are nicely grouped by high level roles, which are (and in turn include lower granularity tags):

- dev
  [git, jdk, go, atom, idea, docker, clojure, maven, sdkman, tools]
- gnome
- media
  [dropbox, skype, slack, spotify, viber, hipchat]
- packages
  [chrome]
- productivity
- system
  [apt, permissions, dot-files, vim, alternatives]

So, either:

- run `./run-all.sh` to setup everything at once, 
- or `./run-all.sh --tags [one of high level group]`, like `dev`, if only partial "role" is necessary, 
- or `./run-all.sh --tags [lower granularity tags]`, like `vim` if only specific tags are required (can specify multiple separated by commas, like `vim,jdk`, for example)

### License
The MIT License (MIT)

Copyright (c) 2015 Aliaksandr Kazlou

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

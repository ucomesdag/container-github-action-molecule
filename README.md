# container-github-action-molecule

A container that is used for [GitHub actions molecule](https://github.com/ucomesdag/molecule-action).

[![github-action-molecule build status][quai.io]](https://quay.io/repository/ucomesdag/github-action-molecule?tab=tags)

This container contains:
- [podman](https://podman.io/) - Used by molecule to start instances using the `podman` driver.
- [git](https://git-scm.com/) - Used to pull data from a repository.
- [molecule](https://molecule.readthedocs.io/en/latest/) - Used to orchestrate the tests.
- [tox](https://tox.readthedocs.io/en/latest/) - Used to test multiple version of ansible if `tox.ini` exists.
- [pyenv](https://github.com/pyenv/pyenv) - Used to manage python versions.
- [python](https://www.python.org) ([upstream supported versions](https://devguide.python.org/versions/)) - Used by Ansible to run and can be used with tox to test multiple versions.
- [testinfra](https://testinfra.readthedocs.io/en/latest/) - Used to test your infrastructure.
- [ansible-later](https://ansible-later.geekdocs.de) - A best practice scanner and linting tool.
- [ansible-lint](https://ansible-lint.readthedocs.io/en/latest/) -  A command-line tool for linting playbooks, roles and collections aimed towards any Ansible users.
- [yamllint](https://yamllint.readthedocs.io/en/latest/) - A command-line tool for linting YAML files.

The default behaviour is to:
- See if `tox.ini` exists -> Run `tox`
- Otherwise -> Run `molecule test`
- Retry either (`tox` or `molecule`) 3 times.
- Run `test` if `command` is not set.
- Test the `default` scenario if `scenario` in not set.

Read how to [test locally](TESTING.md).

<!-- container image -->

[quai.io]: https://img.shields.io/badge/Quay.io-container%20image-green?style=flat&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAIKADAAQAAAABAAAAIAAAAACshmLzAAABSlBMVEUAAAD////////////////////////39/f/+fn/////+fn5+fn69vb///r///v39/L///v48fH7+/v48fH//Pn28e78+fn07+z9+Pjy6+n79/X79/b7+Pbs5eL89vX69/Pr4+D69/Pp4t369vPn39z59fLm3dr49PLk3Nf49PHk2tb38/Hh1tT29PDf1tL28u/38u/d1ND18u/b0s718e708e3Xzsr08e3r5uPz7+3Ty8fw7Ony7+zx7evx7uvw7evMxsPw7erLxcLv7Onv7evJw8Hu7OrFwcDHwsDt7Oru7Oq7u7u8vLy9vLy9vb2+vby/vr3Avr3Av77AwMDBv77BwcHCv77Dw8PEwL/FxcXIyMjLyMbLy8vNzc3Q0NDT09PW1tbY2NjZ2dnb29vd3d3i4uLk5OTo6Ojp6enq6urr6unr6urs6uns6+ryGpEZAAAAS3RSTlMABAgMEBgcICgoLC42Njo8PEhISlJYXF5wdIGHiZOTmZubpaWtrbW1u7vDw8nJ0dHT1dXb29/l5evr7e3t8/P19/f5+fn7+/39/f30Ld0iAAABMElEQVQ4y42TxVYDQRBFK4q7uwUILoFggeBWg1twlxD4/y3z3iBhwSlqdc+r2z09LSL/q/IEajIMDk6BZ6p+CWMvqIsouJN8Hc/uF6WRPTqpoIh/E/x84JRlCUMcdKkaEWkj36jGfvp5GWRP26rrflmicKS6U/gt9DG7UrdaG8l34MGvfugd2ds+wsUkOH0O3sv9FLo5qCeG8Iw8EQFrr9cPbCB7DVc4bvZAoTqYgnAcotDBbEAkrnpKTohEOUUX+r5VZJl8kRrVewq1IjmHENYCrtDMbBTu9Al5FtzPKdpdWuCySxHW3VJoABfsQljxST2zca6mmLzsrX2EUzTJHCeoZDZMocUTSrYgzNuC+QlzkfZvmhtlbrV9WOZx2xfGvHL2pTWvvf1wzKdnP96/6wNJ78x7Y9V/XgAAAABJRU5ErkJggg==&logoColor=white

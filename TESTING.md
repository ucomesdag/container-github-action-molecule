# Testing

To test the container before publication, run these steps.

1. `container_hash=$(podman build . -q)`.
2. Go to a role-directory, like `ansible-role-example`.
3. `namespace=$(grep -oP '(?<=namespace: )\w+' meta/main.yml)`
4. Try lint: `podman run --privileged --volume ${PWD}:/github/workspace/${namespace}/${PWD##*/}:z --tty --interactive --env command="lint" --env GITHUB_REPOSITORY="${namespace}/${PWD##*/}" --env ANSIBLE_ROLES_PATH="../" ${container_hash}`
5. Try role: `podman run --privileged --volume ${PWD}:/github/workspace/${namespace}/${PWD##*/}:z --tty --interactive --env GITHUB_REPOSITORY="${namespace}/${PWD##*/}" --env ANSIBLE_ROLES_PATH="../" ${container_hash}`

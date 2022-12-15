SHELL := /bin/bash

git-check:
	git status -uno .
	@if [ $$(git rev-parse HEAD) = $$(git rev-parse main@{upstream}) ]; then echo "Git Status OK"; else echo "Git Status FAILED" && exit 1; fi

# make git m="<commit-message>"
git: git-check
	@git add .
	@git commit -m "[ansible-pull] by $${USER^}" -m "${m}"
	@git push -u origin main 

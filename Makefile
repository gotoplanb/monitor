# Makefile for coordinating git operations across all repositories

# List of all repositories
REPOS := monitors-api monitors-client-nextjs monitors-terraform pester

# Default target
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make commit MESSAGE=\"Your commit message\" - Add and commit changes in all repos"
	@echo "  make tag TAG=\"v1.0.0\"                    - Tag all repos with the same tag"
	@echo "  make push-tags                             - Push tags to remote for all repos"
	@echo "  make status                                - Show git status for all repos"
	@echo "  make pull                                  - Pull latest changes for all repos"
	@echo "  make push                                  - Push commits to remote for all repos"

# Add and commit changes in all repositories
.PHONY: commit
commit:
	@if [ -z "$(MESSAGE)" ]; then echo "ERROR: Please provide a commit message with MESSAGE=\"Your message\""; exit 1; fi
	@echo "Adding and committing changes to all repositories..."
	@for repo in $(REPOS); do \
		echo "\n=== Processing $$repo ==="; \
		if [ -d "$$repo/.git" ]; then \
			cd "$$repo" && \
			git add . && \
			git commit -m "$(MESSAGE)" && \
			cd - > /dev/null || exit 1; \
		else \
			echo "Skipping $$repo (not a git repository)"; \
		fi; \
	done
	@echo "Commits complete!"

# Tag all repositories with the same tag
.PHONY: tag
tag:
	@if [ -z "$(TAG)" ]; then echo "ERROR: Please provide a tag with TAG=\"v1.0.0\""; exit 1; fi
	@echo "Tagging all repositories with $(TAG)..."
	@for repo in $(REPOS); do \
		echo "\n=== Tagging $$repo ==="; \
		if [ -d "$$repo/.git" ]; then \
			cd "$$repo" && \
			git tag -a $(TAG) -m "Release $(TAG)" && \
			cd - > /dev/null || exit 1; \
		else \
			echo "Skipping $$repo (not a git repository)"; \
		fi; \
	done
	@echo "Tagging complete!"

# Push tags to remote for all repositories
.PHONY: push-tags
push-tags:
	@echo "Pushing tags to remote for all repositories..."
	@for repo in $(REPOS); do \
		echo "\n=== Pushing tags for $$repo ==="; \
		if [ -d "$$repo/.git" ]; then \
			cd "$$repo" && \
			git push --tags && \
			cd - > /dev/null || exit 1; \
		else \
			echo "Skipping $$repo (not a git repository)"; \
		fi; \
	done
	@echo "Tags pushed!"

# Show git status for all repositories
.PHONY: status
status:
	@echo "Showing status for all repositories..."
	@for repo in $(REPOS); do \
		echo "\n=== Status for $$repo ==="; \
		if [ -d "$$repo/.git" ]; then \
			cd "$$repo" && \
			echo "Branch: $$(git branch --show-current)" && \
			echo "Status:" && \
			git status -s && \
			cd - > /dev/null || exit 1; \
		else \
			echo "Skipping $$repo (not a git repository)"; \
		fi; \
	done

# Pull latest changes for all repositories
.PHONY: pull
pull:
	@echo "Pulling latest changes for all repositories..."
	@for repo in $(REPOS); do \
		echo "\n=== Pulling $$repo ==="; \
		if [ -d "$$repo/.git" ]; then \
			cd "$$repo" && \
			git pull && \
			cd - > /dev/null || exit 1; \
		else \
			echo "Skipping $$repo (not a git repository)"; \
		fi; \
	done
	@echo "Pull complete!"

# Push commits to remote for all repositories
.PHONY: push
push:
	@echo "Pushing commits to remote for all repositories..."
	@for repo in $(REPOS); do \
		echo "\n=== Pushing $$repo ==="; \
		if [ -d "$$repo/.git" ]; then \
			cd "$$repo" && \
			git push && \
			cd - > /dev/null || exit 1; \
		else \
			echo "Skipping $$repo (not a git repository)"; \
		fi; \
	done
	@echo "Push complete!"
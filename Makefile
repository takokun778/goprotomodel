include .env
export

.PHONY: help
help: ## display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: aqua
aqua: ## Put the path in your environment variables. ex) export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
	@go run github.com/aquaproj/aqua-installer@latest --aqua-version v2.0.0

.PHONY: tool
tool: ## Install tool.
	@aqua i

.PHONY: gen
gen: ## Generate code.
	@buf generate --template buf.gen.yaml
	@go mod tidy

.PHONY: buflint
buflint: ## Lint proto file.
	@buf lint

.PHONY: bufmt
bufmt: ## Format proto file.
	@buf format -w

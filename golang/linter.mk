LINTER_VERSION=v1.46.2
LINTER_PATH=./bin/golangci-lint_$(subst .,_,${LINTER_VERSION})
CONFIG_VERSION=v1.0.1
CONFIG_PATH=.golangci_$(subst .,_,${CONFIG_VERSION}).yml

.PHONY: go_lint get_go_lint_binary get_go_lint_config

get_go_lint_binary:
	@[ -f ${LINTER_PATH} ] && echo "golangci-lint exists" || ( echo "getting golangci-lint" && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b ./bin $(LINTER_VERSION) && mv ./bin/golangci-lint ${LINTER_PATH})
	@${LINTER_PATH} --version

get_go_lint_config:
	@[ -f ${CONFIG_PATH} ] && echo ".golangci.yml exists" || ( echo "getting .golangci.yml" && curl -o ${CONFIG_PATH} -sO https://raw.githubusercontent.com/spacetab-io/linter-go/${CONFIG_VERSION}/.golangci.yml )

go_lint: get_go_lint_binary get_go_lint_config
	${LINTER_PATH} run -c ${CONFIG_PATH} -v

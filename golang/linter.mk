LINTER_VERSION=v1.38.0
LINTER_PATH=./bin/golangci-lint

.PHONY: go_lint get_go_lint_binary get_go_lint_config

get_go_lint_binary:
	@[ -f ${LINTER_PATH} ] && echo "golangci-lint exists" || ( echo "getting golangci-lint" && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b ./bin $(LINTER_VERSION) )
	@${LINTER_PATH} --version

get_go_lint_config:
	@[ -f .golangci.yml ] && echo ".golangci.yml exists" || ( echo "getting .golangci.yml" && curl -s -O https://raw.githubusercontent.com/spacetab-io/docker-images-golang/master/linter/.golangci.yml )

go_lint: get_go_lint_binary get_go_lint_config
	${LINTER_PATH} run -v

# makefiles
Makefiles includes collection

## golang

Collection of makefiles includes for golang project.

### linter.mk

Adds commands to lint golang project with golangci-lint with [custom config](https://github.com/spacetab-io/docker-images-golang/blob/master/linter/.golangci.yml).

Add this lines to your Makefile and run `make lint`:

```makefile
# ----
## LINTER stuff start

linter_include_check:
	@[ -f linter.mk ] && echo "linter.mk include exists" || (echo "getting linter.mk from github.com" && curl -sO https://raw.githubusercontent.com/spacetab-io/makefiles/master/golang/linter.mk)

.PHONY: lint
lint: linter_include_check
	@make -f linter.mk go_lint

## LINTER stuff end
# ----
```

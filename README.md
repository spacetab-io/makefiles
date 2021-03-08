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

Don't forget to add `linter.mk` and `.golangci.yml` to project `.gitignore` file

### tests.mk

Adds commands to test golang project.

Add this lines to your Makefile and run `make tests`:

```makefile
# ----
## TESTS stuff start

tests_include_check:
	@[ -f tests.mk ] && echo "tests.mk include exists" || (echo "getting tests.mk from github.com" && curl -sO https://raw.githubusercontent.com/spacetab-io/makefiles/master/golang/tests.mk)

tests: tests_include_check
	@make -f tests.mk go_tests
.PHONY: tests

tests_html: tests_include_check
	@make -f tests.mk go_tests_html
	@open coverage.html
.PHONY: tests_html

## TESTS stuff end
# ----
```

Don't forget to add `tests.mk` to project `.gitignore` file

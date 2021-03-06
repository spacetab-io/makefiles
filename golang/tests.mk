.PHONY: go_tests go_unit_tests go_coverage_html

go_unit_tests:
	@go test -cover -race -count=1 -timeout 1s -coverprofile=c.out -v ./... && go tool cover -func=c.out

go_coverage_html:
	@go tool cover -html=c.out -o coverage.html
	rm c.out

go_tests: go_unit_tests go_coverage_html

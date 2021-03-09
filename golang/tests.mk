.PHONY: go_tests go_tests_html go_run_unit_tests go_get_html_coverage

go_run_unit_tests:
	@go test -cover -race -timeout 1s -coverprofile=c.out -v ./...
	@go tool cover -func=c.out

go_get_html_coverage:
	@go tool cover -html=c.out -o coverage.html

rm_cover_profile:
	@rm c.out

go_tests: go_run_unit_tests rm_cover_profile
go_tests_html: go_run_unit_tests go_get_html_coverage

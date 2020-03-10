.PHONY: test
test: test_image_id
	test/in
	test/out
	test/check

test_image_id: bin/in bin/out bin/check bin/common
	docker build --quiet --iidfile $@ .

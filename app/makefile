db_init:
	docker-compose exec employee-app sh utils/db_init.sh
generate_dashboard:
	jsonnet utils/grafana/build-dashboard.jsonnet -o utils/grafana/grafana.json

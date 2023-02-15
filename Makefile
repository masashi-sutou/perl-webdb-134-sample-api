.DEFAULT_GOAL := help
ARG=

.PHONY: setup
setup: ## サンプルプロジェクトの初回設定コマンド
	./script/setup.sh

.PHONY: endpoint
endpoint: ## APIのエンドポイント一覧を表示する
	carton exec -- etc/app.pl routes -v

.PHONY: endpoint-request
endpoint-request: ## APIへcurlでリクエストを送る
	curl -if http://localhost:5000/${ARG}

.PHONY: start
start: ## APIコンテナを起動する
	docker compose up -d

.PHONY: down
down: ## APIコンテナを終了する
	docker compose rm -fsv api

.PHONY: lint
lint: ## perlcriticを実行する
	./script/linter.sh

.PHONY: format
format: ## perltidyを実行する
	./script/formatter.sh

.PHONY: update-cpanfile-snapshot
update-cpanfile-snapshot: ## 更新可能なcpanfileのモジュールを表示する
	./script/update.sh
	$(MAKE) build ARG=api

.PHONY: test
test: ## APIのテストを実行する
	docker compose run --rm api prove --QUIET --lib --recurse t/

.PHONY: clean
clean: ## コンテナとイメージを削除する
	docker compose down --rmi all --volumes

.PHONY: db-login
db-login: ## DBコンテナにMySQLログインする
	docker compose exec db mysql -utester -ppassword sample

.PHONY: help
help: ## このヘルプを表示する
	@echo "[コマンド名]              [説明]"
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'

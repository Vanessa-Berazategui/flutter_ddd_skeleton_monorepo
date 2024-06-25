.PHONY: clean
clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	fvm flutter clean

.PHONY: get
get: ## Get project dependencies
	@echo "╠ Get dependencies"
	fvm flutter pub get

.PHONY: generate
generate: ## Generates autogenerated code
	@echo "╠ Generating code"
	fvm flutter pub run build_runner build

.PHONY: regenerate
regenerate: ## Regenerates autogenerated code
	@echo "╠ Re-generating code"
	fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: generate-watch
generate-watch: ## Generates autogenerated code
	@echo "╠ Generating code"
	fvm flutter pub run build_runner watch

.PHONY: format
format: ## Formats the code
	@echo "╠ Formatting the code"
	fvm dart format .

.PHONY: lint
lint: ## Lints the code
	@echo "╠ Verifying code..."
	fvm flutter analyze . || (echo "Error in project"; exit 1)fvm 

.PHONY: fix
fix: ## Fixing the code
	@echo "╠ Fixing code..."
	fvm dart fix --apply

.PHONY: icon
icon: ## Generates launcher icon
	@echo "╠ Making launcher icon"
	fvm dart run icons_launcher:create

.PHONY: splash
splash: ## Generates native splash
	@echo "╠ Making native splash"
	fvm flutter pub run flutter_native_splash:create

.PHONY: build_apk
build_apk: ## Build Android mobile application form mode
	@echo "╠ Building Android mobile application for mode $(mode) and flavour $(flavour)..."
	fvm flutter build apk --flavor $(flavour) --$(mode) -t lib/main_production.dart --obfuscate --split-debug-info=./obfuscatation/debug

.PHONY: build_new_ipa
build_new_ipa: ## Build mobile application for mode and flavour
	@echo "╠ Building iOS mobile application for $(mode) and flavour $(flavour)..."
	fvm flutter build ipa --flavor $(flavour) --$(mode) -t lib/main_production.dart
	## fvm flutter build ipa --flavor $(flavour) --$(mode) --export-options-plist=ios/ExportOptionsAppStore.plist -t lib/main_production.dart.dart --obfuscate --split-debug-info=./obfuscatation/debug

PHONY: rebuild_ipa
rebuild_ipa: ## Re Build mobile application for mode
	@echo "╠ Building iOS mobile application for $(mode) and flavour $(flavour)..."
	fvm flutter build ipa --flavor $(flavour) --$(mode) --export-options-plist=ios/ExportOptionsAppStore.plist -t lib/main_production.dart --obfuscate --split-debug-info=./obfuscatation/debug

.PHONY: build_web
build_web: ## Build web application for mode
	@echo "╠ Building web application for mode $(mode) and flavour $(flavour)..."
	fvm flutter build web --flavor $(flavour) --$(mode) lib/main_production.dart --web-renderer canvaskit --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_CANVASKIT_URL=canvaskit/

.PHONY: build_win
build_win: ## Build win application for mode
	@echo "╠ Building windows application for $(mode) and flavour $(flavour)..."
	fvm flutter build windows $(flavour) --$(mode) -t lib/main_production.dart 

.PHONY: build_macos
build_macos: ## Build macos application for mode
	@echo "╠ Building macos application for $(mode) and flavour $(flavour)..."
	fvm flutter build macos $(flavour) --$(mode) -t lib/main_production.dart 

.PHONY: run
run:
	@echo "╠ Running the application for device $(device)"
	fvm flutter run -d $(device)

.PHONY: rename-package
rename-package:
	@echo "╠ Renaming the package app to $(full-name)"
	fvm flutter pub run change_app_package_name:main $(full-name)

.PHONY: rename-app
rename-app:
	@echo "╠ Renaming the app to $(name)"
	fvm flutter pub run rename_app:main all=$(name)

.PHONY: sort
sort: ## Sorting dependencies
	@echo "╠ Sorting dependencies..."
	fvm flutter pub run import_sorter:main

.PHONY: test
test: ## Executing test
	@echo "╠ Executing unit test and widget test..."
	fvm flutter test --coverage test/*
	@echo "╠ Executing integration test..."
	fvm flutter test --coverage integration_test/* 

.PHONY: report_test
report_test: ## Generate report test
	@echo "╠ Generating report test..."
	genhtml coverage/lcov.info -o report 
	open report/index.html

.PHONY: keystore
keystore: keytool -genkey -v -keystore key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key	
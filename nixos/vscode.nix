{ config, inputs, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;

        extensions = with pkgs.vscode-extensions; [
            # Theming
            catppuccin.catppuccin-vsc-icons         # File & Folder icons
            catppuccin.catppuccin-vsc               # Main theme

            # General Language Support
            esbenp.prettier-vscode                  # Prettier
            dbaeumer.vscode-eslint                  # ESLint
            xaver.clang-format                      # C++ Clang Formatting

            # Language Support
            devsense.phptools-vscode                # PHP Intellisense
            devsense.profiler-php-vscode            # PHP xDebug Debugger/Profiler
            ms-vscode.cpptools                      # C++
            rust-lang.rust-analyzer                 # Rust
            yzhang.markdown-all-in-one              # Markdown
        ];

        keybindings = [
            {
                "key" = "ctrl+e";
                "command" = "editor.action.deleteLines";
                "when" = "textInputFocus && !editorReadonly";
            }
        ];

        userSettings = {
            "editor.autoClosingQuotes" = "never";
            "editor.acceptSuggestionOnEnter" = "off";
            "editor.bracketPairColorization.enabled" = true;
            "editor.fontFamily" = "'Dank Mono', 'Consolas', 'Courier New', 'monospace'";
            "editor.fontLigatures" = true;
            "editor.fontSize" = 13;
            "editor.quickSuggestionsDelay" = 10;
            "editor.tabCompletion" = "on";
            "editor.wordBasedSuggestions" = false;
            "editor.wordWrap" = "on";
            "editor.tokenColorCustomizations" = {
                "comments" = "#777";
            };
            "editor.quickSuggestions" = {
                "other" = false;
                "comments" = false;
                "strings" = false;
            };

            "files.autoSave" = "afterDelay";
            "files.eol" = "\n";
            "files.insertFinalNewline" = true;
            "files.trimTrailingWhitespace" = true;
            "workbench.panel.defaultLocation" = "right";
            "workbench.editor.untitled.hint" = "hidden";
            "workbench.iconTheme" = "catppuccin-mocha";
            "workbench.startupEditor" = "none";

            "typescript.check.npmIsInstalled" = false;
            "html.autoClosingTags" = false;

            "breadcrumbs.enabled" = true;

            "window.titleBarStyle" = "custom";

            "explorer.confirmDelete" = false;
            "explorer.confirmDragAndDrop" = false;
            "explorer.compactFolders" = false;
            "workbench.sideBar.location" = "left";

            "vsicons.dontShowNewVersionMessage" = true;
            "gitlab.enableExperimentalFeatures" = true;

            "php.validate.enable" = false;
            "php.validate.run" = "onType";

            "terminal.integrated.defaultProfile.windows" = "Command Prompt";
            "terminal.integrated.profiles.windows" = {
                "C:\\Program Files\\Git\\bin\\bash.exe (migrated)" = {
                    "path" = "C:\\Program Files\\Git\\bin\\bash.exe";
                    "args" = [];
                };
            };

            "liveServer.settings.donotShowInfoMsg" = true;

            "[json]" = {
                "editor.quickSuggestions" = {
                    "strings" = true;
                };
                "editor.suggest.insertMode" = "replace";
            };

            "phpcs.composerJsonPath" = "C:\\Users\\Toxoc\\AppData\\Roaming\\Composer\\composer.json";
            "phpcs.executablePath" = "C:\\Users\\Toxoc\\AppData\\Roaming\\Composer\\vendor\\squizlabs\\php_codesniffer\\bin\\phpcs";

            "search.exclude" = {
                "**/node_modules" = true;
                "**/bower_components" = true;
                "**/.git" = true;
                "**/storage" = true;
                "**/tests" = true;
                "_ide_helper.php" = true;
                "_ide_helper_models.php" = true;
                "package-lock.json" = true;
            };

            "intelephense.completion.triggerParameterHints" = true;
            "intelephense.completion.fullyQualifyGlobalConstantsAndFunctions" = true;
            "intelephense.environment.documentRoot" = "C:\\xampp\\htdocs";
            "intelephense.environment.shortOpenTag" = false;
            "intelephense.format.braces" = "allman";
            "intelephense.format.enable" = false;
            "intelephense.maxMemory" = 256;
            "intelephense.telemetry.enabled" = true;
            "intelephense.files.exclude" = [
                "**/.git/**"
                "**/.svn/**"
                "**/.hg/**"
                "**/CVS/**"
                "**/.DS_Store/**"
                "**/node_modules/**"
                "**/bower_components/**"
                "**/vendor/**/{Tests,tests}/**"
                "**/.history/**"
                "**/vendor/**/vendor/**"
            ];

            "[typescript]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[javascript]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[php]" = {
                "editor.defaultFormatter" = "bmewburn.vscode-intelephense-client";
            };
	    "[hpp]" = {
                "editor.defaultFormatter" = "ms-vscode.cpptools";
	    };
            "[cpp]" = {
		"editor.defaultFormatter" = "ms-vscode.cpptools";
            };
	    "[h]" = {
                "editor.defaultFormatter" = "ms-vscode.cpptools";
	    };

            "editor.formatOnSave" = true;
            "editor.formatOnPaste" = true;
            "html.format.indentInnerHtml" = true;
            "html.format.templating" = true;
            "javascript.format.semicolons" = "insert";
            "typescript.format.semicolons" = "insert";
            "editor.cursorBlinking" = "smooth";
            "terminal.integrated.cursorBlinking" = true;
            "livePreview.notifyOnOpenLooseFile" = false;
            "editor.unicodeHighlight.nonBasicASCII" = false;
            "codesnap.transparentBackground" = true;
            "codesnap.showWindowControls" = false;
            "liveServer.settings.donotVerifyTags" = true;
            "update.showReleaseNotes" = false;
            "workbench.colorTheme" = "Horizon";

            "telemetry.enableCrashReporter" = false;
            "telemetry.enableTelemetry" = false;
            "code-runner.enableAppInsights" = false;
            "update.mode" = "none";
            "extensions.autoUpdate" = false;
            "extensions.ignoreRecommendations" = true;
            "git.confirmSync" = false;
            "[typescriptreact]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "prettier.configPath" = ".prettierrc.json";
            "prettier.jsxSingleQuote" = true;
            "prettier.singleQuote" = true;
            "javascript.updateImportsOnFileMove.enabled" = "always";
            "typescript.updateImportsOnFileMove.enabled" = "always";
            "editor.stickyScroll.enabled" = true;
            "files.maxMemoryForLargeFilesMB" = 4098;
            "php-cs-fixer.lastDownload" = 1672093923206;
            "editor.linkedEditing" = true;
            "editor.guides.bracketPairs" = true;
            "window.commandCenter" = true;
            "git.autofetch" = true;
            "prettier.tabWidth" = 4;
        };
    };
}

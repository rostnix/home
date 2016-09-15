((ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el" :depends
            (dash s)))
 (auto-virtualenv status "installed" recipe
                  (:name auto-virtualenv :type github :pkgname "marcwebbie/auto-virtualenv" :description "Automatically compile Emacs Lisp libraries." :depends
                         (cl-lib pyvenv s)
                         :post-init
                         (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)))
 (avy status "installed" recipe
      (:name avy :description "Jump to things in Emacs tree-style." :type github :pkgname "abo-abo/avy" :depends
             (cl-lib)
             :post-init
             (setq avy-all-windows 'all-frames)))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (company-flx status "installed" recipe
              (:name company-flx :description "Fuzzy matching for company." :type github :pkgname "PythonNut/company-flx" :depends
                     (company-mode flx)
                     :post-init
                     (with-eval-after-load 'company
                         (company-flx-mode 1))))
 (company-jedi status "installed" recipe
               (:name company-jedi :description "Company backend for Python jedi." :website "https://github.com/syohex/emacs-company-jedi" :type github :pkgname "syohex/emacs-company-jedi"))
 (company-mode status "installed" recipe
               (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode" :features
                      (company-files company-semantic company-css company-etags company-keywords)
                      :post-init
                      (progn
                          (global-company-mode t)
                          (setq company-idle-delay -1 delete-selection-mode t company-minimum-prefix-length 1 company-dabbrev-downcase nil company-dabbrev-other-buffers t company-echo-delay 0 company-show-numbers t company-dabbrev-code-everywhere t company-dabbrev-code-ignore-case t company-selection-wrap-around t company-tooltip-align-annotations t selection-coding-system 'utf-8 company-auto-complete-chars
                                '(32 40 41 119 46 34 36 47 124 33)
                                company-backends
                                '((company-yasnippet company-files company-semantic company-css company-capf company-etags company-keywords company-nxml company-dabbrev-code company-dabbrev))))))
 (company-restclient status "installed" recipe
                     (:name company-restclient :description "Company-mode completion back-end for restclient-mode." :website "https://github.com/iquiw/company-restclient" :type github :pkgname "iquiw/company-restclient" :depends
                            (company-mode restclient know-your-http-well)))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
     (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
                (when
                        (memq 'el-get
                              (bound-and-true-p package-activated-list))
                    (message "Deleting melpa bootstrap el-get")
                    (unless package--initialized
                        (package-initialize t))
                    (when
                            (package-installed-p 'el-get)
                        (let
                                ((feats
                                  (delete-dups
                                   (el-get-package-features
                                    (el-get-elpa-package-directory 'el-get)))))
                            (el-get-elpa-delete-package 'el-get)
                            (dolist
                                    (feat feats)
                                (unload-feature feat t))))
                    (require 'el-get))))
 (emacs-async status "installed" recipe
              (:name emacs-async :description "Simple library for asynchronous processing in Emacs" :type github :pkgname "jwiegley/emacs-async"))
 (emacs-fish status "installed" recipe
             (:name emacs-fish :type github :description "Emacs major mode for fish shell scripts." :pkgname "wwwjfy/emacs-fish"))
 (emmet-mode status "installed" recipe
             (:name emmet-mode :website "https://github.com/smihica/emmet-mode" :description "Produce HTML from CSS-like selectors." :type "github" :pkgname "smihica/emmet-mode" :post-init
                    (progn
                        (add-hook 'sgml-mode-hook 'emmet-mode)
                        (add-hook 'html-mode-hook 'emmet-mode)
                        (add-hook 'web-mode-hook 'emmet-mode)
                        (add-hook 'css-mode-hook 'emmet-mode))))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (flx status "installed" recipe
      (:name flx :description "Fuzzy matching with good sorting in ido" :type github :pkgname "lewang/flx"))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck" :checkout "0.25.1" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension" :build
                  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
                  :info "./doc" :depends
                  (dash pkg-info let-alist seq)
                  :post-init
                  (progn
                      (add-hook 'python-mode-hook #'flycheck-mode)
                      (add-hook 'js-mode-hook #'flycheck-mode)
                      (add-hook 'web-mode-hook #'flycheck-mode)
                      (add-hook 'lisp-interaction-mode-hook #'flycheck-mode)
                      (add-hook 'fish-mode-hook #'flycheck-mode)
                      (add-hook 'markdown-mode-hook #'flycheck-mode)
                      (add-hook 'go-mode-hook #'flycheck-mode)
                      (setq flycheck-check-syntax-automatically
                            '(mode-enabled save idle-change))
                      (setq flycheck-highlighting-mode 'lines)
                      (setq flycheck-indication-mode 'left-fringe)
                      (setq flycheck-checker-error-threshold 2000))))
 (flycheck-gometalinter status "installed" recipe
                        (:name flycheck-gometalinter :type github :pkgname "favadi/flycheck-gometalinter" :description "On-the-fly syntax checking extension for golang" :build
                               (("bash" "-c" "go get -u github.com/alecthomas/gometalinter && gometalinter --install --update"))
                               :depends
                               (flycheck)
                               :post-init
                               (progn
                                   (eval-after-load 'flycheck
                                       '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup)))))
 (git-gutter status "installed" recipe
             (:name git-gutter :description "Emacs port of GitGutter Sublime Text 2 Plugin" :website "https://github.com/syohex/emacs-git-gutter" :type github :pkgname "syohex/emacs-git-gutter" :post-init
                    (progn
                        (global-git-gutter-mode t)
                        (git-gutter:linum-setup))))
 (go-company status "installed" recipe
             (:name go-company :description "An autocompletion daemon for the Go programming language" :type go :pkgname "github.com/nsf/gocode" :depends
                    (company-mode go-mode)
                    :load-path
                    ("src/github.com/nsf/gocode/emacs-company")
                    :prepare
                    (eval-after-load 'go-mode
                        '(require 'company-go))
                    :post-init
                    (progn
                        (add-to-list 'exec-path
                                     (concat default-directory "bin")))))
 (go-mode status "installed" recipe
          (:name go-mode :description "Major mode for the Go programming language" :type github :pkgname "dominikh/go-mode.el"))
 (go-rename status "installed" recipe
            (:name go-rename :description "go-rename wrapper for Emacs" :url "https://raw.githubusercontent.com/golang/tools/master/refactor/rename/go-rename.el" :type http :depends
                   (go-mode)
                   :build
                   (("go" "get" "-u" "golang.org/x/tools/cmd/gorename"))
                   :compile "go-rename.el"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental completion and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
              (("make"))
              :build/darwin
              `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (let
                      ((generated-autoload-file
                        (expand-file-name "helm-autoloads.el"))
                       \
                       (backup-inhibited t))
              (update-directory-autoloads default-directory)
              nil)
       :features
       ("helm-config" "ido")
       :post-init
       (progn
           (setq helm-mode-fuzzy-match t helm-split-window-in-side-p t helm-completion-in-region-fuzzy-match t helm-candidate-number-limit 100 helm-move-to-line-cycle-in-source t helm-ff-search-library-in-sexp t helm-ff-file-name-history-use-recentf t helm-scroll-amount 8 helm-buffers-fuzzy-matching t helm-case-fold-search nil helm-autoresize-max-height 30 helm-autoresize-min-height 10 helm-recentf-fuzzy-match t)
           (helm-mode t)
           (add-to-list 'helm-completing-read-handlers-alist
                        '(find-file-read-only . ido))
           (add-to-list 'helm-completing-read-handlers-alist
                        '(find-file . ido))
           (helm-autoresize-mode 1))))
(helm-ag status "installed" recipe
(:name helm-ag :description "The silver search with helm interface." :type github :pkgname "syohex/emacs-helm-ag" :depends
(helm)
:post-init
(progn
(setq helm-ag-insert-at-point 'word helm-ag-use-temp-buffer t helm-ag-fuzzy-match t))))
(helm-projectile status "installed" recipe
(:name helm-projectile :description "Helm integration for Projectile." :type github :pkgname "bbatsov/helm-projectile" :depends
(projectile helm dash cl-lib)))
(helm-swoop status "installed" recipe
(:name helm-swoop :type github :description "Efficiently hopping squeezed lines powered by Emacs helm interface" :pkgname "ShingoFukuyama/helm-swoop" :depends
(helm)
:post-init
(progn
(setq helm-multi-swoop-edit-save nil helm-swoop-split-with-multiple-windows t helm-swoop-split-direction 'split-window-vertically helm-swoop-move-to-line-cycle t helm-swoop-use-fuzzy-match t))))
(jedi-core status "installed" recipe
(:name jedi-core :type github :pkgname "tkf/emacs-jedi" :description "Python auto-completion for Emacs." :minimum-emacs-version "24" :depends
(epc python-environment cl-lib)
:compile "jedi-core.el" :post-init
(progn
(setq jedi:get-in-function-call-timeout 0 jedi:get-in-function-call-delay 0 jedi:goto-definition-config
'((nil definition nil))))))
(js2-mode status "installed" recipe
(:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
(autoload 'js2-mode "js2-mode" nil t)))
(js2-refactor status "installed" recipe
(:name js2-refactor :description "This is a collection of small refactoring functions to further the idea of a JavaScript IDE in Emacs that started with js2-mode." :type github :pkgname "magnars/js2-refactor.el" :post-init
(add-hook 'js2-mode-hook
(lambda nil
(require 'js2-refactor)))
:depends
(js2-mode dash s multiple-cursors)
:post-init
(add-hook 'js2-mode-hook #'js2-refactor-mode)))
(json-mode status "installed" recipe
(:name json-mode :description "Major mode for editing JSON files, extends the builtin js-mode to add better syntax highlighting for JSON." :type github :pkgname "joshwnj/json-mode" :depends
(json-snatcher json-reformat)))
(json-reformat status "installed" recipe
(:name json-reformat :description "Reformatting tool for JSON." :type github :pkgname "gongo/json-reformat"))
(json-snatcher status "installed" recipe
(:name json-snatcher :description "Find the path to a value in JSON" :type github :pkgname "Sterlingg/json-snatcher"))
(key-chord status "installed" recipe
(:name key-chord :description "Map pairs of simultaneously pressed keys to commands." :type emacswiki :features "key-chord" :post-init
(key-chord-mode 1)))
(know-your-http-well status "installed" recipe
(:name know-your-http-well :description "HTTP headers, media-types, methods, relations and status codes, all summarized and linking to their specification." :website "https://github.com/for-GET/know-your-http-well" :type github :pkgname "for-GET/know-your-http-well" :load-path
("emacs")))
(less-css-mode status "installed" recipe
(:name less-css-mode :description "Emacs mode for LESS CSS (lesscss.org), with support for compile-on-save" :type github :pkgname "purcell/less-css-mode"))
(let-alist status "installed" recipe
(:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
(livedown status "installed" recipe
(:name livedown :description "Realtime Markdown previews for Emacs." :type github :pkgname "shime/emacs-livedown" :post-init
(eval-after-load 'markdown-mode
'(require 'livedown))))
(magit status "installed" recipe
(:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :branch "master" :minimum-emacs-version "24.4" :depends
(dash with-editor emacs-async)
:info "Documentation" :load-path "lisp/" :compile "lisp/" :build
`(("make" ,(format "EMACSBIN=%s" el-get-emacs)
"docs")
("touch" "lisp/magit-autoloads.el"))
:build/berkeley-unix
`(("gmake" ,(format "EMACSBIN=%s" el-get-emacs)
"docs")
("touch" "lisp/magit-autoloads.el"))
:build/windows-nt
(with-temp-file "lisp/magit-autoloads.el" nil)))
(markdown-mode status "installed" recipe
(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type github :pkgname "jrblevin/markdown-mode" :prepare
(add-to-list 'auto-mode-alist
'("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))
:post-init
(add-hook 'markdown-mode-hook
(progn
(when buffer-file-name
(add-hook 'after-save-hook 'check-parens nil t))))))
(mo-git-blame status "installed" recipe
(:name mo-git-blame :description "An interactive, iterative 'git blame' mode for Emacs" :type github :pkgname "mbunkus/mo-git-blame" :features "mo-git-blame"))
(multi-compile status "installed" recipe
(:name multi-compile :description "Multi target interface to compile." :type github :pkgname "ReanGD/emacs-multi-compile" :depends
(dash)
:post-init
(progn
(setq multi-compile-alist
'((go-mode
("go-run" "go run -v"
(buffer-file-name))
("go-build" "go build -v"
(locate-dominating-file buffer-file-name ".git"))
("go-build-and-run" "go build -v && echo 'build finish' && eval ./${PWD##*/}"
(multi-compile-locate-file-dir ".git"))))))))
(multiple-cursors status "installed" recipe
(:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
(neotree status "installed" recipe
(:name neotree :website "https://github.com/jaypei/emacs-neotree" :description "An Emacs tree plugin like NerdTree for Vim." :type github :branch "dev" :pkgname "jaypei/emacs-neotree" :post-init
(progn
(global-set-key
[f7]
'neotree-toggle)
(setq neo-theme 'arrow neo-hidden-regexp-list
'("\\.pyc$" "\\.elc$" "\\.git$" "__pycache__$")
neo-vc-integration
'(face)
neo-cwd-line-style 'text neo-create-file-auto-open t projectile-switch-project-action 'neotree-projectile-action))))
(package status "installed" recipe
(:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "https://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :features package :post-init
(progn
(let
((old-package-user-dir
(expand-file-name
(convert-standard-filename
(concat
(file-name-as-directory default-directory)
"elpa")))))
(when
(file-directory-p old-package-user-dir)
(add-to-list 'package-directory-list old-package-user-dir)))
(setq package-archives
(bound-and-true-p package-archives))
(let
((protocol
(if
(and
(fboundp 'gnutls-available-p)
(gnutls-available-p))
"https://"
(lwarn
'(el-get tls)
:warning "Your Emacs doesn't support HTTPS (TLS)%s"
(if
(eq system-type 'windows-nt)
",\n  see https://github.com/dimitri/el-get/wiki/Installation-on-Windows." "."))
"http://"))
(archives
'(("melpa" . "melpa.org/packages/")
("gnu" . "elpa.gnu.org/packages/")
("marmalade" . "marmalade-repo.org/packages/"))))
(dolist
(archive archives)
(add-to-list 'package-archives
(cons
(car archive)
(concat protocol
(cdr archive)))))))))
(pip-requirements status "installed" recipe
(:name pip-requirements :website "https://github.com/Wilfred/pip-requirements.el#readme" :description "A major mode for editing pip requirements files." :depends
(dash)
:type github :pkgname "Wilfred/pip-requirements.el" :library pip-requirements))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(powerline status "installed" recipe
(:name powerline :website "https://github.com/milkypostman/powerline" :depends
(cl-lib)
:description "Powerline for Emacs" :type github :pkgname "milkypostman/powerline" :load-path "." :features powerline :post-init
(progn
(powerline-center-theme))))
(projectile status "installed" recipe
(:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends
(dash pkg-info ag)
:post-init
(projectile-global-mode t)))
(py-autopep8 status "installed" recipe
(:name py-autopep8 :description "Use autopep8 to beautify a Python buffer." :type github :pkgname "paetzke/py-autopep8.el"))
(py-isort status "installed" recipe
(:name py-isort :type github :pkgname "paetzke/py-isort.el" :description "Provides commands, which use the external isort tool to tidy up the imports in the current buffer"))
(python-environment status "installed" recipe
(:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
(deferred)))
(pyvenv status "installed" recipe
(:name pyvenv :website "https://github.com/jorgenschaefer/pyvenv" :description "Python virtual environment interface for Emacs" :type github :pkgname "jorgenschaefer/pyvenv" :post-init
(el-get-envpath-prepend "PYTHONPATH" default-directory)))
(restclient status "installed" recipe
(:name restclient :description "HTTP REST client tool for emacs" :type github :pkgname "pashky/restclient.el" :post-init
(progn
(add-to-list 'auto-mode-alist
'("\\.rest\\'" . restclient-mode)))))
(s status "installed" recipe
(:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
(seq status "installed" recipe
(:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
(smartparens status "installed" recipe
(:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash :post-init
(add-hook 'after-init-hook #'smartparens-global-mode)))
(sunrise-commander status "installed" recipe
(:name sunrise-commander :description "Two-pane file manager for Emacs based on Dired and inspired by MC" :type github :pkgname "escherdragon/sunrise-commander" :load
("sunrise-x-loop.el" "sunrise-x-tree.el" "sunrise-x-modeline.el")))
(undo-tree status "installed" recipe
(:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/" :post-init
(progn
(global-undo-tree-mode t)
(setq undo-tree-visualizer-diff t)
(eval-after-load 'undo-tree
'(progn
(define-key undo-tree-map
(kbd "C-/")
nil)
(define-key undo-tree-map
(kbd "C-_")
nil)
(define-key undo-tree-map
(kbd "C-?")
nil)
(define-key undo-tree-map
(kbd "M-_")
nil)
(define-key undo-tree-map
(kbd "C-z")
'undo-tree-visualize)
(key-chord-define-global "zz" 'undo-tree-visualize)
(key-chord-define-global "zx" 'undo-tree-undo)
(define-key undo-tree-map
(kbd "C-c C-z")
'undo-tree-redo))))))
(web-mode status "installed" recipe
(:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode" :post-init
(progn
(setq web-mode-engines-alist
'(("django" . "\\.html\\'")
("jsx" . "\\.js\\'"))
web-mode-enable-current-element-highlight t web-mode-enable-block-face t web-mode-markup-indent-offset 4 web-mode-css-indent-offset 4 web-mode-code-indent-offset 4 web-mode-enable-part-face t web-mode-enable-comment-keywords t web-mode-enable-css-colorization t web-mode-enable-auto-pairing nil web-mode-enable-current-column-highlight t))))
(with-editor status "installed" recipe
(:name with-editor :description "Use the Emacsclient as $EDITOR" :type github :pkgname "magit/with-editor"))
(xclip status "installed" recipe
(:name xclip :description "Emacs Interface to XClip" :type http :url "http://www.mail-archive.com/gnu-emacs-sources@gnu.org/msg01336/xclip.el" :post-init
(add-hook 'tty-setup-hook 'turn-on-xclip)))
(yaml-mode status "installed" recipe
(:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
(yasnippet status "installed" recipe
(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets"))
:features
(yasnippet)
:post-init
(progn
(yas-reload-all)
(add-hook 'python-mode-hook #'yas-minor-mode)
(add-hook 'js-mode-hook #'yas-minor-mode)
(add-hook 'web-mode-hook #'yas-minor-mode)
(add-hook 'lisp-interaction-mode-hook #'yas-minor-mode)
(add-hook 'fish-mode-hook #'yas-minor-mode)
(add-hook 'markdown-mode-hook #'yas-minor-mode)
(add-hook 'go-mode-hook #'yas-minor-mode)))))

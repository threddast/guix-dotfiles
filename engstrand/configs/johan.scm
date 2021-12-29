(define-module (engstrand configs johan)
               #:use-module (gnu services)
               #:use-module (rde features base)
               #:use-module (rde features gnupg)
               #:use-module (engstrand features sync)
               #:use-module (engstrand features browsers)
               #:use-module (engstrand features emacs)
               #:use-module (engstrand features virtualization)
               #:use-module (engstrand features wayland)
               #:use-module (dwl-guile utils)
               #:use-module (dwl-guile home-service)
               #:use-module (dtao-guile home-service)
               #:use-module (engstrand utils)
               #:use-module (engstrand configs))

; TODO: Add custom packages as feature:
;       "youtube-dl"

(define-public %user-features
               (append
                 (list
                   (feature-user-info
                     #:user-name "johan"
                     #:full-name "Johan Engstrand"
                     #:email "johan@engstrand.nu")
                   (feature-gnupg
                     #:gpg-primary-key "DFC6C6B70EF5F7CB75EE97E6DF3088DDBCAD566D"
                     #:pinentry-flavor 'gtk2
                     #:gpg-smart-card? #f)
                   (feature-virtualization)
                   (feature-kdeconnect)
                   (feature-qutebrowser
                     #:add-keybindings? #f)
                   (feature-firefox)
                   (feature-custom-services
                     #:home-services
                     (list
                       (service home-dtao-guile-service-type
                                (home-dtao-guile-configuration
                                  (config
                                   (dtao-config
                                    (block-spacing 5)
                                    (bottom? #t)
                                    (use-dwl-guile-colorscheme? #t)
                                    (left-blocks
                                     (list
                                      (dtao-block
                                       (events? #t)
                                       (render `(string-append " 🐧 " (dtao:title monitor))))))
                                    (right-blocks
                                     (list
                                      (dtao-block
                                       (interval 1)
                                       (render `(strftime "%A, %d %b (w.%W) %T" (localtime (current-time)))))))
                                    (center-blocks
                                     (map (lambda (tag)
                                            (dtao-block
                                             (interval 0)
                                             (render (format #f "~a ~a ~a"
                                                             (if (eq? tag 1)
                                                                 "^bg(#ffcc00)^fg(#191919)"
                                                                 "")
                                                             (number->string tag)
                                                             (if (eq? tag 1)
                                                                 (string-append "^fg()^bg()")
                                                                 "")))))
                                          (iota 9 1)))))))
                       (simple-service
                        'change-dwl-guile-borderpx
                        home-dwl-guile-service-type
                        (modify-dwl-guile-config
                         (config =>
                                 (dwl-config
                                  (inherit config)
                                  (border-px 2)))))))
                   (feature-wayland-wbg
                    #:path (string-append (getenv "HOME")
                                          "/engstrand-config/wallpapers/default.jpg")))
                 %engstrand-emacs-base-features
                 %engstrand-base-features))

(define-module (engstrand configs fredrik)
               #:use-module (rde features)
               #:use-module (rde features base)
               #:use-module (rde features gnupg)
               #:use-module (rde features keyboard)
               #:use-module (rde features version-control)
               #:use-module (engstrand defaults))

; TODO: Add feature for adding git repos (state):
;       (list
;         '("repos/pywalfox" ,"git@github.com:frewacom/pywalfox.git")
;         '("repos/pywalfox-native" ,"git@github.com:frewacom/pywalfox-native.git")))

(define-public %user-features
               (list
                 (feature-user-info
                   #:user-name "fredrik"
                   #:full-name "Fredrik Engstrand"
                   #:email "fredrik@engstrand.nu")
                 (feature-gnupg
                   #:gpg-primary-key "C9BEB8A04458FDDF12681B39029D8EB77E18D68C"
                   #:gpg-smart-card? #f)
                 (feature-git
                   #:sign-commits? #t)))
(define-module (astra systems phoenix)
  #:use-module (astra utils)
  #:use-module (astra systems)
  #:use-module (guix gexp)
  #:use-module (rde features system)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system mapped-devices))

(define-public %system-features
 (list
  (feature-host-info
   #:host-name "phoenix"
   #:timezone %astra-timezone
   #:locale %astra-locale)
  (feature-bootloader)
  (feature-file-systems
   #:file-systems
   (list
    (file-system
     (mount-point "/")
     (device (file-system-label "guixroot"))
     (type "ext4"))
    (file-system
     (mount-point "/boot/efi")
     (device (file-system-label "guixboox"))
     (type "vfat"))))))

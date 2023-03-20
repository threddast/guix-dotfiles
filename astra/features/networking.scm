(define-module (astra features networking)
  #:use-module (rde features)
  #:use-module (gnu services)
  #:use-module (gnu services networking)
  #:use-module (gnu services ssh)
  #:export (feature-networking))

(define* (feature-networking)
  "Setup networking."

  (define (get-system-services config)
    (list
     (service network-manager-service-type)
     (service wpa-supplicant-service-type)
     (service openssh-service-type)))

  (feature
   (name 'astra-networking)
   (system-services-getter get-system-services)))

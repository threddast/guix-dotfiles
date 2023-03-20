(define-module (astra features hyprland)
  #:use-module (rde features)
  #:use-module (rde features predicates)
  #:use-module (rde system services accounts)
  #:use-module (rosenthal packages wm)
  #:use-module (gnu services)
  #:use-module (gnu services desktop)
  #:use-module (gnu home services)
  #:use-module (astra utils)
  #:export (feature-hyprland))

(define* (feature-hyprland)
  "Setup hyprland, a tiling window manager."
     
  (define (get-system-services config)
    "Return a list of home services required by hyprland."
    (list
     (simple-service
      'add-hyprland-system-packages-to-profile
      profile-service-type
      (list hyprland))))

  (feature
   (name 'hyprland)
   (system-services-getter get-system-services)))

(define-module (engstrand packages python)
               #:use-module (gnu packages libffi)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix build-system python)
               #:use-module ((guix licenses) #:prefix license:))

(define-public
  python-pywalfox
  (package
    (name "python-pywalfox")
    (version "2.7.3")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pywalfox" version))
        (sha256
          (base32
            "1gkxcnysygvcpfhinaxaa6lf7b7194x7vi928i0qpdw962ck1zsi"))))
    (build-system python-build-system)
    (home-page
      "https://github.com/frewacom/pywalfox")
    (synopsis
      "Native app used alongside the Pywalfox browser extension")
    (description
      "Native app used alongside the Pywalfox browser extension")
    (license #f)))

(define-public
  python-sounddevice
  (package
    (name "python-sounddevice")
    (version "0.4.3")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "sounddevice" version))
        (sha256
          (base32 "083crfkrx0y9gqybqcixzhrp7swqjr78nrmz9r6aqpxncxs7lrpi"))))
    (build-system python-build-system)
    (propagated-inputs `(("python-cffi" ,python-cffi)))
    (home-page "http://python-sounddevice.readthedocs.io/")
    (synopsis "Play and Record Sound with Python")
    (description "Play and Record Sound with Python")
    (license license:expat)))

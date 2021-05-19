;; the .costs contract

;; Helper Functions

;; Return a Cost Specification with just a runtime cost
(define-private (runtime (r uint))
    {
        runtime: r,
        write-length: u0,
        write-count: u0,
        read-count: u0,
        read-length: u0,
    })

;; Linear cost-assessment function
(define-private (linear (n uint) (a uint) (b uint))
    (+ (* a n) b))

;; LogN cost-assessment function
(define-private (logn (n uint) (a uint) (b uint))
    (+ (* a (log2 n)) b))

;; NLogN cost-assessment function
(define-private (nlogn (n uint) (a uint) (b uint))
    (+ (* a (* n (log2 n))) b))


;; Cost Functions
(define-read-only (cost-analysis-type-annotate (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-type-check (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-type-lookup (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-visit (n uint))
    (runtime u1000))

(define-read-only (cost-analysis-iterable-func (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-option-cons (n uint))
    (runtime u1000))

(define-read-only (cost-analysis-option-check (n uint))
    (runtime u1000))

(define-read-only (cost-analysis-bind-name (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-list-items-check (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-check-tuple-get (n uint))
    (runtime (logn n u1000 u1000)))

(define-read-only (cost-analysis-check-tuple-merge (n uint)) 
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-check-tuple-cons (n uint))
    (runtime (nlogn n u1000 u1000)))

(define-read-only (cost-analysis-tuple-items-check (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-check-let (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-lookup-function (n uint))
    (runtime u1000))

(define-read-only (cost-analysis-lookup-function-types (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-lookup-variable-const (n uint))
    (runtime u1000))

(define-read-only (cost-analysis-lookup-variable-depth (n uint))
    (runtime (nlogn n u1000 u1000)))

;; ast-parse is a very expensive linear operation, 
;;   primarily because it does the work of capturing
;;   most of the analysis phase's linear cost, but also
;;   because the most expensive part of the analysis phase 
;;   is the ast
(define-read-only (cost-ast-parse (n uint))
    (runtime (linear n u10000 u1000)))

(define-read-only (cost-ast-cycle-detection (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-analysis-storage (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u1,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-analysis-use-trait-entry (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u0,
        read-count: u1,
        read-length: (linear n u1 u1)
    })

(define-read-only (cost-analysis-get-function-entry (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: (linear n u1 u1)
    })

(define-read-only (cost-analysis-fetch-contract-entry (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: (linear n u1 u1)
    })

(define-read-only (cost-lookup-variable-depth (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-lookup-variable-size (n uint))
    (runtime (linear n u1000 u0)))

(define-read-only (cost-lookup-function (n uint))
    (runtime u1000))

(define-read-only (cost-bind-name (n uint))
    (runtime u1000))

(define-read-only (cost-inner-type-check-cost (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-user-function-application (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-let (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-if (n uint))
    (runtime u1000))

(define-read-only (cost-asserts (n uint))
    (runtime u1000))

(define-read-only (cost-map (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-filter (n uint))
    (runtime u1000))

(define-read-only (cost-len (n uint))
    (runtime u1000))

(define-read-only (cost-element-at (n uint))
    (runtime u1000))

(define-read-only (cost-index-of (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-fold (n uint))
    (runtime u1000))

(define-read-only (cost-list-cons (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-type-parse-step (n uint))
    (runtime u1000))

(define-read-only (cost-data-hash-cost (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-tuple-get (n uint))
    (runtime (nlogn n u1000 u1000)))

(define-read-only (cost-tuple-merge (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-tuple-cons (n uint))
    (runtime (nlogn n u1000 u1000)))

(define-read-only (cost-add (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-sub (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-mul (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-div (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-geq (n uint))
    (runtime u1000))

(define-read-only (cost-leq (n uint))
    (runtime u1000))

(define-read-only (cost-le (n uint))
    (runtime u1000))

(define-read-only (cost-ge  (n uint))
    (runtime u1000))

(define-read-only (cost-int-cast (n uint))
    (runtime u1000))

(define-read-only (cost-mod (n uint))
    (runtime u1000))

(define-read-only (cost-pow (n uint))
    (runtime u1000))

(define-read-only (cost-sqrti (n uint))
    (runtime u1000))

(define-read-only (cost-log2 (n uint))
    (runtime u1000))

(define-read-only (cost-xor (n uint))
    (runtime u1000))

(define-read-only (cost-not (n uint))
    (runtime u1000))

(define-read-only (cost-eq (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-begin (n uint))
    (runtime u1000))

(define-read-only (cost-hash160 (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-sha256 (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-sha512 (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-sha512t256 (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-keccak256 (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-secp256k1recover (n uint))
    (runtime u1000))

(define-read-only (cost-secp256k1verify (n uint))
    (runtime u1000))

(define-read-only (cost-print (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-some-cons (n uint))
    (runtime u1000))

(define-read-only (cost-ok-cons (n uint))
    (runtime u1000))

(define-read-only (cost-err-cons (n uint))
    (runtime u1000))

(define-read-only (cost-default-to (n uint))
    (runtime u1000))

(define-read-only (cost-unwrap-ret (n uint))
    (runtime u1000))

(define-read-only (cost-unwrap-err-or-ret (n uint))
    (runtime u1000))

(define-read-only (cost-is-okay (n uint))
    (runtime u1000))

(define-read-only (cost-is-none (n uint))
    (runtime u1000))

(define-read-only (cost-is-err (n uint))
    (runtime u1000))

(define-read-only (cost-is-some (n uint))
    (runtime u1000))

(define-read-only (cost-unwrap (n uint))
    (runtime u1000))

(define-read-only (cost-unwrap-err (n uint))
    (runtime u1000))

(define-read-only (cost-try-ret (n uint))
    (runtime u1000))

(define-read-only (cost-match (n uint))
    (runtime u1000))

(define-read-only (cost-or (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-and (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-append (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-concat (n uint))
    (runtime (linear n u1000 u1000)))

(define-read-only (cost-as-max-len (n uint))
    (runtime u1000))

(define-read-only (cost-contract-call (n uint))
    (runtime u1000))

(define-read-only (cost-contract-of (n uint))
    (runtime u1000))

(define-read-only (cost-principal-of (n uint))
    (runtime u1000))

(define-read-only (cost-at-block (n uint))
    {
        runtime: u1000,
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-load-contract (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u0,
        write-count: u0,
        ;; set to 3 because of the associated metadata loads
        read-count: u3,
        read-length: (linear n u1 u1)
    })

(define-read-only (cost-create-map (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u1,
        read-count: u0,
        read-length: u0
    })

(define-read-only (cost-create-var (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u2,
        read-count: u0,
        read-length: u0
    })

(define-read-only (cost-create-nft (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u1,
        read-count: u0,
        read-length: u0
    })

(define-read-only (cost-create-ft (n uint))
    {
        runtime: u1000,
        write-length: u1,
        write-count: u2,
        read-count: u0,
        read-length: u0
    })

(define-read-only (cost-fetch-entry (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: (linear n u1 u1)
    })

(define-read-only (cost-set-entry (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u1,
        read-count: u1,
        read-length: u0
    })

(define-read-only (cost-fetch-var (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: (linear n u1 u1)
    })

(define-read-only (cost-set-var (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u1,
        read-count: u1,
        read-length: u0
    })

(define-read-only (cost-contract-storage (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: (linear n u1 u1),
        write-count: u1,
        read-count: u0,
        read-length: u0
    })

(define-read-only (cost-block-info (n uint))
    {
        runtime: u1000,
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-stx-balance (n uint))
    {
        runtime: u1000,
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-stx-transfer (n uint))
    {
        runtime: u1000,
        write-length: u1,
        write-count: u1,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-ft-mint (n uint))
    {
        runtime: u1000,
        write-length: u1,
        write-count: u2,
        read-count: u2,
        read-length: u1
    })

(define-read-only (cost-ft-transfer (n uint))
    {
        runtime: u1000,
        write-length: u1,
        write-count: u2,
        read-count: u2,
        read-length: u1
    })

(define-read-only (cost-ft-balance (n uint))
    {
        runtime: u1000,
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-nft-mint (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u1,
        write-count: u1,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-nft-transfer (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u1,
        write-count: u1,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-nft-owner (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-ft-get-supply (n uint))
    {
        runtime: u1000,
        write-length: u0,
        write-count: u0,
        read-count: u1,
        read-length: u1
    })

(define-read-only (cost-ft-burn (n uint))
    {
        runtime: u1000,
        write-length: u1,
        write-count: u2,
        read-count: u2,
        read-length: u1
    })

(define-read-only (cost-nft-burn (n uint))
    {
        runtime: (linear n u1000 u1000),
        write-length: u1,
        write-count: u1,
        read-count: u1,
        read-length: u1
    })

(define-read-only (poison-microblock (n uint))
    {
        runtime: u1000,
        write-length: u1,
        write-count: u1,
        read-count: u1, 
        read-length: u1
    })

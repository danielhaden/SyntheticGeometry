#lang racket

(provide all-defined-out)

(require math)

(define (theta)
  (sinh (/ 1 (3root2))))

(define (degrees rad)
  (* rad (/ 180 pi)))

(define (base height)
  (/ (* 2 height) (tan (theta))))

(define (height base)
  (* (half base) (tan (theta))))

(define (3root2)
  (expt 2 (/ 1 3)))

(define (root2)
  (expt 2 (/ 1 2)))

(define (half val)
  (/ val 2))

(define (hypoteneuse a b)
  (expt (+ (expt a 2) (expt b 2)) (/ 1 2)))

(define (side_length a h)
  (expt (- (expt h 2) (expt a 2)) (/ 1 2)))

(define (edge base)
  (hypoteneuse (* (root2) (half base)) (height base)))

(define (apothem base)
  (* (3root2) (height base)))

(define (phi)
  (tanh (/ (apothem 1) (half 1))))
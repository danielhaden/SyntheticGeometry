#lang racket
(require racket/gui)

(define width 600)
(define height 700)

; A frame containing a single canvas
(define top-frame #f)
(define top-canvas #f)

(define dc #f) ; drawing context for the canvas

(define my-canvas%
  (class canvas%
    (define/override (on-paint)   ; repaint (exposed or resized)
      (define dc (send this get-dc))
      (send this suspend-flush)
      (send this resume-flush))
    (super-new)))

;; PENS
(define no-pen (make-object pen% "BLACK" 1 'transparent))
(define no-brush (make-object brush% "BLACK" 'transparent))
(define blue-brush (make-object brush% "BLUE" 'solid))
(define yellow-brush (make-object brush% "YELLOW" 'solid))
(define red-pen (make-object pen% "RED" 2 'solid))

(define frame (new frame%
                   [label "Sacred Geometry"]
                   [min-width width]
                   [min-height height]))

(define canvas (new my-canvas%
                      [parent     frame]
                      [min-width  width]
                      [min-height height]))

(set! dc (send canvas get-dc))

(define (add-circle draw-context)
  (send draw-context set-pen red-pen)
  (send draw-context set-brush no-brush)
  (send draw-context draw-ellipse 1 1 300 300))

(define add-circle-btn (new button%
                    [parent frame]
                    [label "Add Circle"]
                    [callback (lambda (button event)
                                (add-circle dc))]))

(define (start-gui)
  (set! top-frame frame) 
  (set! top-canvas canvas)  
  (send frame show #t))

(start-gui)
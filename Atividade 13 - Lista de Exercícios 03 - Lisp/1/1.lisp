; Crie uma estrutura de dados para pontos 2D, a qual deve possuir os campos x e y.

(defstruct ponto2D
    x
    y
)

; Crie uma função distancia (a b), a qual recebe dois pontos como parâmetro de deve retornar a
; distância entre eles

(defun distancia (p1 p2)
    (sqrt (+
        (* (- (ponto2D-x p1) (ponto2D-x p2)) (- (ponto2D-x p1) (ponto2D-x p2)))
        (* (- (ponto2D-y p1) (ponto2D-y p2)) (- (ponto2D-y p1) (ponto2D-y p2)))
    ))
)

; Crie uma função colineares (a b c), a qual recebe três pontos como parâmetro de deve retornar
; se eles são colineares ou não. DICA: os três pontos serão colineares se o determinante de suas
; coordenadas for igual a 0.

(defun colineares (p1 p2 p3)
    (= 0 (- (- (- (+ (+ (* (ponto2D-x p1) (ponto2D-y p2)) (* (ponto2D-y p1) (ponto2D-x p3))) (* (ponto2D-x p2) (ponto2D-y p3))) (* (ponto2D-x p1) (ponto2D-y p3))) (* (ponto2D-y p1) (ponto2D-x p2))) (* (ponto2D-y p2) (ponto2D-x p3))))
)

; Crie uma função formaTriangulo (a b c), a qual recebe três pontos como parâmetro de deve retor-
; nar se eles podem ser usados para formar um triângulo.

(defun formaTriangulo (p1 p2 p3)
    (setq A (distancia p1 p2))
    (setq B (distancia p2 p3))
    (setq C (distancia p3 p1))
    (and (< (abs (- A B)) C)
        (and (< (abs (- B C)) A)
        (and (< (abs (- A C)) B)
        (and (> (+ A B) C)
        (and (> (+ B C) A)
        (> (+ C A) B))))))
)

(defun main ()
    (setq p1
        (make-ponto2D
            :x 1
            :y 2
    ))
    (setq p2
        (make-ponto2D
            :x 6
            :y 2
    ))
    (setq p3
        (make-ponto2D
            :x 2
            :y 4
    ))
    (setq p4
        (make-ponto2D
            :x 3
            :y 6
    ))
    (write-line (write-to-string (distancia p1 p2)))
    (write-line (write-to-string (distancia p2 p3)))
    (write-line (write-to-string (colineares p1 p2 p3)))
    (write-line (write-to-string (colineares p1 p3 p4)))
    (write-line (write-to-string (formaTriangulo p1 p3 p4)))
    (write-line (write-to-string (formaTriangulo p1 p2 p4)))
)

(main)

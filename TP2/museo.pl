llamar_bomberos :- fuego.
fuego :- humo.
fuego :- alarma_incendio_activada.
fuego :- calor_intenso, noche.
llamar_policia :- llamar_bomberos.
llamar_policia :- ladrones.
ladrones :- movimiento, cerrado.
movimiento :- sensor_mov_salon1.
movimiento :- sensor_mov_salon2.
movimiento :- sensor_mov_salon3.
movimiento :- sensor_mov_salon4.
movimiento :- sensor_mov_salon5.
sensor_mov_salon1 :- salon1_sensor_a; salon1_sensor_b.
sensor_mov_salon2 :- salon2_sensor_a; salon2_sensor_b.
sensor_mov_salon3 :- salon3_sensor_a; salon3_sensor_b.
sensor_mov_salon4 :- salon4_sensor_a, salon4_sensor_b.
sensor_mov_salon5 :- salon5_sensor_a, salon5_sensor_b.

llamar_guardia :- cerrado, ventana_abierta.
activar_grupo_electrogeno :- corte_de_luz.
cerrado:- domingo.


# Godot-notes

|Skeleton3D|
|----------|
**Skeleton3D** proporciona una interfaz para gestionar una jerarquía de huesos, incluyendo pose, reposo y animación (ver Animación). También puede utilizar la física ragdoll. La transformación global de un hueso con respecto al esqueleto viene determinada por la pose del hueso. El reposo del hueso define la transformación inicial de la pose del hueso. Nótese que «pose global» se refiere a la transformación global del hueso con respecto al esqueleto, por lo que no es la transformación global del hueso.
**Funciones Claves:**
**add_bone(name):** Crea un nuevo hueso con un nombre específico.
**set_bone_rest(bone_idx, transform):** Establece la transformación de reposo para el hueso, es decir, la posición inicial de ese hueso.
**get_bone_name(bone_idx):** Obtiene el nombre del hueso.
**get_bone_global_pose(bone_idx):** Devuelve la transformación global de un hueso, es decir, su posición, rotación y escala en el mundo.

|Mesh instance|
|-------------|
**Meshinstance3d** es un nodo que toma un recurso Mesh y lo añade al escenario actual creando una instancia del mismo. Esta es la clase más utilizada para renderizar geometría 3D y se puede utilizar para crear instancias de una única malla en varios escenarios, lo que permite reutilizar la geometría y ahorrar recursos. Cuando una malla tiene que ser instanciada más de miles de veces a poca distancia, considere el uso de un Multimesh en un Multimeshinstance3D en su lugar.
**Funciones clave:**
**transform.origin:** La posición de la malla en el espacio.
**transform.basis:** La rotación y escala de la malla en el espacio.

|Transform3D|
|-----------|
Se utiliza para definir la posición, rotación y escala de un nodo en 3D. Es esencial para mover y rotar las partes del cuerpo en un esqueleto.

# Godot-notes

|Skeleton3D|
|----------|
**Skeleton3D** proporciona una interfaz para gestionar una jerarquía de huesos, incluyendo pose, reposo y animación (ver Animación). También puede utilizar la física ragdoll. La transformación global de un hueso con respecto al esqueleto viene determinada por la pose del hueso. El reposo del hueso define la transformación inicial de la pose del hueso. Nótese que «pose global» se refiere a la transformación global del hueso con respecto al esqueleto, por lo que no es la transformación global del hueso.

|Mesh instance|
|-------------|
**Meshinstance3d** es un nodo que toma un recurso Mesh y lo añade al escenario actual creando una instancia del mismo. Esta es la clase más utilizada para renderizar geometría 3D y se puede utilizar para crear instancias de una única malla en varios escenarios, lo que permite reutilizar la geometría y ahorrar recursos. Cuando una malla tiene que ser instanciada más de miles de veces a poca distancia, considere el uso de un Multimesh en un Multimeshinstance3D en su lugar.

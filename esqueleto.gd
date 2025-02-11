extends Skeleton3D

# Variables para almacenar las instancias de mallas de cada parte del cuerpo.
var mesh_head: MeshInstance3D
var mesh_torso: MeshInstance3D
var mesh_left_leg: MeshInstance3D
var mesh_right_leg: MeshInstance3D
var mesh_left_arm: MeshInstance3D
var mesh_right_arm: MeshInstance3D

# Esta función se ejecuta al iniciar el script.
func _ready():
	print("Inicio del script")

	# Buscar los MeshInstance3D en el nodo padre "Humano".
	var humano = get_parent()  # Obtiene el nodo padre
	if humano == null:
		print("ERROR: No se encontró el nodo padre 'Humano'.")  # Error si no encuentra el nodo
		return

	# Obtiene las mallas de cada parte del cuerpo desde el nodo padre.
	mesh_head = humano.get_node_or_null("Cabeza")
	mesh_torso = humano.get_node_or_null("Torso")
	mesh_left_leg = humano.get_node_or_null("Pierna Izquierda")
	mesh_right_leg = humano.get_node_or_null("Pierna Derecha")
	mesh_left_arm = humano.get_node_or_null("Brazo Izquierdo")
	mesh_right_arm = humano.get_node_or_null("Brazo Derecho")

	# Verifica si se encontraron todas las mallas.
	if mesh_head == null or mesh_torso == null or mesh_left_leg == null or mesh_right_leg == null or mesh_left_arm == null or mesh_right_arm == null:
		print("ERROR: Uno o más nodos MeshInstance3D no fueron encontrados en 'Humano'. Verifica los nombres en el editor.")
		return  # Detiene la ejecución si hay error

	# Crear huesos para las diferentes partes del cuerpo.
	var bone_idx_root = add_bone("Hueso_Raíz")  # Crea el hueso raíz
	set_bone_rest(bone_idx_root, Transform3D())  # Configura la transformación del hueso raíz.

	# Crear hueso para la cabeza y asignarle la posición.
	var bone_idx_head = add_bone("Hueso_Cabeza")
	set_bone_parent(bone_idx_head, bone_idx_root)  # El hueso cabeza tiene como padre al hueso raíz.
	set_bone_rest(bone_idx_head, Transform3D().translated(Vector3(0, 2, 0)))  # Traslada la cabeza.

	# Crear hueso para el brazo izquierdo y asignarle la posición.
	var bone_idx_left_arm = add_bone("Hueso_Brazo_Izquierdo")
	set_bone_parent(bone_idx_left_arm, bone_idx_root)  # El brazo izquierdo depende del hueso raíz.
	set_bone_rest(bone_idx_left_arm, Transform3D().translated(Vector3(-1, 1, 0)))  # Traslada el brazo izquierdo.

	# Crear hueso para el brazo derecho y asignarle la posición.
	var bone_idx_right_arm = add_bone("Hueso_Brazo_Derecho")
	set_bone_parent(bone_idx_right_arm, bone_idx_root)  # El brazo derecho depende del hueso raíz.
	set_bone_rest(bone_idx_right_arm, Transform3D().translated(Vector3(1, 1, 0)))  # Traslada el brazo derecho.

	# Crear hueso para la pierna izquierda y asignarle la posición.
	var bone_idx_left_leg = add_bone("Hueso_Pierna_Izquierda")
	set_bone_parent(bone_idx_left_leg, bone_idx_root)  # La pierna izquierda depende del hueso raíz.
	set_bone_rest(bone_idx_left_leg, Transform3D().translated(Vector3(-0.5, -1, 0)))  # Traslada la pierna izquierda.

	# Crear hueso para la pierna derecha y asignarle la posición.
	var bone_idx_right_leg = add_bone("Hueso_Pierna_Derecha")
	set_bone_parent(bone_idx_right_leg, bone_idx_root)  # La pierna derecha depende del hueso raíz.
	set_bone_rest(bone_idx_right_leg, Transform3D().translated(Vector3(0.5, -1, 0)))  # Traslada la pierna derecha.

	# Imprimir los nombres de los huesos creados para verificar.
	print("Huesos creados:")
	for i in get_bone_count():  # Recorre todos los huesos y los imprime.
		print("Hueso", i, ": ", get_bone_name(i))
	# Asignar transformaciones de huesos a las mallas.
	apply_bone_transform(mesh_head, bone_idx_head)
	apply_bone_transform(mesh_torso, bone_idx_root)
	apply_bone_transform(mesh_left_leg, bone_idx_left_leg)
	apply_bone_transform(mesh_right_leg, bone_idx_right_leg)
	apply_bone_transform(mesh_left_arm, bone_idx_left_arm)
	apply_bone_transform(mesh_right_arm, bone_idx_right_arm)

# Función auxiliar para asignar transformaciones de huesos a las mallas.
func apply_bone_transform(mesh: MeshInstance3D, bone_idx: int):
	var bone_transform = get_bone_global_pose(bone_idx)  # Obtiene la transformación global del hueso.
	mesh.transform.origin = bone_transform.origin  # Aplica la posición del hueso a la malla.
	mesh.transform.basis = bone_transform.basis  # Aplica la rotación y escala del hueso a la malla.

extends Skeleton3D

# Diccionario para almacenar las instancias de mallas de cada parte del cuerpo.
var body_parts = {
	"Head": null,      # Coincide con "Head" en la escena.
	"Torso": null,     # Coincide con "Torso" en la escena.
	"LeftArm": null,   # Coincide con "LeftArm" en la escena.
	"RightArm": null,  # Coincide con "RightArm" en la escena.
	"LeftLeg": null,   # Coincide con "LeftLeg" en la escena.
	"RightLeg": null   # Coincide con "RightLeg" en la escena.
}

# Esta función se ejecuta al iniciar el script.
func _ready():
	print("Inicio del script")

	# Buscar los MeshInstance3D en el nodo padre "Humano".
	var humano = get_parent()  # Obtiene el nodo padre
	if humano == null:
		print("ERROR: No se encontró el nodo padre 'Humano'.")  # Error si no encuentra el nodo
		return

	# Obtiene las mallas de cada parte del cuerpo desde el nodo padre.
	for part in body_parts.keys():
		body_parts[part] = humano.get_node_or_null(part)  # Busca el nodo por nombre.
		if body_parts[part] == null:
			print("ERROR: No se encontró el nodo MeshInstance3D para", part)
			return

	# Si llegamos aquí, todos los nodos fueron encontrados.
	print("Todos los nodos MeshInstance3D fueron encontrados correctamente.")

	# Crear huesos para las diferentes partes del cuerpo.
	var bone_idx_root = create_bone("RootBone", Transform3D())
	var bone_idx_head = create_bone("HeadBone", Transform3D().translated(Vector3(0, 2, 0)), bone_idx_root)
	var bone_idx_left_arm = create_bone("LeftArmBone", Transform3D().translated(Vector3(-1, 1, 0)), bone_idx_root)
	var bone_idx_right_arm = create_bone("RightArmBone", Transform3D().translated(Vector3(1, 1, 0)), bone_idx_root)
	var bone_idx_left_leg = create_bone("LeftLegBone", Transform3D().translated(Vector3(-0.5, -1, 0)), bone_idx_root)
	var bone_idx_right_leg = create_bone("RightLegBone", Transform3D().translated(Vector3(0.5, -1, 0)), bone_idx_root)

	# Imprimir los nombres de los huesos creados para verificar.
	print("Huesos creados:")
	for i in get_bone_count():  # Recorre todos los huesos y los imprime.
		print("Hueso", i, ": ", get_bone_name(i))

# Función auxiliar para crear huesos.
func create_bone(name: String, rest_transform: Transform3D, parent_idx: int = -1) -> int:
	var bone_idx = add_bone(name)
	set_bone_rest(bone_idx, rest_transform)
	if parent_idx != -1:
		set_bone_parent(bone_idx, parent_idx)
	return bone_idx  # Corregido: "retur" -> "return"

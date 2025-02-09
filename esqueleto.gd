extends Skeleton3D

@onready var skeleton = $Skeleton3D
@onready var mesh = $MeshInstance3D

func _ready():
	print("Inicio del script")  # 👈 Esto nos dice si el script se ejecuta
	
	var bone_idx = add_bone("Hueso raíz")
	set_bone_rest(bone_idx, Transform3D().translated(Vector3(0, 0, 0)))

#Crear un segundo hueso como hijo del primero
	var bone2_idx = add_bone("Hueso_Cabeza")
	set_bone_parent(bone2_idx, bone_idx) #Hueso_Cabeza será hijo de Hueso_Raiz
	set_bone_rest(bone2_idx, Transform3D().translated(Vector3(0, 1, 0))) # Posicionamos arriba

#Imprimir la lista de huesos en la consola
	for i in get_bone_count():
		print("Hueso", i, "; ", get_bone_name(i))

	var bone_transform = get_bone_global_pose(bone_idx)
	mesh.global_transform.origin = bone_transform.origin
	
# Ajustar la escala si deseo que el cubo se vea como un hueso
	mesh.scale =Vector3(0.3, 1.0, 0.3)

	mesh.global_transform.basis = bone_transform.basis

	var bone2_transform = get_bone_global_pose(bone_idx)
	mesh.global_transform.origin = bone2_transform.origin
	mesh.global_transform.basis = bone2_transform.basis

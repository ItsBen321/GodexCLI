extends Window

@onready var explainer_label: RichTextLabel = %explainer_label
@onready var old_script_edit: CodeEdit = %old_script_edit
@onready var new_script_edit: CodeEdit = %new_script_edit
@onready var cancel_button: Button = %cancel_button
@onready var confirm_button: Button = %confirm_button

signal confirm

func _ready():
	confirm_button.pressed.connect(_confirm)
	

func _confirm():
	confirm.emit(new_script_edit.text)
	queue_free()
	
	
func _on_close_requested() -> void:
	queue_free()


func setup(explainer: String, old_script: String, new_script: String):
	explainer_label.text = explainer
	old_script_edit.text = old_script
	new_script_edit.text = new_script
	new_script_edit.grab_click_focus()

extends PanelContainer

@export var tabC : TabContainer

@export var selected: bool:
  set(b):
    selected=b
    if is_node_ready() and tabC:
      for node in tabC.get_children():
        if node.name == name and tabC.current_tab==node.get_index():
          modulate == Color.WHITE
        else:
          modulate == Color.DIM_GRAY

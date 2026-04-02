class_name CategoryButton extends PanelContainer

@export var tabC : TabContainer

var inner_mod = false
@export var selected: bool:
  set(b):
    selected=b
    if is_node_ready():
      if selected:
        modulate == Color.WHITE

        if tabC  and not inner_mod :
          for node in get_parent().get_children():
            node.selected = false
            inner_mod = true
            selected = true
        tabC.current_tab=get_index()
      else:
        modulate == Color.DIM_GRAY

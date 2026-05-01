
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = friction_exp
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .friction_exp.steel  &
   adams_id = 1  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .friction_exp.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .friction_exp.ground.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .friction_exp.ground.MARKER_4  &
   adams_id = 4  &
   location = 750.0, 50.0, 0.0  &
   orientation = 120.0d, 140.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .friction_exp.ground  &
   material_type = .friction_exp.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .friction_exp.ground.BOX_1  &
   adams_id = 1  &
   corner_marker = .friction_exp.ground.MARKER_1  &
   diag_corner_coords = 1000.0, 50.0, 200.0
!
part attributes  &
   part_name = .friction_exp.ground  &
   name_visibility = off
!
!----------------------------------- crate ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .friction_exp.ground
!
part create rigid_body name_and_position  &
   part_name = .friction_exp.crate  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .friction_exp.crate
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .friction_exp.crate.MARKER_2  &
   adams_id = 2  &
   location = 750.0, 50.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .friction_exp.crate.cm  &
   adams_id = 5  &
   location = 850.0, 100.0, 100.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .friction_exp.crate.MARKER_3  &
   adams_id = 3  &
   location = 750.0, 50.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .friction_exp.crate  &
   material_type = .friction_exp.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .friction_exp.crate.BOX_2  &
   adams_id = 2  &
   corner_marker = .friction_exp.crate.MARKER_2  &
   diag_corner_coords = 200.0, 100.0, 200.0
!
part attributes  &
   part_name = .friction_exp.crate  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint translational  &
   joint_name = .friction_exp.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .friction_exp.crate.MARKER_3  &
   j_marker_name = .friction_exp.ground.MARKER_4
!
constraint attributes  &
   constraint_name = .friction_exp.JOINT_1  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create element_like friction  &
   friction_name = .friction_exp.FRICTION_1  &
   adams_id = 1  &
   joint_name = .friction_exp.JOINT_1  &
   mu_static = 0.3  &
   mu_dynamic = 0.25  &
   reaction_arm = 1.0  &
   initial_overlap = 1000.0  &
   formulation = original  &
   stiction_transition_velocity = 0.1  &
   transition_velocity_coefficient = 1.5  &
   max_stiction_deformation = 1.0E-02  &
   friction_force_preload = 0.0  &
   overlap_delta = constant  &
   effect = all  &
   preload = on  &
   reaction_force = on  &
   torsional_moment = off  &
   bending_moment = off  &
   inactive_during_static = off
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .friction_exp.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=1.0 number_of_steps=50 model_name=.friction_exp"
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .friction_exp.crate_MEA_1  &
   from_first = no  &
   object = .friction_exp.crate  &
   coordinate_rframe = .friction_exp.ground.MARKER_1  &
   characteristic = cm_acceleration  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .friction_exp.crate_MEA_1  &
   color = WHITE
!
measure create object  &
   measure_name = .friction_exp.crate_MEA_2  &
   from_first = no  &
   object = .friction_exp.crate  &
   coordinate_rframe = .friction_exp.ground.MARKER_1  &
   characteristic = cm_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .friction_exp.crate_MEA_2  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .friction_exp.DV_1  &
   units = "no_units"  &
   range = 0.0, 30.0  &
   use_allowed_values = no  &
   real_value = 0.0
!
!---------------------------- Function definitions ----------------------------!
!
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .friction_exp.ground.MARKER_1  &
   orientation =   &
      (.friction_exp.DV_1),  &
      0.0,  &
      0.0
!
geometry modify shape block  &
   block_name = .friction_exp.ground.BOX_1  &
   diag_corner_coords =   &
      (100.0cm),  &
      (5.0cm),  &
      (20.0cm)
!
marker modify  &
   marker_name = .friction_exp.ground.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .friction_exp.crate.MARKER_2))  &
   orientation =   &
      (LOC_RELATIVE_TO({90.0, 90.0, 0.0}, .friction_exp.crate.MARKER_2))
!
geometry modify shape block  &
   block_name = .friction_exp.crate.BOX_2  &
   diag_corner_coords =   &
      (20.0cm),  &
      (10.0cm),  &
      (20.0cm)
!
part modify rigid_body name_and_position  &
   part_name = .friction_exp.crate  &
   orientation =   &
      (.friction_exp.DV_1),  &
      0.0,  &
      0.0
!
material modify  &
   material_name = .friction_exp.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = friction_exp

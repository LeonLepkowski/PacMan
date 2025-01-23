open Raylib

let tile_size = 30

(* let map = [|
  [|1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1|];
  [|1; 2; 2; 2; 2; 2; 1; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 1; 2; 2; 2; 2; 2; 1|];
  [|1; 2; 1; 1; 1; 2; 1; 2; 1; 1; 1; 2; 1; 1; 1; 1; 1; 1; 1; 2; 1; 1; 1; 2; 1; 2; 2; 2; 2; 2; 1|];
  [|1; 2; 1; 2; 2; 2; 1; 2; 1; 2; 2; 2; 2; 2; 2; 1; 2; 2; 2; 2; 2; 2; 1; 2; 1; 2; 2; 2; 2; 2; 1|];
  [|1; 2; 2; 2; 1; 1; 1; 2; 1; 2; 1; 1; 1; 1; 2; 1; 2; 1; 1; 1; 1; 2; 2; 2; 1; 1; 1; 2; 2; 2; 1|];
  [|1; 1; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 2; 2; 2; 2; 2; 1; 2; 2; 1; 2; 1; 2; 2; 2; 1; 2; 1; 1; 1|];
  [|1; 2; 2; 2; 1; 2; 1; 1; 1; 2; 1; 2; 1; 1; 1; 0; 1; 1; 1; 2; 1; 2; 1; 1; 1; 2; 1; 2; 2; 2; 1|];
  [|1; 2; 1; 1; 1; 2; 2; 2; 2; 2; 2; 2; 1; 0; 0; 0; 0; 0; 1; 2; 2; 2; 2; 2; 2; 2; 1; 1; 1; 2; 1|];
  [|1; 2; 2; 2; 1; 2; 1; 1; 1; 1; 1; 2; 1; 1; 1; 1; 1; 1; 1; 2; 1; 2; 1; 1; 1; 2; 1; 2; 2; 2; 1|];
  [|1; 1; 1; 2; 1; 2; 2; 2; 1; 2; 1; 2; 2; 2; 2; 1; 2; 2; 2; 2; 1; 2; 1; 2; 2; 2; 1; 2; 1; 1; 1|];
  [|1; 2; 2; 2; 1; 1; 1; 2; 1; 2; 1; 1; 1; 1; 2; 1; 2; 1; 1; 1; 1; 2; 1; 2; 1; 1; 1; 2; 2; 2; 1|];
  [|1; 2; 2; 2; 2; 2; 2; 2; 1; 2; 2; 2; 2; 2; 2; 1; 2; 2; 2; 2; 2; 2; 1; 2; 2; 2; 2; 2; 1; 2; 1|];
  [|1; 2; 2; 2; 2; 2; 1; 2; 1; 1; 1; 2; 1; 1; 1; 1; 1; 1; 1; 2; 1; 1; 1; 2; 1; 2; 1; 1; 1; 2; 1|];
  [|1; 2; 2; 2; 2; 2; 1; 2; 2; 2; 2; 2; 2; 2; 2; 0; 2; 2; 2; 2; 1; 2; 2; 2; 1; 2; 2; 2; 2; 2; 1|];
  [|1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1|];
|] *)

let map = [|
  (* [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0|]; *)
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0|];
  [|1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1|];
  [|1;2;2;2;2;2;2;2;2;2;2;2;2;1;1;2;2;2;2;2;2;2;2;2;2;2;2;1|];
  [|1;2;1;1;1;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;2;1;1;1;1;2;1|];
  [|1;2;1;0;0;1;2;1;0;0;0;1;2;1;1;2;1;0;0;0;1;2;1;0;0;1;2;1|];
  [|1;2;1;1;1;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;2;1;1;1;1;2;1|];
  [|1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;1|];
  [|1;2;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;2;1|];
  [|1;2;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;2;1|];
  [|1;2;2;2;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;2;2;1|];
  [|1;1;1;1;1;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;2;1;1;1;1;1;1|];
  [|0;0;0;0;0;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;2;1;0;0;0;0;0|];
  [|0;0;0;0;0;1;2;1;1;2;2;2;2;2;2;2;2;2;2;1;1;2;1;0;0;0;0;0|];
  [|0;0;0;0;0;1;2;1;1;2;1;1;1;0;0;1;1;1;2;1;1;2;1;0;0;0;0;0|];
  [|1;1;1;1;1;1;2;1;1;2;1;0;0;0;0;0;0;1;2;1;1;2;1;1;1;1;1;1|];
  [|0;2;2;2;2;2;2;2;2;2;1;0;0;0;0;0;0;1;2;2;2;2;2;2;2;2;2;0|];
  [|1;1;1;1;1;1;2;1;1;2;1;0;0;0;0;0;0;1;2;1;1;2;1;1;1;1;1;1|];
  [|0;0;0;0;0;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;0;0;0;0;0|];
  [|0;0;0;0;0;1;2;1;1;2;2;2;2;2;2;2;2;2;2;1;1;2;1;0;0;0;0;0|];
  [|0;0;0;0;0;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;0;0;0;0;0|];
  [|1;1;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;1;1|];
  [|1;2;2;2;2;2;2;2;2;2;2;2;2;1;1;2;2;2;2;2;2;2;2;2;2;2;2;1|];
  [|1;2;1;1;1;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;2;1;1;1;1;2;1|];
  [|1;2;1;1;1;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;2;1;1;1;1;2;1|];
  [|1;2;2;2;1;1;2;2;2;2;2;2;2;0;0;2;2;2;2;2;2;2;1;1;2;2;2;1|];
  [|1;1;1;2;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;2;1;1;1|];
  [|1;1;1;2;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;2;1;1;1|];
  [|1;2;2;2;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;2;2;1|];
  [|1;2;1;1;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;1;1;2;1|];
  [|1;2;1;1;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;1;1;2;1|];
  [|1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;1|];
  [|1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0|];
  (* [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0|]; *)
|]





let screen_width = Array.length map.(0) * tile_size
let screen_height = Array.length map * tile_size

let pacman_x = ref (13 * tile_size)  (* Position in pixels *)
let pacman_y = ref (24 * tile_size)  (* Position in pixels *)
let direction = ref (0, 0)  (* Initial direction *)
let next_direction = ref (0, 0)  (* Initial next direction *)
let target_cell = ref (15, 13)  (* Target grid position *)
let game_end = ref false
let speed = 2  (* Pixels per frame *)
let score = ref 0

type ghost = {
  mutable x: int;        (* Position in pixels *)
  mutable y: int;
  mutable direction: int * int; (* Direction vector *)
  color: Color.t;        (* Ghost color, can be ignored if using textures *)
  texture: Texture.t;    (* Ghost image texture *)
}


let draw_map () =
  for y = 0 to Array.length map - 1 do
    for x = 0 to Array.length map.(y) - 1 do
      if map.(y).(x) = 1 then
        draw_rectangle (x * tile_size) (y * tile_size) tile_size tile_size Color.darkblue
      else if map.(y).(x) = 2 then
        draw_circle (x * tile_size + tile_size / 2) (y * tile_size + tile_size / 2) (float_of_int (tile_size / 8)) Color.white
      else
        draw_rectangle (x * tile_size) (y * tile_size) tile_size tile_size Color.black
    done
  done

  let draw_sweets () =
    for y = 0 to Array.length map - 1 do
      for x = 0 to Array.length map.(y) - 1 do
        if map.(y).(x) = 2 then
          draw_circle (x * tile_size + tile_size / 2) (y * tile_size + tile_size / 2) (float_of_int (tile_size / 8)) Color.white
    done
  done

let move_pacman () =
  let grid_x = !pacman_x / tile_size in
  let grid_y = !pacman_y / tile_size in
  if (!pacman_x mod tile_size = 0 && !pacman_y mod tile_size = 0) then (
    (* Update target_cell if perfectly on a cell *)
    if map.(grid_y).(grid_x) = 2 then (
      map.(grid_y).(grid_x) <- 0;
      incr score;
    );

    (* Check if the next direction is possible *)
    let next_x = grid_x + fst !next_direction in
    let next_y = grid_y + snd !next_direction in
    if map.(next_y).(next_x) <> 1 then direction := !next_direction;

    target_cell := (grid_x + fst !direction, grid_y + snd !direction);
    let tx, ty = !target_cell in
    if map.(ty).(tx) = 1 then target_cell := (grid_x, grid_y)  (* Stop at walls *)
  );

  (* Move smoothly towards target_cell *)
  let target_x = fst !target_cell * tile_size in
  let target_y = snd !target_cell * tile_size in
  if !pacman_x < target_x then pacman_x := min (!pacman_x + speed) target_x;
  if !pacman_x > target_x then pacman_x := max (!pacman_x - speed) target_x;
  if !pacman_y < target_y then pacman_y := min (!pacman_y + speed) target_y;
  if !pacman_y > target_y then pacman_y := max (!pacman_y - speed) target_y;

  (* Teleport when going out of bounds *)
  if !pacman_x < 1 then pacman_x := (Array.length map.(0) - 1) * tile_size (* Wrap to the right side *)
  else if !pacman_x >= (Array.length map.(0) - 1) * tile_size then pacman_x := 2 (* Wrap to the left side *)
  
let move_ghost ghost =
  let grid_x = ghost.x / tile_size in
  let grid_y = ghost.y / tile_size in

  if (ghost.x mod tile_size = 0 && ghost.y mod tile_size = 0) then (
    let possible_directions = ref [] in

    (* Reverse direction of the current direction *)
    let reverse_direction = (-fst ghost.direction, -snd ghost.direction) in

    (* Add directions to the list, excluding the reverse direction *)
    if map.(grid_y).(grid_x + 1) <> 1 && (1, 0) <> reverse_direction then
      possible_directions := (1, 0) :: !possible_directions;
    if map.(grid_y).(grid_x - 1) <> 1 && (-1, 0) <> reverse_direction then
      possible_directions := (-1, 0) :: !possible_directions;
    if map.(grid_y + 1).(grid_x) <> 1 && (0, 1) <> reverse_direction then
      possible_directions := (0, 1) :: !possible_directions;
    if map.(grid_y - 1).(grid_x) <> 1 && (0, -1) <> reverse_direction then
      possible_directions := (0, -1) :: !possible_directions;

    (* Choose a new direction if there are possible directions, otherwise reverse direction *)
    if !possible_directions <> [] then
      ghost.direction <- List.nth !possible_directions (Random.int (List.length !possible_directions))
    else
      ghost.direction <- reverse_direction
  );

  (* Update the ghost's position based on its direction *)
  ghost.x <- ghost.x + fst ghost.direction * speed;
  ghost.y <- ghost.y + snd ghost.direction * speed;

  (* Teleport when going out of bounds *)
  if ghost.x < 1 then ghost.x <- (Array.length map.(0) - 2) * tile_size  (* Wrap to the right side *)
  else if ghost.x >= (Array.length map.(0) - 1) * tile_size then ghost.x <- 2  (* Wrap to the left side *)
      
let chase_pacman ghost pacman =
  let grid_x = ghost.x / tile_size in
  let grid_y = ghost.y / tile_size in
  let pacman_x = pacman.x / tile_size in
  let pacman_y = pacman.y / tile_size in

  if (ghost.x mod tile_size = 0 && ghost.y mod tile_size = 0) then (
    let possible_directions = ref [] in

    (* Reverse direction of the current direction *)
    let reverse_direction = (-fst ghost.direction, -snd ghost.direction) in

    (* Add directions to the list, excluding the reverse direction *)
    if map.(grid_y).(grid_x + 1) <> 1 && (1, 0) <> reverse_direction then
      possible_directions := (1, 0) :: !possible_directions;
    if map.(grid_y).(grid_x - 1) <> 1 && (-1, 0) <> reverse_direction then
      possible_directions := (-1, 0) :: !possible_directions;
    if map.(grid_y + 1).(grid_x) <> 1 && (0, 1) <> reverse_direction then
      possible_directions := (0, 1) :: !possible_directions;
    if map.(grid_y - 1).(grid_x) <> 1 && (0, -1) <> reverse_direction then
      possible_directions := (0, -1) :: !possible_directions;

    (* Choose the direction that minimizes distance to Pac-Man *)
    if !possible_directions <> [] then
      let best_direction = 
        List.fold_left (fun best dir ->
          let next_x = grid_x + fst dir in
          let next_y = grid_y + snd dir in
          let distance = abs (next_x - pacman_x) + abs (next_y - pacman_y) in
          match best with
          | None -> Some (dir, distance)
          | Some (_, best_distance) -> 
            if distance < best_distance then Some (dir, distance) else best
        ) None !possible_directions
      in
      ghost.direction <- fst (Option.get best_direction)
    else
      ghost.direction <- reverse_direction
  );

  (* Update the ghost's position based on its direction *)
  ghost.x <- ghost.x + fst ghost.direction * speed;
  ghost.y <- ghost.y + snd ghost.direction * speed;

  (* Teleport when going out of bounds *)
  if ghost.x < 1 then ghost.x <- (Array.length map.(0) - 2) * tile_size  (* Wrap to the right side *)
  else if ghost.x >= (Array.length map.(0) - 1) * tile_size then ghost.x <- 2  (* Wrap to the left side *)  

let ghost_behavior ghost pacman time =
  (* Switch between normal movement and chasing Pac-Man every 7 seconds *)
  let cycle = (time / 7) mod 2 in
  if cycle = 0 then
    move_ghost ghost
  else
    chase_pacman ghost pacman
  

let check_collisions pacman_x pacman_y ghosts =
  Array.exists (fun ghost ->
    let distance_x = abs (pacman_x - ghost.x) in
    let distance_y = abs (pacman_y - ghost.y) in
    distance_x < tile_size / 2 && distance_y < tile_size / 2
  ) ghosts

let draw_ghosts ghosts =
  Array.iter (fun ghost ->
    (* Printf.printf "Drawing ghost at position: (%d, %d)\n%!" ghost.x ghost.y; *)
    draw_texture ghost.texture ghost.x ghost.y Color.white
  ) ghosts

let () =
  Random.self_init ();
  init_window screen_width screen_height "Pac-Man";
  set_target_fps 60;

  (* let pacman_texture = load_texture "pacman.png" in  (* Load the Pac-Man sprite *)
  Printf.printf "Pacman texture loaded: %b\n%!" (Raylib.is_texture_ready pacman_texture); *)

  let background_texture = load_texture "background.png" in  (* Load the background image *)
  Printf.printf "Background texture loaded: %b\n%!" (Raylib.is_texture_ready background_texture);

  let pacman_textures = [|
    load_texture "pac_man_0.png";
    load_texture "pac_man_1.png";
    load_texture "pac_man_2.png";
    load_texture "pac_man_3.png";
    (* load_texture "pac_man_4.png"; *)
  |] in
  
  let ghost_textures = [|
    load_texture "ghost_red.png";
    load_texture "ghost_blue.png";
    load_texture "ghost_pink.png";
    load_texture "ghost_orange.png";
  |] in

  Array.iteri (fun i texture ->
    Printf.printf "Ghost texture %d loaded: %b\n%!" i (is_texture_ready texture)
  ) ghost_textures;

  let ghosts = [|
    { x = 9 * tile_size; y = 12 * tile_size; direction = (0, 1); color = Color.orange; texture = ghost_textures.(3) };
    { x = 9 * tile_size; y = 18 * tile_size; direction = (1, 0); color = Color.red; texture = ghost_textures.(0) };
    { x = 18 * tile_size; y = 12 * tile_size; direction = (-1, 0); color = Color.blue; texture = ghost_textures.(1) };
    { x = 18 * tile_size; y = 18 * tile_size; direction = (0, -1); color = Color.green; texture = ghost_textures.(2) };
  |] in

  let current_frame = ref 0 in
  let frame_time = ref 0.0 in
  let frame_duration = 0.1 in (* Duration of each frame in seconds *)
  let last_update_time = ref (get_time ()) in

  let start_time = get_time () in

  while not (window_should_close ()) do
    if is_key_pressed Key.Right then next_direction := (1, 0);
    if is_key_pressed Key.Left then next_direction := (-1, 0);
    if is_key_pressed Key.Up then next_direction := (0, -1);
    if is_key_pressed Key.Down then next_direction := (0, 1);

    move_pacman ();
    (* Array.iter move_ghost ghosts; *)
    (* Array.iter (fun ghost -> chase_pacman ghost { x = !pacman_x; y = !pacman_y; direction = !direction; color = Color.white; texture = pacman_texture }) ghosts; *)
    Array.iter (fun ghost -> ghost_behavior ghost { x = !pacman_x; y = !pacman_y; direction = !direction; color = Color.white; texture = pacman_textures.(0) } (
      int_of_float (get_time () -. start_time)
    )) ghosts;

    if check_collisions !pacman_x !pacman_y ghosts then (
      print_endline "Game Over!";
      game_end := true;
    );

    let current_time = get_time () in
    let elapsed_time = current_time -. !last_update_time in
    last_update_time := current_time;

    frame_time := !frame_time +. elapsed_time;
    if !frame_time >= frame_duration then (
      frame_time := !frame_time -. frame_duration;
      current_frame := (!current_frame + 1) mod Array.length pacman_textures;
    );
    
    begin_drawing ();
    clear_background Color.black;
    (* draw_map (); *)
    (* Calculate scale factors *)
    let scale_x = float_of_int screen_width /. float_of_int (Texture.width background_texture) in

    (* Draw the background image scaled to fit the screen *)
    draw_texture_ex background_texture (Vector2.create 0.0 0.0) 0.0 scale_x Color.white;
    draw_sweets ();
    
    let pacman_width = Texture.width pacman_textures.(0) in
    let pacman_height = Texture.height pacman_textures.(0) in
    
    (* Calculate rotation angle based on direction *)
    let angle = match !direction with
    | (1, 0) -> 0.0
    | (-1, 0) -> 180.0
    | (0, -1) -> 270.0
    | (0, 1) -> 90.0
    | _ -> 0.0
  in
  
  let position = 
    match !direction with
    | (1, 0) -> Vector2.create (float_of_int !pacman_x) (float_of_int !pacman_y)
    | (-1, 0) -> Vector2.create (float_of_int (!pacman_x + pacman_width)) (float_of_int (!pacman_y + pacman_height))
    | (0, -1) -> Vector2.create (float_of_int !pacman_x) (float_of_int (!pacman_y + pacman_height))
    | (0, 1) -> Vector2.create (float_of_int (!pacman_x + pacman_width)) (float_of_int !pacman_y)
    | _ -> 
      Vector2.create 
      (float_of_int (!pacman_x))  (* Positioning Pacman at pacman_x *)
      (float_of_int (!pacman_y))  (* Positioning Pacman at pacman_y *)
    in

    let pacman_texture = pacman_textures.(!current_frame) in
    
    draw_texture_ex pacman_texture position angle 1.0 Color.white;
    
    draw_ghosts ghosts;
    
    if !game_end then draw_text "GAME" 200 325 150 Color.yellow else ();
    if !game_end then draw_text "OVER" 200 475 150 Color.yellow else ();
    
    draw_text "Pac-Man" (screen_width / 2 - 85) 3 40 Color.yellow;  (* Example of large text *)
    draw_text (Printf.sprintf "Score: %d" !score) 10 5 20 Color.red;
    draw_text (Printf.sprintf "Time: %d" (int_of_float elapsed_time)) 120 5 20 Color.red;
    (* draw_text (Printf.sprintf "Ghost position: (%d, %d)" ghost.x ghost.y) 300 10 20 Color.red; *)
    (* draw_text (Printf.sprintf "Pacman position: (%d, %d)" !pacman_x !pacman_y) 800 20 20 Color.red; *)

    end_drawing ();
  done;

  Array.iter unload_texture ghost_textures;  (* Unload the ghost textures *)
  unload_texture background_texture;
  Array.iter unload_texture pacman_textures;  (* Unload the Pac-Man sprites *)
  close_window ();
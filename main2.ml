open Raylib

let tile_size = 30

let map = [|
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0|];
  [|1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1|];
  [|1;2;2;2;2;2;2;2;2;2;2;2;2;1;1;2;2;2;2;2;2;2;2;2;2;2;2;1|];
  [|1;2;1;1;1;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;3;1;1;1;1;2;1|];
  [|1;2;1;0;0;1;2;1;0;0;0;1;2;1;1;2;1;0;0;0;1;2;1;0;0;1;2;1|];
  [|1;2;1;1;1;1;2;1;1;1;1;1;2;1;1;2;1;1;1;1;1;2;1;1;1;1;2;1|];
  [|1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;1|];
  [|1;2;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;2;1|];
  [|1;2;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;2;1|];
  [|1;2;2;3;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;2;2;1|];
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
  [|1;2;2;2;1;1;2;2;2;2;2;2;2;0;0;2;2;2;2;2;2;2;1;1;3;2;2;1|];
  [|1;1;1;2;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;2;1;1;1|];
  [|1;1;1;2;1;1;2;1;1;2;1;1;1;1;1;1;1;1;2;1;1;2;1;1;2;1;1;1|];
  [|1;2;2;2;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;1;1;2;2;2;2;2;2;1|];
  [|1;2;1;1;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;1;1;2;1|];
  [|1;2;1;1;1;1;1;1;1;1;1;1;2;1;1;2;1;1;1;1;1;1;1;1;1;1;2;1|];
  [|1;3;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;1|];
  [|1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0|];
|]

let screen_width = Array.length map.(0) * tile_size
let screen_height = Array.length map * tile_size

let speed = 2

let time = 5.0

type ghost = {
  x: int;
  y: int;
  direction: int * int;
  color: Color.t;
  texture: Texture.t;
}

type game_state = {
  pacman_x: int;
  pacman_y: int;
  direction: int * int;
  next_direction: int * int;
  target_cell: int * int;
  game_end: bool;
  score: int;
  ghosts: ghost array;
  boost_active: bool;  (* Whether the boost is active *)
  boost_time_left: float;  (* Time left for the boost in seconds *)
  ghost_behavior_timer: float;  (* Time left for the ghost behavior in seconds *)
}

let create_ghost x y direction color texture = {
  x = x;
  y = y;
  direction = direction;
  color = color;
  texture = texture;
}

let initial_game_state () = {
  pacman_x = 13 * tile_size;
  pacman_y = 24 * tile_size;
  direction = (0, 0);
  next_direction = (0, 0);
  target_cell = (15, 13);
  game_end = false;
  score = 0;
  ghosts = [|
    create_ghost (9 * tile_size) (12 * tile_size) (1, 0) Color.orange (load_texture "ghost_orange.png");
    create_ghost (9 * tile_size) (18 * tile_size) (1, 0) Color.red (load_texture "ghost_red.png");
    create_ghost (18 * tile_size) (12 * tile_size) (-1, 0) Color.blue (load_texture "ghost_blue.png");
    create_ghost (18 * tile_size) (18 * tile_size) (0, -1) Color.green (load_texture "ghost_pink.png");
  |];
  boost_active = false;
  boost_time_left = 0.0;
  ghost_behavior_timer = 0.0;
}

let draw_map map =
  Array.iteri (fun y row ->
    Array.iteri (fun x tile ->
      if tile = 1 then
        draw_rectangle (x * tile_size) (y * tile_size) tile_size tile_size Color.darkblue
      else if tile = 2 then
        draw_circle (x * tile_size + tile_size / 2) (y * tile_size + tile_size / 2) (float_of_int (tile_size / 8)) Color.white
      else
        draw_rectangle (x * tile_size) (y * tile_size) tile_size tile_size Color.black
    ) row
  ) map

let draw_sweets map =
  Array.iteri (fun y row ->
    Array.iteri (fun x tile ->
      if tile = 2 then
        draw_circle (x * tile_size + tile_size / 2) (y * tile_size + tile_size / 2) (float_of_int (tile_size / 8)) Color.white
      else if tile = 3 then
        draw_circle (x * tile_size + tile_size / 2) (y * tile_size + tile_size / 2) (float_of_int (tile_size / 4)) Color.yellow
      else ()
    ) row
  ) map

let is_valid_position x y =
  x >= 0 && x < Array.length map.(0) && y >= 0 && y < Array.length map

let wrap_around x max_value =
  if x < 0 then max_value - tile_size
  else if x >= max_value then 0
  else x

let move_pacman state =
  let grid_x = state.pacman_x / tile_size in
  let grid_y = state.pacman_y / tile_size in
  let next_direction = if state.pacman_x mod tile_size = 0 && state.pacman_y mod tile_size = 0 then
      let next_x = grid_x + fst state.next_direction in
      let next_y = grid_y + snd state.next_direction in
      if is_valid_position next_x next_y && map.(next_y).(next_x) <> 1 then state.next_direction else state.direction
    else
      state.direction
  in
  let target_cell = if state.pacman_x mod tile_size = 0 && state.pacman_y mod tile_size = 0 then
      let tx, ty = (grid_x + fst next_direction, grid_y + snd next_direction) in
      if is_valid_position tx ty && map.(ty).(tx) = 1 then (grid_x, grid_y) else (tx, ty)
    else
      state.target_cell
  in
  let target_x = fst target_cell * tile_size in
  let target_y = snd target_cell * tile_size in
  let pacman_x = if state.pacman_x < target_x then min (state.pacman_x + 2) target_x
    else if state.pacman_x > target_x then max (state.pacman_x - 2) target_x
    else state.pacman_x
  in
  let pacman_y = if state.pacman_y < target_y then min (state.pacman_y + 2) target_y
    else if state.pacman_y > target_y then max (state.pacman_y - 2) target_y
    else state.pacman_y
  in
  let pacman_x = wrap_around pacman_x (Array.length map.(0) * tile_size) in
  let pacman_y = wrap_around pacman_y (Array.length map * tile_size) in

  (* Check for sweets and update map and score *)
  let grid_x = pacman_x / tile_size in
  let grid_y = pacman_y / tile_size in

  let score, boost_active, boost_time_left = 
    if pacman_x mod tile_size = 0 && pacman_y mod tile_size = 0 then
      if map.(grid_y).(grid_x) = 2 then (
        map.(grid_y).(grid_x) <- 0;
        (state.score + 1, state.boost_active, state.boost_time_left)
      ) else if map.(grid_y).(grid_x) = 3 then (
        map.(grid_y).(grid_x) <- 0;
        (state.score, true, time)
      ) else (state.score, state.boost_active, state.boost_time_left)
    else (state.score, state.boost_active, state.boost_time_left)
  in
  { state with pacman_x; pacman_y; direction = next_direction; target_cell; score; boost_active; boost_time_left }

let move_ghost ghost =
  let grid_x = ghost.x / tile_size in
  let grid_y = ghost.y / tile_size in
  let direction = if ghost.x mod tile_size = 0 && ghost.y mod tile_size = 0 then
      let possible_directions = [(1, 0); (-1, 0); (0, 1); (0, -1)]
        |> List.filter (fun (dx, dy) ->
            let nx = grid_x + dx in
            let ny = grid_y + dy in
            is_valid_position nx ny && map.(ny).(nx) <> 1 && (dx, dy) <> (-fst ghost.direction, -snd ghost.direction))
      in
      if possible_directions <> [] then
        List.nth possible_directions (Random.int (List.length possible_directions))
      else
        (-fst ghost.direction, -snd ghost.direction)
    else
      ghost.direction
  in
  let x = ghost.x + fst direction * 2 in
  let y = ghost.y + snd direction * 2 in
  let x = wrap_around x (Array.length map.(0) * tile_size) in
  let y = wrap_around y (Array.length map * tile_size) in
  { ghost with x; y; direction }

let run_away_from_pacman ghost pacman =
  let speed = 2 in
  let grid_x = ghost.x / tile_size in
  let grid_y = ghost.y / tile_size in
  let pacman_x = pacman.x / tile_size in
  let pacman_y = pacman.y / tile_size in

  if (ghost.x mod tile_size = 0 && ghost.y mod tile_size = 0) then (
    (* Reverse direction of the current direction *)
    let reverse_direction = (-fst ghost.direction, -snd ghost.direction) in

    (* Add valid directions to the list, excluding the reverse direction *)
    let possible_directions =
      [(1, 0); (-1, 0); (0, 1); (0, -1)]
      |> List.filter (fun (dx, dy) ->
          let next_x = grid_x + dx in
          let next_y = grid_y + dy in
          is_valid_position next_x next_y && map.(next_y).(next_x) <> 1 && (dx, dy) <> reverse_direction
        )
    in

    (* Choose the direction that maximizes distance to Pac-Man *)
    let new_direction =
      if possible_directions <> [] then
        possible_directions
        |> List.fold_left (fun best dir ->
            let next_x = grid_x + fst dir in
            let next_y = grid_y + snd dir in
            let distance = abs (next_x - pacman_x) + abs (next_y - pacman_y) in
            match best with
            | None -> Some (dir, distance)
            | Some (_, best_distance) ->
                if distance > best_distance then Some (dir, distance) else best
          ) None
        |> Option.map fst
        |> Option.value ~default:reverse_direction
      else
        reverse_direction
    in

    (* Update the ghost's position based on the new direction *)
    let new_x = ghost.x + fst new_direction * speed in
    let new_y = ghost.y + snd new_direction * speed in

    (* Handle teleportation when going out of bounds *)
    let final_x = wrap_around new_x (Array.length map.(0) * tile_size) in
    let final_y = wrap_around new_y (Array.length map * tile_size) in

    (* Return the updated ghost *)
    { ghost with x = final_x; y = final_y; direction = new_direction }
  ) else
    (* If not at a grid intersection, continue moving in the current direction *)
    let new_x = ghost.x + fst ghost.direction * speed in
    let new_y = ghost.y + snd ghost.direction * speed in
    let final_x = wrap_around new_x (Array.length map.(0) * tile_size) in
    let final_y = wrap_around new_y (Array.length map * tile_size) in
    { ghost with x = final_x; y = final_y }

let chase_pacman ghost pacman =
  let grid_x = ghost.x / tile_size in
  let grid_y = ghost.y / tile_size in
  let pacman_x = pacman.x / tile_size in
  let pacman_y = pacman.y / tile_size in

  if (ghost.x mod tile_size = 0 && ghost.y mod tile_size = 0) then (
    (* Reverse direction of the current direction *)
    let reverse_direction = (-fst ghost.direction, -snd ghost.direction) in

    (* Add valid directions to the list, excluding the reverse direction *)
    let possible_directions =
      [(1, 0); (-1, 0); (0, 1); (0, -1)]
      |> List.filter (fun (dx, dy) ->
          let next_x = grid_x + dx in
          let next_y = grid_y + dy in
          is_valid_position next_x next_y && map.(next_y).(next_x) <> 1 && (dx, dy) <> reverse_direction
        )
    in

    (* Choose the direction that minimizes distance to Pac-Man *)
    let new_direction =
      if possible_directions <> [] then
        possible_directions
        |> List.fold_left (fun best dir ->
            let next_x = grid_x + fst dir in
            let next_y = grid_y + snd dir in
            let distance = abs (next_x - pacman_x) + abs (next_y - pacman_y) in
            match best with
            | None -> Some (dir, distance)
            | Some (_, best_distance) ->
                if distance < best_distance then Some (dir, distance) else best
          ) None
        |> Option.map fst
        |> Option.value ~default:reverse_direction
      else
        reverse_direction
    in

    (* Update the ghost's position based on the new direction *)
    let new_x = ghost.x + fst new_direction * speed in
    let new_y = ghost.y + snd new_direction * speed in

    (* Handle teleportation when going out of bounds *)
    let final_x = wrap_around new_x (Array.length map.(0) * tile_size) in
    let final_y = wrap_around new_y (Array.length map * tile_size) in

    (* Return the updated ghost *)
    { ghost with x = final_x; y = final_y; direction = new_direction }
  ) else
    (* If not at a grid intersection, continue moving in the current direction *)
    let new_x = ghost.x + fst ghost.direction * speed in
    let new_y = ghost.y + snd ghost.direction * speed in
    let final_x = wrap_around new_x (Array.length map.(0) * tile_size) in
    let final_y = wrap_around new_y (Array.length map * tile_size) in
    { ghost with x = final_x; y = final_y }

let check_collisions pacman_x pacman_y ghosts =
  Array.fold_left (fun acc (ghost, index) ->
    if acc = -1 then (
      let distance_x = abs (pacman_x - ghost.x) in
      let distance_y = abs (pacman_y - ghost.y) in
      if distance_x < tile_size / 2 && distance_y < tile_size / 2 then index else -1
    ) else acc
  ) (-1) (Array.mapi (fun index ghost -> (ghost, index)) ghosts)
  
(* Change texture to ghost_afraid when boost is active *)
let draw_ghosts ghosts boost_active =
  Array.iter (fun ghost ->
    let texture = if boost_active then load_texture "ghost_afraid.png" else ghost.texture in 
    draw_texture_v texture (Vector2.create (float_of_int ghost.x) (float_of_int ghost.y)) Color.white;
  ) ghosts

let update_game_state state =
  let state = move_pacman state in
  let boost_active, boost_time_left =
    if state.boost_active then 
      let new_time_left = state.boost_time_left -. get_frame_time () in
      if new_time_left <= 0.0 then (false, 0.0) else (true, new_time_left)
    else (state.boost_active, state.boost_time_left)
  in

  (* Update ghost behavior timer only if boost is not active *)
  let ghost_behavior_timer =
    if not boost_active then
      let new_timer = state.ghost_behavior_timer +. get_frame_time () in
      if new_timer >= 14.0 then 0.0 else new_timer  (* Reset timer after 7 seconds *)
    else
      state.ghost_behavior_timer  (* Pause the timer during boost *)
  in

  (* Determine ghost behavior based on the timer *)
  let ghosts =
    if boost_active then
      (* Ghosts run away during boost *)
      Array.map (fun ghost -> run_away_from_pacman ghost { x = state.pacman_x; y = state.pacman_y; direction = state.direction; color = Color.white; texture = ghost.texture }) state.ghosts
    else if state.ghost_behavior_timer < 7.0 then
      (* Ghosts move randomly for the first 7 seconds *)
      Array.map move_ghost state.ghosts
    else
      (* Ghosts chase Pac-Man for the next 7 seconds *)
      Array.map (fun ghost -> chase_pacman ghost { x = state.pacman_x; y = state.pacman_y; direction = state.direction; color = Color.white; texture = ghost.texture }) state.ghosts
  in

  let collision_index = check_collisions state.pacman_x state.pacman_y ghosts in
  let game_end, ghosts =
    if collision_index >= 0 then
      if boost_active then
        (* Reset the colliding ghost's position to the middle *)
        let new_ghosts = Array.mapi (fun i ghost ->
          if i = collision_index then { ghost with x = 14 * tile_size; y = 14 * tile_size; direction = (1, 0) } else ghost
        ) ghosts in
        (false, new_ghosts)
      else
        (true, ghosts)
    else
      (state.game_end, ghosts)
  in

  { state with ghosts; game_end; boost_active; boost_time_left; ghost_behavior_timer }
  
let get_rotation_angle direction =
  match direction with
  | (1, 0) -> 0.0
  | (-1, 0) -> 180.0
  | (0, 1) -> 90.0
  | (0, -1) -> 270.0
  | _ -> 0.0

let () =
  Random.self_init ();
  init_window screen_width screen_height "Pac-Man";
  set_target_fps 60;

  let background_texture = load_texture "background.png" in
  let pacman_textures = [|
    load_texture "pac_man_0.png";
    load_texture "pac_man_1.png";
    load_texture "pac_man_2.png";
    load_texture "pac_man_3.png";
  |] in

  let rec game_loop state current_frame last_update_time =
    if not (window_should_close ()) then
      let state = if not state.game_end then
          let state = if is_key_pressed Key.Right then { state with next_direction = (1, 0) }
            else if is_key_pressed Key.Left then { state with next_direction = (-1, 0) }
            else if is_key_pressed Key.Up then { state with next_direction = (0, -1) }
            else if is_key_pressed Key.Down then { state with next_direction = (0, 1) }
            else state
          in
          update_game_state state
        else
          state
      in
  
      begin_drawing ();
      clear_background Color.black;
  
      let scale_x = float_of_int screen_width /. float_of_int (Texture.width background_texture) in
      draw_texture_ex background_texture (Vector2.create 0.0 0.0) 0.0 scale_x Color.white;
      draw_sweets map;
      draw_ghosts state.ghosts state.boost_active;
      (* draw pacman depending on rotation *)
      let pacman_width = Texture.width pacman_textures.(0) in
      let pacman_height = Texture.height pacman_textures.(0) in
      
      let position = 
        match state.direction with
        | (1, 0) -> Vector2.create (float_of_int state.pacman_x) (float_of_int state.pacman_y)
        | (-1, 0) -> Vector2.create (float_of_int (state.pacman_x + pacman_width)) (float_of_int (state.pacman_y + pacman_height))
        | (0, -1) -> Vector2.create (float_of_int state.pacman_x) (float_of_int (state.pacman_y + pacman_height))
        | (0, 1) -> Vector2.create (float_of_int (state.pacman_x + tile_size)) (float_of_int state.pacman_y)
        | _ -> 
          Vector2.create 
          (float_of_int state.pacman_x)  (* Positioning Pacman at pacman_x *)
          (float_of_int state.pacman_y)  (* Positioning Pacman at pacman_y *)
        in
      let angle = get_rotation_angle state.direction in
      draw_texture_ex pacman_textures.(current_frame) position angle 1.0 Color.white;
      (* draw_texture pacman_textures.(current_frame) state.pacman_x state.pacman_y Color.white; *)
      draw_text (Printf.sprintf "Score: %d" state.score) 10 10 20 Color.yellow;
      draw_text "Pac-Man" (screen_width / 2 - 85) 3 40 Color.yellow;  (* Example of large text *)
  
      if state.game_end then
        draw_text "Game Over" (screen_width / 2 - 100) (screen_height / 2 - 20) 40 Color.red;
  
      if state.score = 292 then
        draw_text "You Win!" (screen_width / 2 - 100) (screen_height / 2 - 20) 40 Color.green;

      end_drawing ();
  
      let current_time = get_time () in
      let frame_time = current_time -. last_update_time in
      let current_frame = if frame_time >= 0.1 then (current_frame + 1) mod 4 else current_frame in
      let last_update_time = if frame_time >= 0.1 then current_time else last_update_time in
  
      game_loop state current_frame last_update_time
  in

  game_loop (initial_game_state ()) 0 (get_time ());

  unload_texture background_texture;
  Array.iter unload_texture pacman_textures;
  Array.iter (fun ghost -> unload_texture ghost.texture) (initial_game_state ()).ghosts;

  close_window ()
open Raylib

let tile_size = 40

let map = [|
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
|]
let screen_width = Array.length map.(0) * tile_size
let screen_height = Array.length map * tile_size

let pacman_x = ref (15 * tile_size)  (* Position in pixels *)
let pacman_y = ref (13 * tile_size)  (* Position in pixels *)
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
  if !pacman_y > target_y then pacman_y := max (!pacman_y - speed) target_y

let move_ghost ghost =
  let grid_x = ghost.x / tile_size in
  let grid_y = ghost.y / tile_size in

  if (ghost.x mod tile_size = 0 && ghost.y mod tile_size = 0) then (
    let possible_directions = ref [] in

    if map.(grid_y).(grid_x + 1) <> 1 then possible_directions := (1, 0) :: !possible_directions;
    if map.(grid_y).(grid_x - 1) <> 1 then possible_directions := (-1, 0) :: !possible_directions;
    if map.(grid_y + 1).(grid_x) <> 1 then possible_directions := (0, 1) :: !possible_directions;
    if map.(grid_y - 1).(grid_x) <> 1 then possible_directions := (0, -1) :: !possible_directions;

    if !possible_directions <> [] then
      ghost.direction <- List.nth !possible_directions (Random.int (List.length !possible_directions))
  );

  ghost.x <- ghost.x + fst ghost.direction * speed;
  ghost.y <- ghost.y + snd ghost.direction * speed

let check_collisions pacman_x pacman_y ghosts =
  Array.exists (fun ghost ->
    let distance_x = abs (pacman_x - ghost.x) in
    let distance_y = abs (pacman_y - ghost.y) in
    distance_x < tile_size / 2 && distance_y < tile_size / 2
  ) ghosts

(* let draw_ghosts ghosts =
  Array.iter (fun ghost ->
    Printf.printf "Drawing ghost at position: (%d, %d)\n%!" ghost.x ghost.y;
    if Raylib.is_texture_ready ghost.texture then
      draw_texture ghost.texture ghost.x ghost.y Color.white
    else
      Printf.printf "Texture not ready for ghost at position: (%d, %d)\n%!" ghost.x ghost.y
  ) ghosts *)

let () =
  init_window screen_width screen_height "Pac-Man";
  set_target_fps 60;

  let pacman_texture = load_texture "pacman.png" in  (* Load the Pac-Man sprite *)
  Printf.printf "Pacman texture loaded: %b\n%!" (Raylib.is_texture_ready pacman_texture);
  
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
    { x = 13 * tile_size; y = 7 * tile_size; direction = (1, 0); color = Color.red; texture = ghost_textures.(0) };
    { x = 14 * tile_size; y = 7 * tile_size; direction = (-1, 0); color = Color.blue; texture = ghost_textures.(1) };
    { x = 15 * tile_size; y = 7 * tile_size; direction = (0, -1); color = Color.green; texture = ghost_textures.(2) };
    { x = 16 * tile_size; y = 7 * tile_size; direction = (0, 1); color = Color.orange; texture = ghost_textures.(3) };
  |] in

  let start_time = get_time () in

  while not (window_should_close ()) do
    if is_key_pressed Key.Right then next_direction := (1, 0);
    if is_key_pressed Key.Left then next_direction := (-1, 0);
    if is_key_pressed Key.Up then next_direction := (0, -1);
    if is_key_pressed Key.Down then next_direction := (0, 1);

    move_pacman ();
    Array.iter move_ghost ghosts;

    if check_collisions !pacman_x !pacman_y ghosts then (
      print_endline "Game Over!";
      game_end := true;
    );

    let elapsed_time = get_time () -. start_time in
    
    begin_drawing ();
    clear_background Color.black;
    draw_map ();
    let pacman_width = Texture.width pacman_texture in
    let pacman_height = Texture.height pacman_texture in
    
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
    
    draw_texture_ex pacman_texture position angle 1.0 Color.white;
    
    Array.iter (fun ghost ->
      (* Printf.printf "Drawing ghost at position: (%d, %d)\n%!" ghost.x ghost.y; *)
      draw_texture ghost.texture ghost.x ghost.y Color.white
    ) ghosts;
    
    if !game_end then draw_text "GAME OVER" 200 200 150 Color.yellow else ();
    
    (* draw_circle (ghost.x + tile_size / 2) (ghost.y + tile_size / 2) (float_of_int (tile_size / 2)) ghost.color; *)

    draw_text "Pac-Man" (screen_width / 2 - 85) 3 40 Color.yellow;  (* Example of large text *)
    draw_text (Printf.sprintf "Score: %d" !score) 10 10 20 Color.red;
    draw_text (Printf.sprintf "Time: %d" (int_of_float elapsed_time)) 120 10 20 Color.red;
    (* draw_text (Printf.sprintf "Ghost position: (%d, %d)" ghost.x ghost.y) 300 10 20 Color.red; *)
    (* draw_text (Printf.sprintf "Pacman position: (%d, %d)" !pacman_x !pacman_y) 800 20 20 Color.red; *)

    end_drawing ();
  done;

  Array.iter unload_texture ghost_textures;  (* Unload the ghost textures *)
  unload_texture pacman_texture;  (* Unload the Pac-Man sprite *)
  close_window ();
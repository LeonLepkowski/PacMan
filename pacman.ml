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

let speed = 2  (* Pixels per frame *)
let score = ref 0

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

let () =
  init_window screen_width screen_height "Pac-Man";
  set_target_fps 60;

  let pacman_texture = load_texture "pacman.png" in  (* Load the Pac-Man sprite *)

  let start_time = get_time () in

  while not (window_should_close ()) do
    if is_key_pressed Key.Right then next_direction := (1, 0);
    if is_key_pressed Key.Left then next_direction := (-1, 0);
    if is_key_pressed Key.Up then next_direction := (0, -1);
    if is_key_pressed Key.Down then next_direction := (0, 1);

    move_pacman ();

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

    (* Draw the Pac-Man sprite with rotation *)
    (* let position = Vector2.create (float_of_int (!pacman_x + tile_size / 2)) (float_of_int (!pacman_y + tile_size / 2)) in *)
    
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
    
    let origin = Vector2.create (float_of_int (pacman_width / 2)) (float_of_int (pacman_height / 2)) in
    draw_texture_ex pacman_texture position angle 1.0 Color.white;

    draw_text (Printf.sprintf "Score: %d" !score) 10 10 20 Color.red;
    draw_text (Printf.sprintf "Time: %d" (int_of_float elapsed_time)) 120 10 20 Color.red;
    end_drawing ();
  done;

  unload_texture pacman_texture;  (* Unload the Pac-Man sprite *)
  close_window ();
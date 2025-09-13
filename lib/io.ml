let read_lines file =
  let lines = In_channel.with_open_bin file In_channel.input_all in
  String.split_on_char '\n' lines

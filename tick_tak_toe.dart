import 'dart:io';

List board = List.generate(9, (int index) => index + 1);
List a = [...board];
List p = [];
List winindex = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
];
showboard() {
  for (int i = 0; i < board.length; i++) {
    if ((i + 1) % 3 == 0) {
      print("  ${board[i]}   ");
      print("--------------------");
    } else {
      stdout.write("  ${board[i]}  | ");
    }
  }
}

playerTurn(choice, int pos) {
  if (board[pos - 1] == "0" || board[pos - 1] == "X") {
    print("@@@  Wrong Input value Please check before play @@@@");
    exit(0);
  } else {
    a.remove(pos);
    board[pos - 1] = choice;
    showboard();
    p.add(pos);
  }
  //print(p);
  return checkwinners(choice);
}

cpuTurn(cpu_choice) {
  print("                 CPU TURN  ");
  a.shuffle(); // it take a randam no of given list
  int posi = a[0];
  p.add(posi);
  board[posi - 1] = cpu_choice;
  showboard();
  a.remove(posi);
  return checkwinners(cpu_choice);
}

checkwinners(choice) {
  for (List winner in winindex) {
    if (board[winner[0]] == choice &&
        board[winner[1]] == choice &&
        board[winner[2]] == choice) {
      print("$choice is Winner !!!");
      return "winner";
    }
  }
}

void main() {
  showboard();
  int player_pos;
  String? player_choice, cpu_choice;
  print("Ënter Your Choice : X/0 ");
  player_choice = stdin.readLineSync()!.toUpperCase();
  if (player_choice == "X") {
    cpu_choice = "0";
  } else {
    player_choice = "0";
    cpu_choice = "X";
  }
  while (true) {
    print("Enter Player Pos (1 to 9)    :- ");
    player_pos = int.parse(stdin.readLineSync()!);
    if(player_pos>0 &&player_pos<10)
    {
      if (playerTurn(player_choice, player_pos) == "winner") {
      break;
    }
    if (cpuTurn(cpu_choice) == "winner") {
      break;
    }
    }
    else
    {
      print("Wrong Input Value Please Try Again !!");
    }
  }
}

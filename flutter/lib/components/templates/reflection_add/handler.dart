/// handler event

String text = "";

void onPressed() {
  print(text);
}

void onChanged(String t) {
  text = t;
  print(text + "!");
}

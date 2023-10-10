// Load Wi-Fi library
#include <WiFi.h>
#include <WebServer.h>

#define GPIO 32

// Replace with your network credentials
const char* ssid = "";
const char* password = "";

// Set web server port number to 80
WebServer server(80);

String page1 = "<!DOCTYPE HTML>\n<HTML>\n<H0 style='font-size:60px; color:purple;'> MI PROYECTO PHR </H0>\n<a href=\"/bitlow\"\">";
String page2 = "<button style='FONT-SIZE: 50px; HEIGHT: 200px;WIDTH: 300px; 126px; Z-INDEX: 0; TOP: 200px; background-color: #f44336; border-radius: 12px;'> APAGAR </button> </a>\n";
String page3 = "<a href=\"/bithigh\"\"> <button style='FONT-SIZE: 50px; HEIGHT: 200px;WIDTH: 300px; 126px; Z-INDEX: 0; TOP: 200px; border-radius: 12px;'> ENCENDER </button> </a>\n</html>\n";

void setup() {
  Serial.begin(115200);
  // Initialize the output variables as outputs

  pinMode (GPIO, OUTPUT);

  // Connect to Wi-Fi network with SSID and password
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  // Print local IP address and start web server
  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());


  //Gestiona cada petición al servidor página home
  server.on("/", homePage);

  //Gestiona cada petición al servidor página para una opción
  server.on("/bithigh", bithigh);

  //Gestiona cada petición al servidor página para otra opción
  server.on("/bitlow", bitlow);
  
  //Recurso no encontrado
  server.onNotFound(peticionNotFound); 
  
  server.begin();
}

void loop(){
  server.handleClient();
}

void peticionNotFound(){
  server.send(404, "text/plain", "Not found");
}

void homePage() {
  server.send(200, "text/html", page1+page2+page3);
}

void bithigh() {
  digitalWrite(GPIO, HIGH);
  server.send(200, "text/html", page1+page2+page3);
}

void bitlow() {
  digitalWrite(GPIO, LOW);
  server.send(200, "text/html", page1+page2+page3);
}

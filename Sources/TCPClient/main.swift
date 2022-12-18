let client = TCPClient(host: "localhost", port: 3010)
do {
    try client.start()
} catch let error {
    print("Error: \(error.localizedDescription)")
    client.stop()
}

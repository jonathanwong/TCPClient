let client = TCPClient(host: "localhost", port: 8889)
do {
    try client.start()
} catch let error {
    print("Error: \(error.localizedDescription)")
    client.stop()
}

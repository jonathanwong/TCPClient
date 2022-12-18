//
//  ClientHandler.swift
//  TCPClient
//
//  Created by Jonathan Wong on 4/23/18.
//

import Foundation
import NIO

class TCPClientHandler: ChannelInboundHandler {
    public typealias InboundIn = ByteBuffer
    public typealias OutboundOut = ByteBuffer
    private var numBytes = 0
    
    // channel is connected, send a message
    public func channelActive(context: ChannelHandlerContext) {
        let message = "SwiftNIO rocks!"
        var buffer = context.channel.allocator.buffer(capacity: message.utf8.count)
        buffer.writeString(message)
        context.writeAndFlush(wrapOutboundOut(buffer), promise: nil)
    }
    
    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        var buffer = unwrapInboundIn(data)
        let readableBytes = buffer.readableBytes
        if let received = buffer.readString(length: readableBytes) {
            print(received)
        }
        if numBytes == 0 {
            print("nothing left to read, close the channel")
            context.close(promise: nil)
        }
    }
    
    public func errorCaught(context: ChannelHandlerContext, error: Error) {
        print("error: \(error.localizedDescription)")
        context.close(promise: nil)
    }
}

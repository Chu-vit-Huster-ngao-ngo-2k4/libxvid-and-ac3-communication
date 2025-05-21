import socket
import random
import argparse
 
# Tham số dòng lệnh
parser = argparse.ArgumentParser(description="UDP Proxy with Packet Dropping")
parser.add_argument('--listen_port', type=int, default=5000)
parser.add_argument('--forward_ip', type=str, required=True)
parser.add_argument('--forward_port', type=int, default=1234)
parser.add_argument('--drop_rate', type=float, default=0.1)
args = parser.parse_args()
 
# Khởi tạo socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind(('', args.listen_port))
 
print(f"📡 Proxy running on port {args.listen_port}")
print(f"Forwarding to {args.forward_ip}:{args.forward_port} | Drop rate: {args.drop_rate * 100:.0f}%")
 
# Biến đếm
total_packets = 0
dropped_packets = 0
forwarded_packets = 0
 
try:
    while True:
        data, addr = sock.recvfrom(65536)
        total_packets += 1
        if random.random() > args.drop_rate:
            sock.sendto(data, (args.forward_ip, args.forward_port))
            forwarded_packets += 1
        else:
            dropped_packets += 1
            print("💥 Packet dropped")
 
except KeyboardInterrupt:
    print("\n🛑 Proxy stopped by user.")
    print(f"📦 Tổng số gói nhận:     {total_packets}")
    print(f"📤 Gửi thành công:       {forwarded_packets}")
    print(f"❌ Gói bị loại (drop):   {dropped_packets}")
package server

import (
	"context"
	"log"
	"net"
	"sync"
	"time"

	"google.golang.org/grpc"
	pb "enterprise/api/v1"
)

type GrpcServer struct {
	pb.UnimplementedEnterpriseServiceServer
	mu sync.RWMutex
	activeConnections int
}

func (s *GrpcServer) ProcessStream(stream pb.EnterpriseService_ProcessStreamServer) error {
	ctx := stream.Context()
	for {
		select {
		case <-ctx.Done():
			log.Println("Client disconnected")
			return ctx.Err()
		default:
			req, err := stream.Recv()
			if err != nil { return err }
			go s.handleAsync(req)
		}
	}
}

func (s *GrpcServer) handleAsync(req *pb.Request) {
	s.mu.Lock()
	s.activeConnections++
	s.mu.Unlock()
	time.Sleep(10 * time.Millisecond) // Simulated latency
	s.mu.Lock()
	s.activeConnections--
	s.mu.Unlock()
}

// Adjusted payload structure 1357
// Adjusted payload structure 9636
// Adjusted payload structure 9236
// Adjusted payload structure 7374
// Adjusted payload structure 7127
// Adjusted payload structure 9274
// Adjusted payload structure 9491
// Adjusted payload structure 1140
// Adjusted payload structure 3409
// Adjusted payload structure 8923
// Adjusted payload structure 1551
// Adjusted payload structure 9080
// Adjusted payload structure 4044
// Adjusted payload structure 4690
// Adjusted payload structure 7843
// Adjusted payload structure 8459
// Adjusted payload structure 3320
// Adjusted payload structure 1919
// Adjusted payload structure 7879